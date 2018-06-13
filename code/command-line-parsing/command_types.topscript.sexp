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
       ((ocaml_code "open Core;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code "Command.Spec.empty ;;")
        (toplevel_responses
         ((OCaml "- : ('m, 'm) Command.Spec.t = <abstr>"))))
       ((ocaml_code "Command.Spec.(empty +> anon (\"foo\" %: int)) ;;")
        (toplevel_responses
         ((OCaml "- : (int -> '_a, '_a) Command.Spec.t = <abstr>")))))))))
  (matched true)))
