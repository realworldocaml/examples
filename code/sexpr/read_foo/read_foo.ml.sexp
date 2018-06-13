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
    \n  let t =\
    \n    Sexp.load_sexp \"foo_broken_example.scm\"\
    \n    |> t_of_sexp\
    \n  in\
    \n  printf \"b is: %d\\n%!\" t.b\
    \n\
    \nlet () =\
    \n  Exn.handle_uncaught ~exit:true run"))))
