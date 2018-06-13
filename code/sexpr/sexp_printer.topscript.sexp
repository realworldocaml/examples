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
       ((ocaml_code "#silent false;;") (toplevel_responses ()))
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code
         "Sexp.to_string (Sexp.List [Sexp.Atom \"1\"; Sexp.Atom \"2\"]) ;;")
        (toplevel_responses ((OCaml "- : string = \"(1 2)\""))))
       ((ocaml_code "Sexp.of_string (\"(1 2 (3 4))\") ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = (1 2 (3 4))")))))))))
  (matched true)))
