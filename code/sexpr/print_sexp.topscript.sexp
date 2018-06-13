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
    ((name 1)
     (chunks
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code
          "Sexp.List [\
         \n  Sexp.Atom \"this\";\
         \n  Sexp.List [ Sexp.Atom \"is\"; Sexp.Atom \"an\"];\
         \n  Sexp.List [ Sexp.Atom \"s\"; Sexp.Atom \"expression\" ];\
         \n];;")
        (toplevel_responses
         ((OCaml "- : Sexp.t = (this (is an) (s expression))")))))))))
  (matched true)))
