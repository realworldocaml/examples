(OCaml
 (((name 1)
   (content
     "let print_median m =\
    \n  let module C = Counter in\
    \n  match m with\
    \n  | C.Median string -> printf \"True median:\\n   %s\\n\" string\
    \n  | C.Before_and_after (before, after) ->\
    \n    printf \"Before and after median:\\n   %s\\n   %s\\n\" before after"))
  ((name "") (content "open! Core_kernel\n"))))
