(OCaml
 (((name 4)
   (content
     "(* Quadratic left-recursive rule *)\
    \nobject_fields:\
    \n  | (* empty *) { [] }\
    \n  | obj = object_fields; COMMA; k = ID; COLON; v = value\
    \n    { obj @ [k, v] }\
    \n  ;"))
  ((name "") (content "\n"))))
