structure Bindings =
struct
    exception varNotFound;

    datatype bind = 
        varBinding of string * string * string * int
    |   subDecBinding of string * string * string * int;

    (* Offset counters *)
    val classStaticCount = ref 0;
    val classFieldCount = ref 0;
    val funArgumentCount = ref 0;
    val funVarCount = ref 0;

    (* Binding lists for class variables, function variables and subroutine declarations *)
    val classVars = ref ([]:bind list);
    val funcVars = ref([]:bind list);
    val subDecs = ref([]:bind list);

    (* 
        Adds a class variable to classVars list.
    *)
    fun addClassVar(id, kind, varType) = (
        if kind = "static" then 
        (
            classVars := varBinding(id, "static", varType, !classStaticCount)::(!classVars);
            classStaticCount := !classStaticCount + 1
        )
        else
        (
            classVars := varBinding(id, "this", varType, !classFieldCount)::(!classVars);
            classFieldCount := !classFieldCount + 1
        )
    )

    (*
        Adds a function local variable to funcVars list.
    *)
    fun addFuncVar(id, kind, varType) = (
        if kind = "argument" then 
        (
            funcVars := varBinding(id, "argument", varType, !funArgumentCount)::(!funcVars);
            funArgumentCount := !funArgumentCount + 1
        )
        else
        (
            funcVars := varBinding(id, "local", varType, !funVarCount)::(!funcVars);
            funVarCount := !funVarCount + 1
        )
    )

    (* 
        Adds a subroutine declaration to subDecs.
    *)
    fun addSubDec(id, subType, retType, nParams) = (
        if subType = "method" then subDecs := subDecBinding(id, subType, retType, nParams + 1)::(!subDecs)
        else subDecs := subDecBinding(id, subType, retType, nParams)::(!subDecs)
    )

    (* 
        Searches a list for a varBinding.
    *)
    fun varBoundTo(name, []) = raise varNotFound
    |   varBoundTo(name, varBinding(id, kind, varType, offset)::nil) = 
            if name = id then (kind, varType, offset)
            else raise varNotFound
    |   varBoundTo(name, varBinding(id, kind, varType, offset)::t) = 
            if name = id then (kind, varType, offset)
            else varBoundTo(name, t)

    (*
        Searches a list for a subDecBinding.
    *)
    fun subDecBoundTo(name, []) = raise varNotFound
    |   subDecBoundTo(name, subDecBinding(id, subType, retType, nArgs)::t) = 
            if name = id then (id, subType, retType, nArgs)
            else subDecBoundTo(name, t)

    (* 
        General search for a varBinding. Can either be an
        argument or class variable.

        Searches function variables and parameters, then
        searches class variables. Raises a varNotFound
        exception if the class variable doesn't exist.
    *)
    fun findBinding(id) = (
        varBoundTo(id, !funcVars) handle varNotFound =>
        varBoundTo(id, !classVars)
    )

    (* 
        Finds a subroutine local variable binding.
        (For use in functionCall.)
    *)
    fun findSubLocalVar(id) = (
        varBoundTo(id, !funcVars)
    )

    (* 
        Finds a subroutine declaration binding.
    *)
    fun findSubDecBinding(id) = (
        subDecBoundTo(id, !subDecs)
    )

    (* 
        Returns true if a class variable exists, false if not.
    *)
    fun classVarBindingExists(id) =
        let fun helper(name, []) = false
        |   helper(name, varBinding(id, kind, varType, offset)::nil) = 
                if name = id then true
                else false
        |   helper(name, varBinding(id, kind, varType, offset)::t) = 
                if name = id then true
                else helper(name, t)
    in
        helper(id, !classVars)
    end

    (*
        Returns true if a subroutine declaration exists, false if not.
    *)
    fun subDecBindingExists(id) =
        let fun helper(name, []) = false
        |   helper(name, subDecBinding(id, subType, retType, nArgs)::nil) = 
                if name = id then true
                else false
        |   helper(name, subDecBinding(id, subType, retType, nArgs)::t) = 
                if name = id then true
                else helper(name, t)
    in
        helper(id, !subDecs)
    end

    (* 
        Returns true if a subroutine local variable exists, false if not.
    *)
    fun subLocalVarExists(id) = 
        let fun idEquals(_, []) = false
            |   idEquals(id, varBinding(name, kind, varType, offset)::nil) =
                    if id = name then true else false
            |   idEquals(id, varBinding(name, kind, varType, offset)::t) =
                    if id = name then true else idEquals(id, t)
        in
            idEquals(id, !funcVars)
        end

    (* 
        Helper function for methods.
    *)
    fun incArgCount() =
        funArgumentCount := !funArgumentCount + 1

    (*
        Returns the number of parameters.
        Only call immediately after parameter bindings have
        been generated. (I guess it could check for kind = "argument".)
    *)
    fun getNumParams() = List.length(!funcVars)

    (* 
        Returns the number of fields in a class.
        Called when compiling a constructor subroutine.
    *)
    fun getNumFields() = !classFieldCount

    (* 
        Returns the number of local variables in a subroutine.
        Called after bindings have been created for the first line
        of the subroutine VM code declaration.
    *)
    fun getNumFunVars() = !funVarCount;

    (* 
        Removes all of the bindings associated with a subroutine.
    *)
    fun clearFunBindings() = (
        funcVars := [];
        funArgumentCount := 0;
        funVarCount := 0
    )
end