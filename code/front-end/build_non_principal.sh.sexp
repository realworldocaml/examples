(Other
  "$ ocamlc -i -principal non_principal.ml\
 \nFile \"non_principal.ml\", line 6, characters 4-7:\
 \nWarning 18: this type-based field disambiguation is not principal.\
 \ntype s = { foo : int; bar : unit; }\
 \ntype t = { foo : int; }\
 \nval f : s -> int\
 \n")
