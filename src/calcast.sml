structure calcAS = 
struct

datatype
    AST = class of string * AST * AST
        | classVarDec of AST list
        | classVarList of string * string * AST list
        | classVar of string
        | subroutineDec of AST list
        | subroutine of string * string * string * AST * AST
        | paramList of AST list
        | param of string * string
        | subBody of AST * AST      (* subVarDec and statements *)
        | subVarDec of AST list
        | subVarDecList of string * AST list
        | subVar of string
        | statements of AST list    (* list of statements *)
        | letStatement of string * AST
        | letIndexStatement of string * AST * AST
        | ifStatement of AST * AST (* expression and statements *)
        | ifElseStatement of AST * AST * AST (* expr and two statements *)
        | whileStatement of AST * AST (* expr and statements *)
        | doStatement of AST (* subroutine call *)
        | returnStatement of AST (* but expr optional.. *)
        | uExpression of AST
        | expression of AST * AST * AST (* biOp, term, expr *)
        | expressionList of AST list
        | term of AST
        | varIndex of string * AST
        | intConstant of int
        | strConstant of string
        | keywordConstant of string
        | methodCall of string * AST
        | functionCall of string * string * AST (* xxx.funcName(exprs) *)
        | binaryOp of string
        | unaryOp of string * AST
        | varName of string
        | precedence of AST
        | return 
        | returnExpression of AST
        | null
        ;
end;


