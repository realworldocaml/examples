(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#silent true;;") (toplevel_responses ()))
       ((ocaml_code "#use \"topfind\";;") (toplevel_responses ()))
       ((ocaml_code "#thread;;") (toplevel_responses ()))
       ((ocaml_code "#camlp4o;;") (toplevel_responses ()))
       ((ocaml_code "#require \"core\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"core.top\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"ppx_jane\";;") (toplevel_responses ()))
       ((ocaml_code "#silent false;;") (toplevel_responses ())))))
    ((name 0.5)
     (chunks
      (((ocaml_code  "let x = 7 in\
                    \nx + x\
                    \n;;")
        (toplevel_responses ((OCaml "- : int = 14")))))))
    ((name 1)
     (chunks
      (((ocaml_code "x;;")
        (toplevel_responses
         ((Raw  "Characters 0-1:\
               \nError: Unbound value x")))))))
    ((name 2)
     (chunks
      (((ocaml_code  "let x = 7 in\
                    \nlet y = x * x in\
                    \nx + y\
                    \n;;")
        (toplevel_responses ((OCaml "- : int = 56")))))))))
  (matched true)))
