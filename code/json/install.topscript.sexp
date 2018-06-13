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
      (((ocaml_code "open Core_kernel ;;") (toplevel_responses ()))
       ((ocaml_code "#require \"yojson\" ;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/easy-format: added to search path\
           \n/home/travis/.opam/4.04.2/lib/easy-format/easy_format.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/biniou: added to search path\
           \n/home/travis/.opam/4.04.2/lib/biniou/biniou.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/yojson: added to search path\
           \n/home/travis/.opam/4.04.2/lib/yojson/yojson.cma: loaded"))))
       ((ocaml_code "open Yojson ;;") (toplevel_responses ())))))))
  (matched false)))
