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
       ((ocaml_code "1 == 2 ;;")
        (toplevel_responses
         ((Raw
            "Characters 2-4:\
           \nWarning 3: deprecated: Core_kernel.==\
           \n[since 2014-10] Use [phys_equal]")
          (OCaml "- : bool = false"))))
       ((ocaml_code "phys_equal 1 2 ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))))
  (matched true)))
