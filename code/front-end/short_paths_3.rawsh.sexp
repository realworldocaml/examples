(Other
  "$ ocaml -short-paths\
 \n# open Core;;\
 \n# List.map ~f:print_endline \"foo\";;\
 \nError: This expression has type string but an expression was expected of type\
 \n         'a list\
 \n")
