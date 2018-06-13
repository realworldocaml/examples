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
    ((name 0.5)
     (chunks
      (((ocaml_code
         "type t = { a: int option; b: string } [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { a : int option; b : string; }\
           \nval t_of_sexp : Sexplib0.Sexp.t -> t = <fun>\
           \nval sexp_of_t : t -> Sexplib0.Sexp.t = <fun>"))))
       ((ocaml_code "sexp_of_t { a = None; b = \"hello\" } ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((a ()) (b hello))"))))
       ((ocaml_code "sexp_of_t { a = Some 3; b = \"hello\" } ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((a (3)) (b hello))")))))))
    ((name 1)
     (chunks
      (((ocaml_code
         "type t = { a: int sexp_option; b: string } [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { a : int option; b : string; }\
           \nval t_of_sexp : Sexp.t -> t = <fun>\
           \nval sexp_of_t : t -> Sexp.t = <fun>"))))
       ((ocaml_code "sexp_of_t { a = Some 3; b = \"hello\" } ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((a 3) (b hello))"))))
       ((ocaml_code "sexp_of_t { a = None; b = \"hello\" } ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((b hello))")))))))))
  (matched true)))
