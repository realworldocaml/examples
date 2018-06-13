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
      (((ocaml_code "type t = { foo: int; bar: float } ;;")
        (toplevel_responses ((OCaml "type t = { foo : int; bar : float; }"))))
       ((ocaml_code
          "let sexp_of_t t =\
         \n  let a x = Sexp.Atom x and l x = Sexp.List x in\
         \n  l [ l [a \"foo\"; Int.sexp_of_t t.foo  ];\
         \n      l [a \"bar\"; Float.sexp_of_t t.bar]; ] ;;")
        (toplevel_responses ((OCaml "val sexp_of_t : t -> Sexp.t = <fun>"))))
       ((ocaml_code "sexp_of_t { foo = 3; bar = -5.5 } ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((foo 3) (bar -5.5))")))))))))
  (matched true)))
