(OCaml
 (((name 1)
   (content
     "let print_median m =\
    \n  match m with\
    \n  | Counter.Median string -> printf \"True median:\\n   %s\\n\" string\
    \n  | Counter.Before_and_after (before, after) ->\
    \n    printf \"Before and after median:\\n   %s\\n   %s\\n\" before after"))
  ((name "") (content "open! Core_kernel\n"))))
