structure calc =
struct
    open calcAS;
    open Bindings;
    open LabelGenerator;
    
    exception Unimplemented;

    structure calcLrVals = calcLrValsFun(structure Token = LrParser.Token)       
    structure calcLex = calcLexFun(structure Tokens = calcLrVals.Tokens)
    structure calcParser = Join(structure Lex= calcLex
                                structure LrParser = LrParser
                                structure ParserData = calcLrVals.ParserData)                     
    
    val input_line =
        fn f =>
        let val sOption = TextIO.inputLine f
        in
            if isSome(sOption) then
                Option.valOf(sOption)
            else
               ""
        end

    val calcparse = 
        fn filename =>
        let val instrm = TextIO.openIn filename
            val lexer = calcParser.makeLexer(fn i => input_line instrm)
            val _ = calcLex.UserDeclarations.pos := 1
            val error = fn (e,i:int,_) => 
                               TextIO.output(TextIO.stdOut," line " ^ (Int.toString i) ^ ", Error: " ^ e ^ "\n")
        in 
            calcParser.parse(30,lexer,error,()) before TextIO.closeIn instrm
        end
    
    (*=======================================
        Code Writing Functions
    ========================================*)

    fun codeWrite(f, str) =
        TextIO.output(f, str);

    fun codeWriteln(f, str) =
        TextIO.output(f, str ^ "\n");

    (*=======================================
        Printing and Helper Functions
    ========================================*)

    fun printError(str) =
        TextIO.output(TextIO.stdOut, "JACK: [ERROR]\t" ^ str ^ "\n");

    fun printDebug(str) =
        TextIO.output(TextIO.stdOut, "JACK: [DEBUG]\t" ^ str ^ "\n");

    fun getClassName(str) = 
    let val lst = String.explode(str)
        val head = List.hd(lst)
    in
        if head = #"." then ""
        else Char.toString(head) ^ getClassName(String.implode(List.tl(lst)))
    end

    (*=======================================
        Generate class variable bindings
    ========================================*)

    fun genHelper(classVarList(kind, vtype, lst)) =
        let fun genBinding(classVar(id)::nil, os) = (
            printDebug("Adding class variable " ^ id);
            addClassVar(id, kind, vtype)
        )
        |       genBinding(classVar(id)::t, os) = (
                printDebug("Adding class variable " ^ id);
                addClassVar(id, kind, vtype);
                genBinding(t, os + 1)
            )
        in
            genBinding(lst, 0)
        end

    fun genClassVarBindings(classVarDec(h::t)) =
        let fun helper(classVarList(cvtype, vtype, varList)::nil) = 
            genHelper(classVarList(cvtype, vtype, varList))
        | helper(h::t) = (genHelper(h); helper(t))
        in
            helper(h::t)
        end
        | genClassVarBindings(classVarDec([])) = ()
    
    (*=======================================
        Generate subroutine declaration bindings
    ========================================*)

    fun genSubDecBindings(subroutineDec(lst), className) =
        (* Loop through each subroutine and create declaration binding *)
        let fun helper([]) = ()
            |   helper(subroutine(subType, retType, id, paramList(lst), 
                    subBody(varDecs, _))::nil) = (
                        addSubDec(id, subType, retType, List.length(lst))
                    )
                    
            |   helper(subroutine(subType, retType, id, paramList(lst),
                    subBody(varDecs, _))::t) = (
                    addSubDec(id, subType, retType, List.length(lst));
                    helper(t)
                )
        in
            helper(lst)
        end

    (*=======================================
        Generate subroutine argument bindings
    ========================================*)

    fun paramHelper([]) = ()
        | paramHelper(param(ptype, id)::nil) = (
            printDebug("Adding subroutine argument " ^ id);
            addFuncVar(id, "argument", ptype)
        )
        | paramHelper(param(ptype, id)::t) = (
            printDebug("Adding subroutine argument " ^ id);
            addFuncVar(id, "argument", ptype);
            paramHelper(t)
        )

    fun genParamBindings(subType, params) = (
        if subType = "method" then (
            incArgCount()   (* inc nArgs if subroutine is method *)
        ) else ();
        paramHelper(params)
    )

    (*=======================================
        Generate subroutine local variable bindings
    ========================================*)

    fun genSubHelper(subVarDecList(varType, lst)) =
        let fun genBinding(subVar(id)::nil) = (
                printDebug("Adding subroutine local " ^ id);
                addFuncVar(id, "local", varType)
            )
            |   genBinding(subVar(id)::t) = (
                printDebug("Adding subroutine local " ^ id);
                addFuncVar(id, "local", varType);
                genBinding(t)
            )
        in
            genBinding(lst)
        end
    
    fun genSubVarBindings(subVarDec(varDecs)) =
        let fun helper([]) = ()
            | helper(subVarDecList(vtype, varDecs)::nil) = 
                genSubHelper(subVarDecList(vtype, varDecs))
            | helper(h::t) = (
                genSubHelper(h); helper(t)
            )
            in
                helper(varDecs)
            end

    (*=======================================
        Class Codegen
    ========================================*)

    fun codegen(class(name, varDecs, subDec), outfile, b, offset, className) =
        let val _ = printDebug("Compiling class " ^ name)
            (* Generate bindings for class variables *)
            val _ = genClassVarBindings(varDecs)
        in
            codegen(subDec, outfile, b, offset, className)
        end

    (*=======================================
        SubroutineDec Codegen
    ========================================*)

    | codegen(subroutineDec(subDecs), out, b, off, className ) =
        (* Generate bindings for subroutine parameters and local variables *)
        let val _ = genSubDecBindings(subroutineDec(subDecs), className)
        (* Helper function to loop through each subroutine in subDecs *)
        fun genSub([]) = ()
        |   genSub(subroutine(stype, rtype, id, paramLst, subbody)::nil) = (
                codegen(subroutine(stype, rtype, id, paramLst, subbody), out,b,off, className);
                resetLabels()
        )
        |   genSub(h::t) = (
                codegen(h, out,b,off, className);
                clearFunBindings();     (* Clear subroutine variable bindings *)
                resetLabels();          (* Reset statement labels *)
                genSub(t)
            )
        in
            (* Loop through each subroutine declaration and call codegen *)
            genSub(subDecs)
        end

    (*=======================================
        Subroutine Codegen
    ========================================*)

    | codegen(subroutine(subType, returnType, id, paramList(params), subBody(varDecs, subStatements)), out, b, off, className) =
        let val _ = genParamBindings(subType, params)       (* Generate bindings for parameters *)
            val _ = genSubVarBindings(varDecs)              (* Generate bindings for local variables *)
            val nParams = getNumParams()
            val nLocalVars = getNumFunVars()                (* Get number of local variables *)
            val nFields = getNumFields()
        in
            printDebug("Compiling subroutine " ^ id);

            codeWriteln(out, "function " ^ className ^ "." ^ id ^ " " ^ Int.toString(nLocalVars));

            (* If subroutine is a method *)
            if subType = "method" then (
                codeWriteln(out, "push argument 0");
                codeWriteln(out, "pop pointer 0")
            ) 
            (* If subroutine is a constructor *)
            else if subType = "constructor" then (
                codeWriteln(out, "push constant " ^ Int.toString(nFields));
                codeWriteln(out, "call Memory.alloc 1");
                codeWriteln(out, "pop pointer 0")
            ) else ();
            
            (* Generate the body of the subroutine *)
            codegen(subBody(varDecs, subStatements), out,b,off, className)
        end
    
    (*=======================================
        SubBody Codegen
    ========================================*)

    | codegen(subBody(varDecs, subStatements), out,b,off, className) =
        codegen(subStatements, out,b,off, className)

    (*=======================================
        Statements Codegen
    ========================================*)

    | codegen(statements(statementLst), out,b,off, className) =
        (* Helper function to generate each statement *)
        let fun genStatements([]) = ()
        |   genStatements(substatement::nil) = 
                codegen(substatement, out,b,off, className)
        |   genStatements(h::t) = (
                codegen(h, out,b,off, className); 
                genStatements(t)
            )
        in
            genStatements(statementLst)
        end

    (*=======================================
        LetStatement Codegen
    ========================================*)

    | codegen(letStatement(id, expr), out,b,off, className) =
        let val (kind, varType, offset) = findBinding(id)
        in
            codegen(expr, out,b,off, className);
            codeWriteln(out, "pop " ^ kind ^ " " ^ Int.toString(offset))
        end

    (*=======================================
        LetIndexStatement Codegen
    ========================================*)

    | codegen(letIndexStatement(id, e1, e2), out,b,off, className) =
        let val (kind, varType, offset) = findBinding(id)
        in
            codegen(e1, out,b,off, className);
            codegen(varName(id), out,b,off, className);
            codeWriteln(out, "add");
            codegen(e2, out,b,off, className);
            codeWriteln(out, "pop temp 0");
            codeWriteln(out, "pop pointer 1");
            codeWriteln(out, "push temp 0");
            codeWriteln(out, "pop that 0")
        end

    (*=======================================
        IfStatement Codegen
    ========================================*)

    | codegen(ifStatement(expr, stmts), out,b,off, className) =
        let val lab = nextIfElse()
        in
            codegen(expr, out,b,off, className);
            codeWriteln(out, "if-goto IF_TRUE" ^ lab);
            codeWriteln(out, "goto IF_FALSE" ^lab);
            codeWriteln(out, "label IF_TRUE" ^lab);
            codegen(stmts, out,b,off, className);
            codeWriteln(out, "label IF_FALSE" ^lab)
        end

    (*=======================================
        IfElse Statement Codegen
    ========================================*)

    | codegen(ifElseStatement(expr, stmts1, stmts2), out,b,off, className) =
        let val lab = nextIfElse()
        in
            codegen(expr, out,b,off, className);
            codeWriteln(out, "if-goto IF_TRUE" ^ lab);
            codeWriteln(out, "goto IF_FALSE" ^lab);
            codeWriteln(out, "label IF_TRUE" ^lab);
            codegen(stmts1, out,b,off, className);
            codeWriteln(out, "goto IF_END" ^lab);
            codeWriteln(out, "label IF_FALSE" ^lab);
            codegen(stmts2, out,b,off, className);
            codeWriteln(out, "label IF_END" ^lab)
        end

    (*=======================================
        WhileStatement Codegen
    ========================================*)

    | codegen(whileStatement(expr, stmts), out,b,off, className) =
        let val lab = nextWhile()
        in
            codeWriteln(out, "label WHILE_EXP" ^ lab);
            codegen(expr, out,b,off, className);
            codeWriteln(out, "not");
            codeWriteln(out, "if-goto WHILE_END" ^ lab);
            codegen(stmts, out,b,off, className);
            codeWriteln(out, "goto WHILE_EXP" ^ lab);
            codeWriteln(out, "label WHILE_END" ^ lab)
        end

    (*=======================================
        DoStatement Codegen
    ========================================*)

    | codegen(doStatement(subCall), out,b,off, className) = (
        codegen(subCall, out,b,off, className);
        codeWriteln(out, "pop temp 0")
    )

    (*=======================================
        UExpression Codegen
    ========================================*)

    | codegen(uExpression(expr), out,b,off, className) =
        codegen(expr, out,b,off, className)

    (*=======================================
        Expression Codegen
    ========================================*)

    | codegen(expression(biOp, t, expr), out,b,off, className) = (
        (* Codegen Term *)
        codegen(t, out,b,off, className);
        (* Codegen Expression *)
        codegen(expr, out,b,off, className);
        (* Codegen BinaryOp *)
        codegen(biOp, out,b,off, className)
    )

    (*=======================================
        ExpressionList Codegen
    ========================================*)

    | codegen(expressionList(exprs), out,b,off, className) =
        (* Helper function to generate expressions *)
        let fun genExpr([]) = ()
            |   genExpr(h::nil) = codegen(h, out,b,off, className)
            |   genExpr(h::t) = (
                codegen(h, out,b,off, className);
                genExpr(t)
            )
        in
            genExpr(exprs)
        end

    (*=======================================
        MethodCall Codegen
    ========================================*)

    | codegen(methodCall(id, exprList), out,b,off, className) = 
        let val (id, subType, retType, nArgs) = findSubDecBinding(id)
        in
            codeWriteln(out, "push pointer 0");
            codegen(exprList, out,b,off, className);
            codeWriteln(out, "call " ^ className ^ "." ^ id ^ " " ^ Int.toString(nArgs))
        end

    (*=======================================
        FunctionCall Codegen
    ========================================*)

    (* NOTE: most error handling is ignored *)

    | codegen(functionCall(id, subName, expressionList(exprs)), out,b,off, className) =
    let val nArgs = List.length(exprs)
    in
        (* If the name of the variable is the name of the class *)
        if id = className then
            if subDecBindingExists(subName) then
                let val (subID, subType, retType, nArgs) = findSubDecBinding(subName)
                in
                    codegen(expressionList(exprs), out,b,off, className);
                    codeWriteln(out, "call " ^ id ^ "." ^ subName ^ " " ^ Int.toString(nArgs))
                end
            else ()
        else (
            (* If the variable name is a local variable *)
            if subLocalVarExists(id) = true then
                let val (subLocalKind, subLocalType, subLocalOffset) = findSubLocalVar(id)
                    val (subID, subType, retType, nArgs) = findSubDecBinding(subName)
                    handle _ => ("", "0", "", 0)
                in
                    if subLocalType = className then
                        if subType = "constructor" then
                            printError(className ^ "." ^ subID ^ " is not declared as a method.")
                        else if subType = "function" then
                            printError(className ^ "." ^ subID ^ " is not declared as a method.")
                        else if subType = "0" then
                            printError("Method " ^ className ^ "." ^ subName ^ " does not exist.")
                        else (
                            codegen(varName(id), out,b,off, className);
                            codegen(expressionList(exprs), out,b,off, className);
                            codeWriteln(out, "call " ^ className ^ "." ^ subName ^ " " ^ Int.toString(nArgs))
                        )
                    else (
                        codegen(varName(id), out,b,off, className);
                        codegen(expressionList(exprs), out,b,off, className);
                        codeWriteln(out, "call " ^ subLocalType ^ "." ^ subName  ^ " " ^ Int.toString(List.length(exprs) + 1))
                    )
                end
            else (
                (* If a binding exists for the variable, it must be a class variable *)
                if classVarBindingExists(id) = true then (
                    let val (kind, varType, offset) = findBinding(id)
                    in
                        codegen(varName(id), out,b,off, className);
                        codegen(expressionList(exprs), out,b,off, className);
                        codeWriteln(out, "call " ^ varType ^ "." ^ subName ^ " " ^ Int.toString(nArgs + 1))
                    end
                )
                (* If binding doesn't exist, then assume it's an external class name *)
                else (
                    codegen(expressionList(exprs), out,b,off, className);
                    codeWriteln(out, "call " ^ id ^ "." ^ subName ^ " " ^ Int.toString(nArgs))
                )
            )
        )
    end

    (*=======================================
        VarIndex Codegen
    ========================================*)

    | codegen(varIndex(id, expr), out,b,off, className) =
    let val (varKind, varType, varOffset) = findBinding(id)
    in
        codegen(expr, out,b,off, className);
        codeWriteln(out, "push " ^ varKind ^ " " ^ Int.toString(varOffset));
        codeWriteln(out, "add");
        codeWriteln(out, "pop pointer 1");
        codeWriteln(out, "push that 0")
    end

    (*=======================================
        UnaryOp Codegen
    ========================================*)

    | codegen(unaryOp(unOp, t), out,b,off, className) = (
        (* Codegen Term *)
        codegen(t, out,b,off, className);
        (* Write out output for UnaryOp (from grammar) *)
        codeWriteln(out, unOp)
    )

    (*=======================================
        BinaryOp Codegen
    ========================================*)

    | codegen(binaryOp(biOp), out,b,off, className) = 
        codeWriteln(out, biOp)

    (*=======================================
        IntConstant Codegen
    ========================================*)

    | codegen(intConstant(i), out,b,off, className) = 
        codeWriteln(out, "push constant " ^ Int.toString(i))

    (*=======================================
        StrConstant Codegen
    ========================================*)

    | codegen(strConstant(s), out,b,off, className) =
    let val exploded = String.explode(s)
        (* Strip string of quotation marks *)
        val stripped = List.take(List.drop(exploded, 1), List.length(exploded)-2)
        fun printAscii([]) = ()
        |   printAscii(c::nil) = (
            codeWriteln(out, "push constant " ^ Int.toString(Char.ord(c)));
            codeWriteln(out, "call String.appendChar 2")
        )
        |   printAscii(h::t) = (
            codeWriteln(out, "push constant " ^ Int.toString(Char.ord(h)));
            codeWriteln(out, "call String.appendChar 2");
            printAscii(t)
        )
    in
        codeWriteln(out, "push constant " ^ Int.toString(List.length(stripped)));
        codeWriteln(out, "call String.new 1");
        printAscii(stripped)
    end

    (*=======================================
        ReturnExpression Codegen
    ========================================*)

    | codegen(returnExpression(expr), out,b,off, className) = (
        codegen(expr, out,b,off, className);
        codeWriteln(out, "return")
    )

    (*=======================================
        Return Codegen
    ========================================*)

    | codegen(return, out,b,off, className) = (
        codeWriteln(out, "push constant 0");
        codeWriteln(out, "return")
    )

    (*=======================================
        KeywordConstant Codegen
    ========================================*)

    | codegen(keywordConstant(kw), out,b,off, className) = (
        if kw = "true" then (
            codeWriteln(out, "push constant 0");
            codeWriteln(out, "not")
        )
        else if kw = "false" then codeWriteln(out, "push constant 0")
        else if kw = "this" then codeWriteln(out, "push pointer 0")
        else if kw = "null" then codeWriteln(out, "push constant 0")
        else printError("Parse error.")
    )

    (*=======================================
        Precendence Codegen
    ========================================*)

    | codegen(precedence(expr), out,b,off, className) =
        codegen(expr, out,b,off, className)

    (*=======================================
        VarName Codegen
    ========================================*)

    | codegen(varName(id), out,b,off, className) =
    let val (varKind, varType, varOffset) = findBinding(id)
    in
        codeWriteln(out, "push " ^ varKind ^ " " ^ Int.toString(varOffset))
    end

    | codegen(_,outFile,b,offset,depth) = (
        printError("Attempting to compile and expression not supported.");
        raise Unimplemented
    ) 
    
    ;            

    (*=======================================
        Main
    ========================================*)

    fun compile filename  = 
        let val (ast, _) = calcparse filename
            val className = getClassName(filename)
            val outFile = TextIO.openOut(className ^ ".vm")
        in
            codegen(ast, outFile, [], 0, className);
            TextIO.closeOut(outFile)
        end
        handle _ => (printError("An error occured while compiling.")); 
             
       
     fun run(a,b::c) = (compile b; OS.Process.success)
       | run(a,b) = (TextIO.print("usage: sml @SMLload=calc\n");
                     OS.Process.success)
end


