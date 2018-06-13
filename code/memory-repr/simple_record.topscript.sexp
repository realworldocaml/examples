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
      (((ocaml_code "type t = { foo: int; bar: int } ;;")
        (toplevel_responses ((OCaml "type t = { foo : int; bar : int; }"))))
       ((ocaml_code "let x = { foo = 13; bar = 14 } ;;")
        (toplevel_responses ((OCaml "val x : t = {foo = 13; bar = 14}")))))))))
  (matched true)))
