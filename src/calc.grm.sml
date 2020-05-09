functor calcLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : calc_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(* calc.grm - parser spec *)

open calcAS;
open Bindings;


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\001\000\151\000\000\000\
\\001\000\002\000\003\000\000\000\
\\001\000\003\000\152\000\004\000\152\000\005\000\152\000\006\000\010\000\
\\007\000\009\000\024\000\152\000\000\000\
\\001\000\003\000\153\000\004\000\153\000\005\000\153\000\024\000\153\000\000\000\
\\001\000\003\000\154\000\004\000\154\000\005\000\154\000\006\000\010\000\
\\007\000\009\000\024\000\154\000\000\000\
\\001\000\003\000\155\000\004\000\155\000\005\000\155\000\006\000\155\000\
\\007\000\155\000\024\000\155\000\000\000\
\\001\000\003\000\156\000\004\000\156\000\005\000\156\000\006\000\156\000\
\\007\000\156\000\024\000\156\000\000\000\
\\001\000\003\000\177\000\004\000\177\000\005\000\177\000\024\000\177\000\000\000\
\\001\000\003\000\021\000\004\000\020\000\005\000\019\000\024\000\165\000\000\000\
\\001\000\003\000\021\000\004\000\020\000\005\000\019\000\024\000\167\000\000\000\
\\001\000\008\000\181\000\017\000\181\000\018\000\181\000\019\000\181\000\
\\021\000\181\000\022\000\181\000\024\000\181\000\000\000\
\\001\000\008\000\182\000\017\000\182\000\018\000\182\000\019\000\182\000\
\\021\000\182\000\022\000\182\000\024\000\182\000\000\000\
\\001\000\008\000\047\000\017\000\178\000\018\000\178\000\019\000\178\000\
\\021\000\178\000\022\000\178\000\024\000\178\000\000\000\
\\001\000\008\000\047\000\017\000\180\000\018\000\180\000\019\000\180\000\
\\021\000\180\000\022\000\180\000\024\000\180\000\000\000\
\\001\000\009\000\159\000\010\000\159\000\011\000\159\000\044\000\159\000\000\000\
\\001\000\009\000\160\000\010\000\160\000\011\000\160\000\044\000\160\000\000\000\
\\001\000\009\000\168\000\010\000\168\000\011\000\168\000\012\000\168\000\
\\044\000\168\000\000\000\
\\001\000\009\000\169\000\010\000\169\000\011\000\169\000\012\000\169\000\
\\044\000\169\000\000\000\
\\001\000\009\000\170\000\010\000\170\000\011\000\170\000\012\000\170\000\
\\044\000\170\000\000\000\
\\001\000\009\000\015\000\010\000\014\000\011\000\013\000\012\000\025\000\
\\044\000\012\000\000\000\
\\001\000\009\000\015\000\010\000\014\000\011\000\013\000\026\000\176\000\
\\044\000\012\000\000\000\
\\001\000\009\000\015\000\010\000\014\000\011\000\013\000\044\000\012\000\000\000\
\\001\000\013\000\223\000\014\000\223\000\015\000\223\000\016\000\223\000\
\\025\000\223\000\033\000\223\000\041\000\223\000\042\000\223\000\
\\043\000\223\000\044\000\223\000\000\000\
\\001\000\013\000\224\000\014\000\224\000\015\000\224\000\016\000\224\000\
\\025\000\224\000\033\000\224\000\041\000\224\000\042\000\224\000\
\\043\000\224\000\044\000\224\000\000\000\
\\001\000\013\000\225\000\014\000\225\000\015\000\225\000\016\000\225\000\
\\025\000\225\000\033\000\225\000\041\000\225\000\042\000\225\000\
\\043\000\225\000\044\000\225\000\000\000\
\\001\000\013\000\226\000\014\000\226\000\015\000\226\000\016\000\226\000\
\\025\000\226\000\033\000\226\000\041\000\226\000\042\000\226\000\
\\043\000\226\000\044\000\226\000\000\000\
\\001\000\013\000\227\000\014\000\227\000\015\000\227\000\016\000\227\000\
\\025\000\227\000\033\000\227\000\041\000\227\000\042\000\227\000\
\\043\000\227\000\044\000\227\000\000\000\
\\001\000\013\000\228\000\014\000\228\000\015\000\228\000\016\000\228\000\
\\025\000\228\000\033\000\228\000\041\000\228\000\042\000\228\000\
\\043\000\228\000\044\000\228\000\000\000\
\\001\000\013\000\229\000\014\000\229\000\015\000\229\000\016\000\229\000\
\\025\000\229\000\033\000\229\000\041\000\229\000\042\000\229\000\
\\043\000\229\000\044\000\229\000\000\000\
\\001\000\013\000\230\000\014\000\230\000\015\000\230\000\016\000\230\000\
\\025\000\230\000\033\000\230\000\041\000\230\000\042\000\230\000\
\\043\000\230\000\044\000\230\000\000\000\
\\001\000\013\000\231\000\014\000\231\000\015\000\231\000\016\000\231\000\
\\025\000\231\000\033\000\231\000\041\000\231\000\042\000\231\000\
\\043\000\231\000\044\000\231\000\000\000\
\\001\000\013\000\232\000\014\000\232\000\015\000\232\000\016\000\232\000\
\\025\000\232\000\033\000\232\000\041\000\232\000\042\000\232\000\
\\043\000\232\000\044\000\232\000\000\000\
\\001\000\013\000\233\000\014\000\233\000\015\000\233\000\016\000\233\000\
\\025\000\233\000\033\000\233\000\041\000\233\000\042\000\233\000\
\\043\000\233\000\044\000\233\000\000\000\
\\001\000\013\000\084\000\014\000\083\000\015\000\082\000\016\000\081\000\
\\025\000\080\000\026\000\218\000\033\000\078\000\041\000\077\000\
\\042\000\076\000\043\000\075\000\044\000\074\000\000\000\
\\001\000\013\000\084\000\014\000\083\000\015\000\082\000\016\000\081\000\
\\025\000\080\000\031\000\079\000\033\000\078\000\041\000\077\000\
\\042\000\076\000\043\000\075\000\044\000\074\000\000\000\
\\001\000\013\000\084\000\014\000\083\000\015\000\082\000\016\000\081\000\
\\025\000\080\000\033\000\078\000\041\000\077\000\042\000\076\000\
\\043\000\075\000\044\000\074\000\000\000\
\\001\000\017\000\179\000\018\000\179\000\019\000\179\000\021\000\179\000\
\\022\000\179\000\024\000\179\000\000\000\
\\001\000\017\000\189\000\018\000\189\000\019\000\189\000\021\000\189\000\
\\022\000\189\000\024\000\189\000\000\000\
\\001\000\017\000\190\000\018\000\190\000\019\000\190\000\021\000\190\000\
\\022\000\190\000\024\000\190\000\000\000\
\\001\000\017\000\191\000\018\000\191\000\019\000\191\000\021\000\191\000\
\\022\000\191\000\024\000\191\000\000\000\
\\001\000\017\000\192\000\018\000\192\000\019\000\192\000\021\000\192\000\
\\022\000\192\000\024\000\192\000\000\000\
\\001\000\017\000\193\000\018\000\193\000\019\000\193\000\021\000\193\000\
\\022\000\193\000\024\000\193\000\000\000\
\\001\000\017\000\194\000\018\000\194\000\019\000\194\000\021\000\194\000\
\\022\000\194\000\024\000\194\000\000\000\
\\001\000\017\000\195\000\018\000\195\000\019\000\195\000\021\000\195\000\
\\022\000\195\000\024\000\195\000\000\000\
\\001\000\017\000\196\000\018\000\196\000\019\000\196\000\021\000\196\000\
\\022\000\196\000\024\000\196\000\000\000\
\\001\000\017\000\197\000\018\000\197\000\019\000\197\000\021\000\197\000\
\\022\000\197\000\024\000\197\000\000\000\
\\001\000\017\000\198\000\018\000\198\000\019\000\198\000\020\000\145\000\
\\021\000\198\000\022\000\198\000\024\000\198\000\000\000\
\\001\000\017\000\199\000\018\000\199\000\019\000\199\000\021\000\199\000\
\\022\000\199\000\024\000\199\000\000\000\
\\001\000\017\000\200\000\018\000\200\000\019\000\200\000\021\000\200\000\
\\022\000\200\000\024\000\200\000\000\000\
\\001\000\017\000\201\000\018\000\201\000\019\000\201\000\021\000\201\000\
\\022\000\201\000\024\000\201\000\000\000\
\\001\000\017\000\202\000\018\000\202\000\019\000\202\000\021\000\202\000\
\\022\000\202\000\024\000\202\000\000\000\
\\001\000\017\000\203\000\018\000\203\000\019\000\203\000\021\000\203\000\
\\022\000\203\000\024\000\203\000\000\000\
\\001\000\017\000\064\000\018\000\063\000\019\000\062\000\021\000\061\000\
\\022\000\060\000\024\000\186\000\000\000\
\\001\000\017\000\064\000\018\000\063\000\019\000\062\000\021\000\061\000\
\\022\000\060\000\024\000\188\000\000\000\
\\001\000\023\000\005\000\000\000\
\\001\000\023\000\042\000\000\000\
\\001\000\023\000\132\000\000\000\
\\001\000\023\000\133\000\000\000\
\\001\000\023\000\147\000\000\000\
\\001\000\024\000\166\000\000\000\
\\001\000\024\000\185\000\000\000\
\\001\000\024\000\187\000\000\000\
\\001\000\024\000\026\000\000\000\
\\001\000\024\000\067\000\000\000\
\\001\000\024\000\142\000\000\000\
\\001\000\024\000\143\000\000\000\
\\001\000\024\000\149\000\000\000\
\\001\000\025\000\032\000\000\000\
\\001\000\025\000\085\000\000\000\
\\001\000\025\000\086\000\000\000\
\\001\000\025\000\106\000\026\000\234\000\027\000\105\000\028\000\234\000\
\\029\000\104\000\030\000\234\000\031\000\234\000\032\000\234\000\
\\033\000\234\000\034\000\234\000\035\000\234\000\036\000\234\000\
\\037\000\234\000\038\000\234\000\039\000\234\000\040\000\234\000\000\000\
\\001\000\025\000\106\000\029\000\104\000\000\000\
\\001\000\025\000\128\000\000\000\
\\001\000\026\000\173\000\000\000\
\\001\000\026\000\174\000\030\000\043\000\000\000\
\\001\000\026\000\175\000\000\000\
\\001\000\026\000\204\000\028\000\204\000\030\000\204\000\031\000\204\000\
\\032\000\204\000\033\000\204\000\034\000\204\000\035\000\204\000\
\\036\000\204\000\037\000\204\000\038\000\204\000\039\000\204\000\
\\040\000\204\000\000\000\
\\001\000\026\000\205\000\028\000\205\000\030\000\205\000\031\000\205\000\
\\032\000\205\000\033\000\205\000\034\000\205\000\035\000\205\000\
\\036\000\205\000\037\000\205\000\038\000\205\000\039\000\205\000\
\\040\000\205\000\000\000\
\\001\000\026\000\206\000\028\000\206\000\030\000\206\000\031\000\206\000\
\\032\000\206\000\033\000\206\000\034\000\206\000\035\000\206\000\
\\036\000\206\000\037\000\206\000\038\000\206\000\039\000\206\000\
\\040\000\206\000\000\000\
\\001\000\026\000\207\000\028\000\207\000\030\000\207\000\031\000\207\000\
\\032\000\207\000\033\000\207\000\034\000\207\000\035\000\207\000\
\\036\000\207\000\037\000\207\000\038\000\207\000\039\000\207\000\
\\040\000\207\000\000\000\
\\001\000\026\000\208\000\028\000\208\000\030\000\208\000\031\000\208\000\
\\032\000\208\000\033\000\208\000\034\000\208\000\035\000\208\000\
\\036\000\208\000\037\000\208\000\038\000\208\000\039\000\208\000\
\\040\000\208\000\000\000\
\\001\000\026\000\209\000\028\000\209\000\030\000\209\000\031\000\209\000\
\\032\000\209\000\033\000\209\000\034\000\209\000\035\000\209\000\
\\036\000\209\000\037\000\209\000\038\000\209\000\039\000\209\000\
\\040\000\209\000\000\000\
\\001\000\026\000\210\000\028\000\210\000\030\000\210\000\031\000\210\000\
\\032\000\210\000\033\000\210\000\034\000\210\000\035\000\210\000\
\\036\000\210\000\037\000\210\000\038\000\210\000\039\000\210\000\
\\040\000\210\000\000\000\
\\001\000\026\000\211\000\028\000\211\000\030\000\211\000\031\000\211\000\
\\032\000\211\000\033\000\211\000\034\000\211\000\035\000\211\000\
\\036\000\211\000\037\000\211\000\038\000\211\000\039\000\211\000\
\\040\000\211\000\000\000\
\\001\000\026\000\212\000\028\000\212\000\030\000\212\000\031\000\212\000\
\\032\000\212\000\033\000\212\000\034\000\212\000\035\000\212\000\
\\036\000\212\000\037\000\212\000\038\000\212\000\039\000\212\000\
\\040\000\212\000\000\000\
\\001\000\026\000\213\000\028\000\213\000\030\000\213\000\031\000\213\000\
\\032\000\213\000\033\000\213\000\034\000\213\000\035\000\213\000\
\\036\000\213\000\037\000\213\000\038\000\213\000\039\000\213\000\
\\040\000\213\000\000\000\
\\001\000\026\000\214\000\028\000\214\000\030\000\214\000\031\000\214\000\
\\032\000\214\000\033\000\214\000\034\000\214\000\035\000\214\000\
\\036\000\214\000\037\000\214\000\038\000\214\000\039\000\214\000\
\\040\000\214\000\000\000\
\\001\000\026\000\215\000\028\000\215\000\030\000\215\000\031\000\215\000\
\\032\000\215\000\033\000\215\000\034\000\215\000\035\000\215\000\
\\036\000\215\000\037\000\215\000\038\000\215\000\039\000\215\000\
\\040\000\215\000\000\000\
\\001\000\026\000\216\000\030\000\131\000\032\000\102\000\033\000\101\000\
\\034\000\100\000\035\000\099\000\036\000\098\000\037\000\097\000\
\\038\000\096\000\039\000\095\000\040\000\094\000\000\000\
\\001\000\026\000\217\000\000\000\
\\001\000\026\000\219\000\028\000\219\000\030\000\219\000\031\000\219\000\
\\032\000\219\000\033\000\219\000\034\000\219\000\035\000\219\000\
\\036\000\219\000\037\000\219\000\038\000\219\000\039\000\219\000\
\\040\000\219\000\000\000\
\\001\000\026\000\220\000\028\000\220\000\030\000\220\000\031\000\220\000\
\\032\000\220\000\033\000\220\000\034\000\220\000\035\000\220\000\
\\036\000\220\000\037\000\220\000\038\000\220\000\039\000\220\000\
\\040\000\220\000\000\000\
\\001\000\026\000\221\000\028\000\221\000\030\000\221\000\031\000\221\000\
\\032\000\221\000\033\000\221\000\034\000\221\000\035\000\221\000\
\\036\000\221\000\037\000\221\000\038\000\221\000\039\000\221\000\
\\040\000\221\000\000\000\
\\001\000\026\000\222\000\028\000\222\000\030\000\222\000\031\000\222\000\
\\032\000\222\000\033\000\222\000\034\000\222\000\035\000\222\000\
\\036\000\222\000\037\000\222\000\038\000\222\000\039\000\222\000\
\\040\000\222\000\000\000\
\\001\000\026\000\039\000\000\000\
\\001\000\026\000\121\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\026\000\122\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\026\000\123\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\026\000\130\000\000\000\
\\001\000\026\000\141\000\000\000\
\\001\000\027\000\112\000\040\000\111\000\000\000\
\\001\000\028\000\129\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\028\000\135\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\030\000\028\000\031\000\027\000\000\000\
\\001\000\030\000\034\000\031\000\157\000\000\000\
\\001\000\030\000\115\000\031\000\183\000\000\000\
\\001\000\030\000\115\000\031\000\114\000\000\000\
\\001\000\031\000\158\000\000\000\
\\001\000\031\000\184\000\000\000\
\\001\000\031\000\033\000\000\000\
\\001\000\031\000\103\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\031\000\110\000\000\000\
\\001\000\031\000\113\000\000\000\
\\001\000\031\000\134\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\031\000\146\000\032\000\102\000\033\000\101\000\034\000\100\000\
\\035\000\099\000\036\000\098\000\037\000\097\000\038\000\096\000\
\\039\000\095\000\040\000\094\000\000\000\
\\001\000\040\000\140\000\000\000\
\\001\000\044\000\161\000\000\000\
\\001\000\044\000\162\000\000\000\
\\001\000\044\000\163\000\000\000\
\\001\000\044\000\164\000\000\000\
\\001\000\044\000\171\000\000\000\
\\001\000\044\000\172\000\000\000\
\\001\000\044\000\004\000\000\000\
\\001\000\044\000\022\000\000\000\
\\001\000\044\000\029\000\000\000\
\\001\000\044\000\031\000\000\000\
\\001\000\044\000\040\000\000\000\
\\001\000\044\000\088\000\000\000\
\\001\000\044\000\089\000\000\000\
\\001\000\044\000\091\000\000\000\
\\001\000\044\000\117\000\000\000\
\\001\000\044\000\127\000\000\000\
\"
val actionRowNumbers =
"\002\000\123\000\055\000\005\000\
\\022\000\003\000\010\000\015\000\
\\016\000\124\000\120\000\119\000\
\\118\000\117\000\004\000\020\000\
\\063\000\019\000\018\000\017\000\
\\104\000\125\000\122\000\121\000\
\\001\000\006\000\126\000\068\000\
\\110\000\105\000\021\000\007\000\
\\126\000\074\000\095\000\127\000\
\\108\000\056\000\075\000\009\000\
\\014\000\021\000\060\000\013\000\
\\054\000\022\000\076\000\037\000\
\\044\000\043\000\042\000\041\000\
\\040\000\039\000\038\000\053\000\
\\061\000\064\000\035\000\069\000\
\\070\000\128\000\129\000\130\000\
\\062\000\008\000\084\000\082\000\
\\036\000\081\000\077\000\111\000\
\\071\000\080\000\079\000\033\000\
\\032\000\051\000\036\000\094\000\
\\093\000\092\000\091\000\036\000\
\\036\000\112\000\072\000\101\000\
\\113\000\107\000\085\000\036\000\
\\031\000\030\000\029\000\028\000\
\\027\000\026\000\025\000\024\000\
\\023\000\052\000\131\000\036\000\
\\034\000\096\000\097\000\098\000\
\\050\000\036\000\036\000\012\000\
\\011\000\132\000\078\000\073\000\
\\102\000\099\000\089\000\083\000\
\\057\000\058\000\114\000\103\000\
\\109\000\106\000\034\000\086\000\
\\087\000\034\000\054\000\054\000\
\\045\000\116\000\100\000\090\000\
\\065\000\066\000\036\000\088\000\
\\049\000\047\000\115\000\059\000\
\\046\000\054\000\067\000\048\000\
\\000\000"
val gotoT =
"\
\\001\000\148\000\000\000\
\\000\000\
\\000\000\
\\002\000\006\000\003\000\005\000\004\000\004\000\000\000\
\\006\000\009\000\000\000\
\\002\000\014\000\003\000\005\000\004\000\004\000\000\000\
\\008\000\016\000\009\000\015\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\022\000\010\000\021\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\028\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\006\000\035\000\011\000\034\000\012\000\033\000\000\000\
\\000\000\
\\007\000\036\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\013\000\039\000\000\000\
\\000\000\
\\008\000\042\000\009\000\015\000\000\000\
\\014\000\044\000\015\000\043\000\000\000\
\\006\000\035\000\012\000\046\000\000\000\
\\000\000\
\\014\000\047\000\015\000\043\000\000\000\
\\017\000\057\000\018\000\056\000\019\000\055\000\020\000\054\000\
\\021\000\053\000\022\000\052\000\023\000\051\000\024\000\050\000\
\\025\000\049\000\032\000\048\000\000\000\
\\006\000\063\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\018\000\064\000\019\000\055\000\020\000\054\000\021\000\053\000\
\\022\000\052\000\023\000\051\000\024\000\050\000\025\000\049\000\
\\032\000\048\000\000\000\
\\000\000\
\\000\000\
\\026\000\071\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\033\000\085\000\000\000\
\\000\000\
\\016\000\088\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\027\000\090\000\028\000\069\000\030\000\068\000\031\000\067\000\
\\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\029\000\091\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\026\000\105\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\026\000\106\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\026\000\107\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\027\000\114\000\028\000\069\000\030\000\068\000\031\000\067\000\
\\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\026\000\116\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\026\000\118\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\034\000\117\000\000\000\
\\029\000\091\000\000\000\
\\029\000\091\000\000\000\
\\029\000\091\000\000\000\
\\000\000\
\\026\000\122\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\026\000\123\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\016\000\124\000\000\000\
\\000\000\
\\000\000\
\\029\000\091\000\000\000\
\\000\000\
\\029\000\091\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\029\000\091\000\000\000\
\\029\000\091\000\000\000\
\\000\000\
\\000\000\
\\026\000\118\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\034\000\134\000\000\000\
\\000\000\
\\000\000\
\\026\000\118\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\034\000\135\000\000\000\
\\017\000\136\000\018\000\056\000\019\000\055\000\020\000\054\000\
\\021\000\053\000\022\000\052\000\023\000\051\000\024\000\050\000\
\\025\000\049\000\032\000\048\000\000\000\
\\017\000\137\000\018\000\056\000\019\000\055\000\020\000\054\000\
\\021\000\053\000\022\000\052\000\023\000\051\000\024\000\050\000\
\\025\000\049\000\032\000\048\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\026\000\142\000\027\000\070\000\028\000\069\000\030\000\068\000\
\\031\000\067\000\033\000\066\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\029\000\091\000\000\000\
\\000\000\
\\000\000\
\\017\000\146\000\018\000\056\000\019\000\055\000\020\000\054\000\
\\021\000\053\000\022\000\052\000\023\000\051\000\024\000\050\000\
\\025\000\049\000\032\000\048\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 149
val numrules = 84
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit | ID of  (string)
 | StrConstant of  (string) | IntConstant of  (int)
 | ExpressionList of  (AST list) | SubroutineCall of  (AST)
 | ReturnStatement of  (AST) | VarName of  (string)
 | UnaryOp of  (string) | BinaryOp of  (AST)
 | KeywordConstant of  (string) | Term of  (AST)
 | Expression of  (AST) | DoStatement of  (AST)
 | WhileStatement of  (AST) | IfElseStatement of  (AST)
 | IfStatement of  (AST) | LetIndexStatement of  (AST)
 | LetStatement of  (AST) | StatementType of  (AST)
 | Statement of  (AST list) | Statements of  (AST)
 | SubVarList of  (AST list) | SubVarDecList of  (AST)
 | SubVarDec of  (AST list) | SubBody of  (AST)
 | ParamList of  (AST list) | ParamDec of  (AST)
 | SubReturnType of  (string) | SubType of  (string)
 | SubroutineDec of  (AST list) | ClassVarList of  (AST list)
 | Type of  (string) | ClassVar of  (AST) | ClassVarType of  (string)
 | ClassVarDecList of  (AST) | ClassVarDec of  (AST list)
 | ClassDec of  (AST)
end
type svalue = MlyValue.svalue
type result = AST
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn _ => false
val showTerminal =
fn (T 0) => "EOF"
  | (T 1) => "Class"
  | (T 2) => "Constructor"
  | (T 3) => "Function"
  | (T 4) => "Method"
  | (T 5) => "Field"
  | (T 6) => "Static"
  | (T 7) => "Var"
  | (T 8) => "Int"
  | (T 9) => "Char"
  | (T 10) => "Boolean"
  | (T 11) => "Void"
  | (T 12) => "True"
  | (T 13) => "False"
  | (T 14) => "Null"
  | (T 15) => "This"
  | (T 16) => "Let"
  | (T 17) => "Do"
  | (T 18) => "If"
  | (T 19) => "Else"
  | (T 20) => "While"
  | (T 21) => "Ret"
  | (T 22) => "LCurly"
  | (T 23) => "RCurly"
  | (T 24) => "LParen"
  | (T 25) => "RParen"
  | (T 26) => "LSquare"
  | (T 27) => "RSquare"
  | (T 28) => "FullStop"
  | (T 29) => "Comma"
  | (T 30) => "SemiCol"
  | (T 31) => "Plus"
  | (T 32) => "Minus"
  | (T 33) => "Times"
  | (T 34) => "Div"
  | (T 35) => "Amper"
  | (T 36) => "Pipe"
  | (T 37) => "LThan"
  | (T 38) => "GThan"
  | (T 39) => "Equals"
  | (T 40) => "Tilde"
  | (T 41) => "IntConstant"
  | (T 42) => "StrConstant"
  | (T 43) => "ID"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 40) $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34)
 $$ (T 33) $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27)
 $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20)
 $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13)
 $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ 
(T 5) $$ (T 4) $$ (T 3) $$ (T 2) $$ (T 1) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( _, _, RCurly1right)) :: ( _, ( 
MlyValue.SubroutineDec SubroutineDec, _, _)) :: ( _, ( 
MlyValue.ClassVarDec ClassVarDec, _, _)) :: _ :: ( _, ( MlyValue.ID ID
, _, _)) :: ( _, ( _, Class1left, _)) :: rest671)) => let val  result
 = MlyValue.ClassDec (
class(ID, classVarDec(ClassVarDec), subroutineDec(SubroutineDec)))
 in ( LrTable.NT 0, ( result, Class1left, RCurly1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.ClassVarDecList ClassVarDecList, 
ClassVarDecList1left, ClassVarDecList1right)) :: rest671)) => let val 
 result = MlyValue.ClassVarDec ([ClassVarDecList])
 in ( LrTable.NT 1, ( result, ClassVarDecList1left, 
ClassVarDecList1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.ClassVarDec ClassVarDec, _, 
ClassVarDec1right)) :: ( _, ( MlyValue.ClassVarDecList ClassVarDecList
, ClassVarDecList1left, _)) :: rest671)) => let val  result = 
MlyValue.ClassVarDec (ClassVarDecList::ClassVarDec)
 in ( LrTable.NT 1, ( result, ClassVarDecList1left, ClassVarDec1right)
, rest671)
end
|  ( 3, ( rest671)) => let val  result = MlyValue.ClassVarDec ([])
 in ( LrTable.NT 1, ( result, defaultPos, defaultPos), rest671)
end
|  ( 4, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.ID ID, _, _)
) :: ( _, ( MlyValue.Type Type, _, _)) :: ( _, ( MlyValue.ClassVarType
 ClassVarType, ClassVarType1left, _)) :: rest671)) => let val  result
 = MlyValue.ClassVarDecList (
classVarList(ClassVarType, Type, [classVar(ID)]))
 in ( LrTable.NT 2, ( result, ClassVarType1left, SemiCol1right), 
rest671)
end
|  ( 5, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.ClassVarList
 ClassVarList, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( 
MlyValue.Type Type, _, _)) :: ( _, ( MlyValue.ClassVarType 
ClassVarType, ClassVarType1left, _)) :: rest671)) => let val  result =
 MlyValue.ClassVarDecList (
classVarList(
                                                        ClassVarType, Type, classVar(ID)::ClassVarList
                                                    )
)
 in ( LrTable.NT 2, ( result, ClassVarType1left, SemiCol1right), 
rest671)
end
|  ( 6, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.ClassVarList ([classVar(ID)])
 in ( LrTable.NT 6, ( result, ID1left, ID1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.ClassVarList ClassVarList, _, 
ClassVarList1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: 
rest671)) => let val  result = MlyValue.ClassVarList (
classVar(ID)::ClassVarList)
 in ( LrTable.NT 6, ( result, ID1left, ClassVarList1right), rest671)

end
|  ( 8, ( ( _, ( _, Static1left, Static1right)) :: rest671)) => let
 val  result = MlyValue.ClassVarType ("static")
 in ( LrTable.NT 3, ( result, Static1left, Static1right), rest671)
end
|  ( 9, ( ( _, ( _, Field1left, Field1right)) :: rest671)) => let val 
 result = MlyValue.ClassVarType ("field")
 in ( LrTable.NT 3, ( result, Field1left, Field1right), rest671)
end
|  ( 10, ( ( _, ( _, Int1left, Int1right)) :: rest671)) => let val  
result = MlyValue.Type ("int")
 in ( LrTable.NT 5, ( result, Int1left, Int1right), rest671)
end
|  ( 11, ( ( _, ( _, Char1left, Char1right)) :: rest671)) => let val  
result = MlyValue.Type ("char")
 in ( LrTable.NT 5, ( result, Char1left, Char1right), rest671)
end
|  ( 12, ( ( _, ( _, Boolean1left, Boolean1right)) :: rest671)) => let
 val  result = MlyValue.Type ("boolean")
 in ( LrTable.NT 5, ( result, Boolean1left, Boolean1right), rest671)

end
|  ( 13, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.Type (ID)
 in ( LrTable.NT 5, ( result, ID1left, ID1right), rest671)
end
|  ( 14, ( ( _, ( MlyValue.SubBody SubBody, _, SubBody1right)) :: _ ::
 ( _, ( MlyValue.ParamDec ParamDec, _, _)) :: _ :: ( _, ( MlyValue.ID 
ID, _, _)) :: ( _, ( MlyValue.SubReturnType SubReturnType, _, _)) :: (
 _, ( MlyValue.SubType SubType, SubType1left, _)) :: rest671)) => let
 val  result = MlyValue.SubroutineDec (
[subroutine(SubType, SubReturnType, ID, ParamDec, SubBody)])
 in ( LrTable.NT 7, ( result, SubType1left, SubBody1right), rest671)

end
|  ( 15, ( ( _, ( MlyValue.SubroutineDec SubroutineDec, _, 
SubroutineDec1right)) :: ( _, ( MlyValue.SubBody SubBody, _, _)) :: _
 :: ( _, ( MlyValue.ParamDec ParamDec, _, _)) :: _ :: ( _, ( 
MlyValue.ID ID, _, _)) :: ( _, ( MlyValue.SubReturnType SubReturnType,
 _, _)) :: ( _, ( MlyValue.SubType SubType, SubType1left, _)) :: 
rest671)) => let val  result = MlyValue.SubroutineDec (
subroutine(SubType, SubReturnType, ID, ParamDec, SubBody)::SubroutineDec
)
 in ( LrTable.NT 7, ( result, SubType1left, SubroutineDec1right), 
rest671)
end
|  ( 16, ( rest671)) => let val  result = MlyValue.SubroutineDec ([])
 in ( LrTable.NT 7, ( result, defaultPos, defaultPos), rest671)
end
|  ( 17, ( ( _, ( _, Constructor1left, Constructor1right)) :: rest671)
) => let val  result = MlyValue.SubType ("constructor")
 in ( LrTable.NT 8, ( result, Constructor1left, Constructor1right), 
rest671)
end
|  ( 18, ( ( _, ( _, Function1left, Function1right)) :: rest671)) =>
 let val  result = MlyValue.SubType ("function")
 in ( LrTable.NT 8, ( result, Function1left, Function1right), rest671)

end
|  ( 19, ( ( _, ( _, Method1left, Method1right)) :: rest671)) => let
 val  result = MlyValue.SubType ("method")
 in ( LrTable.NT 8, ( result, Method1left, Method1right), rest671)
end
|  ( 20, ( ( _, ( _, Void1left, Void1right)) :: rest671)) => let val  
result = MlyValue.SubReturnType ("void")
 in ( LrTable.NT 9, ( result, Void1left, Void1right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.Type Type, Type1left, Type1right)) :: 
rest671)) => let val  result = MlyValue.SubReturnType (Type)
 in ( LrTable.NT 9, ( result, Type1left, Type1right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.ParamList ParamList, ParamList1left, 
ParamList1right)) :: rest671)) => let val  result = MlyValue.ParamDec
 (paramList(ParamList))
 in ( LrTable.NT 10, ( result, ParamList1left, ParamList1right), 
rest671)
end
|  ( 23, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: ( _, ( 
MlyValue.Type Type, Type1left, _)) :: rest671)) => let val  result = 
MlyValue.ParamList ([param(Type, ID)])
 in ( LrTable.NT 11, ( result, Type1left, ID1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.ParamList ParamList, _, ParamList1right))
 :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( MlyValue.Type Type, 
Type1left, _)) :: rest671)) => let val  result = MlyValue.ParamList (
param(Type, ID)::ParamList)
 in ( LrTable.NT 11, ( result, Type1left, ParamList1right), rest671)

end
|  ( 25, ( rest671)) => let val  result = MlyValue.ParamList ([])
 in ( LrTable.NT 11, ( result, defaultPos, defaultPos), rest671)
end
|  ( 26, ( ( _, ( _, _, RCurly1right)) :: ( _, ( MlyValue.Statements 
Statements, _, _)) :: ( _, ( MlyValue.SubVarDec SubVarDec, _, _)) :: (
 _, ( _, LCurly1left, _)) :: rest671)) => let val  result = 
MlyValue.SubBody (subBody(subVarDec(SubVarDec), Statements))
 in ( LrTable.NT 12, ( result, LCurly1left, RCurly1right), rest671)

end
|  ( 27, ( ( _, ( MlyValue.SubVarDecList SubVarDecList, 
SubVarDecList1left, SubVarDecList1right)) :: rest671)) => let val  
result = MlyValue.SubVarDec ([SubVarDecList])
 in ( LrTable.NT 13, ( result, SubVarDecList1left, SubVarDecList1right
), rest671)
end
|  ( 28, ( ( _, ( MlyValue.SubVarDec SubVarDec, _, SubVarDec1right))
 :: ( _, ( MlyValue.SubVarDecList SubVarDecList, SubVarDecList1left, _
)) :: rest671)) => let val  result = MlyValue.SubVarDec (
SubVarDecList::SubVarDec)
 in ( LrTable.NT 13, ( result, SubVarDecList1left, SubVarDec1right), 
rest671)
end
|  ( 29, ( rest671)) => let val  result = MlyValue.SubVarDec ([])
 in ( LrTable.NT 13, ( result, defaultPos, defaultPos), rest671)
end
|  ( 30, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.ID ID, _, _
)) :: ( _, ( MlyValue.Type Type, _, _)) :: ( _, ( _, Var1left, _)) :: 
rest671)) => let val  result = MlyValue.SubVarDecList (
subVarDecList(Type, [subVar(ID)]))
 in ( LrTable.NT 14, ( result, Var1left, SemiCol1right), rest671)
end
|  ( 31, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.SubVarList 
SubVarList, _, _)) :: ( _, ( MlyValue.Type Type, _, _)) :: ( _, ( _, 
Var1left, _)) :: rest671)) => let val  result = MlyValue.SubVarDecList
 (subVarDecList(Type, SubVarList))
 in ( LrTable.NT 14, ( result, Var1left, SemiCol1right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.SubVarList ([subVar(ID)])
 in ( LrTable.NT 15, ( result, ID1left, ID1right), rest671)
end
|  ( 33, ( ( _, ( MlyValue.SubVarList SubVarList, _, SubVarList1right)
) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val 
 result = MlyValue.SubVarList (subVar(ID)::SubVarList)
 in ( LrTable.NT 15, ( result, ID1left, SubVarList1right), rest671)

end
|  ( 34, ( ( _, ( MlyValue.Statement Statement, Statement1left, 
Statement1right)) :: rest671)) => let val  result = 
MlyValue.Statements (statements(Statement))
 in ( LrTable.NT 16, ( result, Statement1left, Statement1right), 
rest671)
end
|  ( 35, ( ( _, ( MlyValue.StatementType StatementType, 
StatementType1left, StatementType1right)) :: rest671)) => let val  
result = MlyValue.Statement ([StatementType])
 in ( LrTable.NT 17, ( result, StatementType1left, StatementType1right
), rest671)
end
|  ( 36, ( ( _, ( MlyValue.Statement Statement, _, Statement1right))
 :: ( _, ( MlyValue.StatementType StatementType, StatementType1left, _
)) :: rest671)) => let val  result = MlyValue.Statement (
StatementType::Statement)
 in ( LrTable.NT 17, ( result, StatementType1left, Statement1right), 
rest671)
end
|  ( 37, ( rest671)) => let val  result = MlyValue.Statement ([])
 in ( LrTable.NT 17, ( result, defaultPos, defaultPos), rest671)
end
|  ( 38, ( ( _, ( MlyValue.LetStatement LetStatement, 
LetStatement1left, LetStatement1right)) :: rest671)) => let val  
result = MlyValue.StatementType (LetStatement)
 in ( LrTable.NT 18, ( result, LetStatement1left, LetStatement1right),
 rest671)
end
|  ( 39, ( ( _, ( MlyValue.LetIndexStatement LetIndexStatement, 
LetIndexStatement1left, LetIndexStatement1right)) :: rest671)) => let
 val  result = MlyValue.StatementType (LetIndexStatement)
 in ( LrTable.NT 18, ( result, LetIndexStatement1left, 
LetIndexStatement1right), rest671)
end
|  ( 40, ( ( _, ( MlyValue.IfStatement IfStatement, IfStatement1left, 
IfStatement1right)) :: rest671)) => let val  result = 
MlyValue.StatementType (IfStatement)
 in ( LrTable.NT 18, ( result, IfStatement1left, IfStatement1right), 
rest671)
end
|  ( 41, ( ( _, ( MlyValue.IfElseStatement IfElseStatement, 
IfElseStatement1left, IfElseStatement1right)) :: rest671)) => let val 
 result = MlyValue.StatementType (IfElseStatement)
 in ( LrTable.NT 18, ( result, IfElseStatement1left, 
IfElseStatement1right), rest671)
end
|  ( 42, ( ( _, ( MlyValue.WhileStatement WhileStatement, 
WhileStatement1left, WhileStatement1right)) :: rest671)) => let val  
result = MlyValue.StatementType (WhileStatement)
 in ( LrTable.NT 18, ( result, WhileStatement1left, 
WhileStatement1right), rest671)
end
|  ( 43, ( ( _, ( MlyValue.DoStatement DoStatement, DoStatement1left, 
DoStatement1right)) :: rest671)) => let val  result = 
MlyValue.StatementType (DoStatement)
 in ( LrTable.NT 18, ( result, DoStatement1left, DoStatement1right), 
rest671)
end
|  ( 44, ( ( _, ( MlyValue.ReturnStatement ReturnStatement, 
ReturnStatement1left, ReturnStatement1right)) :: rest671)) => let val 
 result = MlyValue.StatementType (ReturnStatement)
 in ( LrTable.NT 18, ( result, ReturnStatement1left, 
ReturnStatement1right), rest671)
end
|  ( 45, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.Expression 
Expression, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, 
Let1left, _)) :: rest671)) => let val  result = MlyValue.LetStatement
 (letStatement(ID, Expression))
 in ( LrTable.NT 19, ( result, Let1left, SemiCol1right), rest671)
end
|  ( 46, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.Expression 
Expression2, _, _)) :: _ :: _ :: ( _, ( MlyValue.Expression 
Expression1, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _,
 Let1left, _)) :: rest671)) => let val  result = 
MlyValue.LetIndexStatement (
letIndexStatement(ID, Expression1, Expression2))
 in ( LrTable.NT 20, ( result, Let1left, SemiCol1right), rest671)
end
|  ( 47, ( ( _, ( _, _, RCurly1right)) :: ( _, ( MlyValue.Statements 
Statements, _, _)) :: _ :: _ :: ( _, ( MlyValue.Expression Expression,
 _, _)) :: _ :: ( _, ( _, If1left, _)) :: rest671)) => let val  result
 = MlyValue.IfStatement (ifStatement(Expression, Statements))
 in ( LrTable.NT 21, ( result, If1left, RCurly1right), rest671)
end
|  ( 48, ( ( _, ( _, _, RCurly2right)) :: ( _, ( MlyValue.Statements 
Statements2, _, _)) :: _ :: _ :: _ :: ( _, ( MlyValue.Statements 
Statements1, _, _)) :: _ :: _ :: ( _, ( MlyValue.Expression Expression
, _, _)) :: _ :: ( _, ( _, If1left, _)) :: rest671)) => let val  
result = MlyValue.IfElseStatement (
ifElseStatement(Expression, Statements1, Statements2))
 in ( LrTable.NT 22, ( result, If1left, RCurly2right), rest671)
end
|  ( 49, ( ( _, ( _, _, RCurly1right)) :: ( _, ( MlyValue.Statements 
Statements, _, _)) :: _ :: _ :: ( _, ( MlyValue.Expression Expression,
 _, _)) :: _ :: ( _, ( _, While1left, _)) :: rest671)) => let val  
result = MlyValue.WhileStatement (
whileStatement(Expression, Statements))
 in ( LrTable.NT 23, ( result, While1left, RCurly1right), rest671)
end
|  ( 50, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( 
MlyValue.SubroutineCall SubroutineCall, _, _)) :: ( _, ( _, Do1left, _
)) :: rest671)) => let val  result = MlyValue.DoStatement (
doStatement(SubroutineCall))
 in ( LrTable.NT 24, ( result, Do1left, SemiCol1right), rest671)
end
|  ( 51, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( _, Ret1left, _)) :: 
rest671)) => let val  result = MlyValue.ReturnStatement (return)
 in ( LrTable.NT 31, ( result, Ret1left, SemiCol1right), rest671)
end
|  ( 52, ( ( _, ( _, _, SemiCol1right)) :: ( _, ( MlyValue.Expression 
Expression, _, _)) :: ( _, ( _, Ret1left, _)) :: rest671)) => let val 
 result = MlyValue.ReturnStatement (returnExpression(Expression))
 in ( LrTable.NT 31, ( result, Ret1left, SemiCol1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.Term Term, Term1left, Term1right)) :: 
rest671)) => let val  result = MlyValue.Expression (uExpression(Term))
 in ( LrTable.NT 25, ( result, Term1left, Term1right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.Term Term, _, Term1right)) :: ( _, ( 
MlyValue.BinaryOp BinaryOp, _, _)) :: ( _, ( MlyValue.Expression 
Expression, Expression1left, _)) :: rest671)) => let val  result = 
MlyValue.Expression (expression(BinaryOp, Expression, Term))
 in ( LrTable.NT 25, ( result, Expression1left, Term1right), rest671)

end
|  ( 55, ( ( _, ( MlyValue.IntConstant IntConstant, IntConstant1left, 
IntConstant1right)) :: rest671)) => let val  result = MlyValue.Term (
intConstant(IntConstant))
 in ( LrTable.NT 26, ( result, IntConstant1left, IntConstant1right), 
rest671)
end
|  ( 56, ( ( _, ( MlyValue.StrConstant StrConstant, StrConstant1left, 
StrConstant1right)) :: rest671)) => let val  result = MlyValue.Term (
strConstant(StrConstant))
 in ( LrTable.NT 26, ( result, StrConstant1left, StrConstant1right), 
rest671)
end
|  ( 57, ( ( _, ( MlyValue.KeywordConstant KeywordConstant, 
KeywordConstant1left, KeywordConstant1right)) :: rest671)) => let val 
 result = MlyValue.Term (keywordConstant(KeywordConstant))
 in ( LrTable.NT 26, ( result, KeywordConstant1left, 
KeywordConstant1right), rest671)
end
|  ( 58, ( ( _, ( MlyValue.VarName VarName, VarName1left, 
VarName1right)) :: rest671)) => let val  result = MlyValue.Term (
varName(VarName))
 in ( LrTable.NT 26, ( result, VarName1left, VarName1right), rest671)

end
|  ( 59, ( ( _, ( _, _, RParen1right)) :: ( _, ( MlyValue.Expression 
Expression, _, _)) :: ( _, ( _, LParen1left, _)) :: rest671)) => let
 val  result = MlyValue.Term (precedence(Expression))
 in ( LrTable.NT 26, ( result, LParen1left, RParen1right), rest671)

end
|  ( 60, ( ( _, ( MlyValue.SubroutineCall SubroutineCall, 
SubroutineCall1left, SubroutineCall1right)) :: rest671)) => let val  
result = MlyValue.Term (SubroutineCall)
 in ( LrTable.NT 26, ( result, SubroutineCall1left, 
SubroutineCall1right), rest671)
end
|  ( 61, ( ( _, ( MlyValue.Term Term, _, Term1right)) :: ( _, ( 
MlyValue.UnaryOp UnaryOp, UnaryOp1left, _)) :: rest671)) => let val  
result = MlyValue.Term (unaryOp(UnaryOp, Term))
 in ( LrTable.NT 26, ( result, UnaryOp1left, Term1right), rest671)
end
|  ( 62, ( ( _, ( _, _, RSquare1right)) :: ( _, ( MlyValue.Expression 
Expression, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: 
rest671)) => let val  result = MlyValue.Term (varIndex(ID, Expression)
)
 in ( LrTable.NT 26, ( result, ID1left, RSquare1right), rest671)
end
|  ( 63, ( ( _, ( _, _, RParen1right)) :: ( _, ( 
MlyValue.ExpressionList ExpressionList, _, _)) :: _ :: ( _, ( 
MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.SubroutineCall (
methodCall(ID, expressionList(ExpressionList)))
 in ( LrTable.NT 32, ( result, ID1left, RParen1right), rest671)
end
|  ( 64, ( ( _, ( _, _, RParen1right)) :: ( _, ( 
MlyValue.ExpressionList ExpressionList, _, _)) :: _ :: ( _, ( 
MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, ID1left, _))
 :: rest671)) => let val  result = MlyValue.SubroutineCall (
functionCall(ID1, ID2, expressionList(ExpressionList)))
 in ( LrTable.NT 32, ( result, ID1left, RParen1right), rest671)
end
|  ( 65, ( ( _, ( MlyValue.Expression Expression, Expression1left, 
Expression1right)) :: rest671)) => let val  result = 
MlyValue.ExpressionList ([Expression])
 in ( LrTable.NT 33, ( result, Expression1left, Expression1right), 
rest671)
end
|  ( 66, ( ( _, ( MlyValue.ExpressionList ExpressionList, _, 
ExpressionList1right)) :: _ :: ( _, ( MlyValue.Expression Expression, 
Expression1left, _)) :: rest671)) => let val  result = 
MlyValue.ExpressionList (Expression::ExpressionList)
 in ( LrTable.NT 33, ( result, Expression1left, ExpressionList1right),
 rest671)
end
|  ( 67, ( rest671)) => let val  result = MlyValue.ExpressionList ([])
 in ( LrTable.NT 33, ( result, defaultPos, defaultPos), rest671)
end
|  ( 68, ( ( _, ( _, True1left, True1right)) :: rest671)) => let val  
result = MlyValue.KeywordConstant ("true")
 in ( LrTable.NT 27, ( result, True1left, True1right), rest671)
end
|  ( 69, ( ( _, ( _, False1left, False1right)) :: rest671)) => let
 val  result = MlyValue.KeywordConstant ("false")
 in ( LrTable.NT 27, ( result, False1left, False1right), rest671)
end
|  ( 70, ( ( _, ( _, Null1left, Null1right)) :: rest671)) => let val  
result = MlyValue.KeywordConstant ("null")
 in ( LrTable.NT 27, ( result, Null1left, Null1right), rest671)
end
|  ( 71, ( ( _, ( _, This1left, This1right)) :: rest671)) => let val  
result = MlyValue.KeywordConstant ("this")
 in ( LrTable.NT 27, ( result, This1left, This1right), rest671)
end
|  ( 72, ( ( _, ( _, Plus1left, Plus1right)) :: rest671)) => let val  
result = MlyValue.BinaryOp (binaryOp("add"))
 in ( LrTable.NT 28, ( result, Plus1left, Plus1right), rest671)
end
|  ( 73, ( ( _, ( _, Minus1left, Minus1right)) :: rest671)) => let
 val  result = MlyValue.BinaryOp (binaryOp("sub"))
 in ( LrTable.NT 28, ( result, Minus1left, Minus1right), rest671)
end
|  ( 74, ( ( _, ( _, Times1left, Times1right)) :: rest671)) => let
 val  result = MlyValue.BinaryOp (binaryOp("call Math.multiply 2"))
 in ( LrTable.NT 28, ( result, Times1left, Times1right), rest671)
end
|  ( 75, ( ( _, ( _, Div1left, Div1right)) :: rest671)) => let val  
result = MlyValue.BinaryOp (binaryOp("call Math.divide 2"))
 in ( LrTable.NT 28, ( result, Div1left, Div1right), rest671)
end
|  ( 76, ( ( _, ( _, Amper1left, Amper1right)) :: rest671)) => let
 val  result = MlyValue.BinaryOp (binaryOp("and"))
 in ( LrTable.NT 28, ( result, Amper1left, Amper1right), rest671)
end
|  ( 77, ( ( _, ( _, Pipe1left, Pipe1right)) :: rest671)) => let val  
result = MlyValue.BinaryOp (binaryOp("or"))
 in ( LrTable.NT 28, ( result, Pipe1left, Pipe1right), rest671)
end
|  ( 78, ( ( _, ( _, LThan1left, LThan1right)) :: rest671)) => let
 val  result = MlyValue.BinaryOp (binaryOp("lt"))
 in ( LrTable.NT 28, ( result, LThan1left, LThan1right), rest671)
end
|  ( 79, ( ( _, ( _, GThan1left, GThan1right)) :: rest671)) => let
 val  result = MlyValue.BinaryOp (binaryOp("gt"))
 in ( LrTable.NT 28, ( result, GThan1left, GThan1right), rest671)
end
|  ( 80, ( ( _, ( _, Equals1left, Equals1right)) :: rest671)) => let
 val  result = MlyValue.BinaryOp (binaryOp("eq"))
 in ( LrTable.NT 28, ( result, Equals1left, Equals1right), rest671)

end
|  ( 81, ( ( _, ( _, Minus1left, Minus1right)) :: rest671)) => let
 val  result = MlyValue.UnaryOp ("neg")
 in ( LrTable.NT 29, ( result, Minus1left, Minus1right), rest671)
end
|  ( 82, ( ( _, ( _, Tilde1left, Tilde1right)) :: rest671)) => let
 val  result = MlyValue.UnaryOp ("not")
 in ( LrTable.NT 29, ( result, Tilde1left, Tilde1right), rest671)
end
|  ( 83, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.VarName (ID)
 in ( LrTable.NT 30, ( result, ID1left, ID1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.ClassDec x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : calc_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun Class (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.VOID,p1,p2))
fun Constructor (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.VOID,p1,p2))
fun Function (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.VOID,p1,p2))
fun Method (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun Field (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun Static (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun Var (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun Int (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun Char (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun Boolean (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun Void (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun True (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun False (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun Null (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun This (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun Let (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun Do (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun If (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun Else (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun While (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun Ret (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun LCurly (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun RCurly (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun LParen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun RParen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun LSquare (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun RSquare (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun FullStop (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
fun Comma (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.VOID,p1,p2))
fun SemiCol (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.VOID,p1,p2))
fun Plus (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.VOID,p1,p2))
fun Minus (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.VOID,p1,p2))
fun Times (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.VOID,p1,p2))
fun Div (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.VOID,p1,p2))
fun Amper (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.VOID,p1,p2))
fun Pipe (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.VOID,p1,p2))
fun LThan (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.VOID,p1,p2))
fun GThan (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.VOID,p1,p2))
fun Equals (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.VOID,p1,p2))
fun Tilde (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
ParserData.MlyValue.VOID,p1,p2))
fun IntConstant (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(
ParserData.MlyValue.IntConstant i,p1,p2))
fun StrConstant (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(
ParserData.MlyValue.StrConstant i,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(
ParserData.MlyValue.ID i,p1,p2))
end
end
