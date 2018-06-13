(OCaml
 (((name 4)
   (content
     "(* Inefficient right-recursive rule *)\
    \nobject_fields:\
    \n  | (* empty *) { [] }\
    \n  | k = ID; COLON; v = value; COMMA; obj = object_fields\
    \n    { (k, v) :: obj }"))
  ((name "") (content "\n"))))
