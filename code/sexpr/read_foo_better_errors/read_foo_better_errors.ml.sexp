(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \ntype t = { \
    \n  a: string;\
    \n  b: int;\
    \n  c: float option \
    \n} [@@deriving sexp]\
    \n\
    \nlet run () =\
    \n  let t = Sexp.load_sexp_conv_exn \"foo_broken_example.scm\" t_of_sexp in\
    \n  printf \"b is: %d\\n%!\" t.b\
    \n\
    \nlet () =\
    \n  Exn.handle_uncaught ~exit:true run"))))
