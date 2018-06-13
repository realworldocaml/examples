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
      (((ocaml_code "Int.sexp_of_t 3;;")
        (toplevel_responses ((OCaml "- : Sexplib0.Sexp.t = 3"))))
       ((ocaml_code "String.sexp_of_t \"hello\";;")
        (toplevel_responses ((OCaml "- : Sexp.t = hello"))))
       ((ocaml_code "Exn.sexp_of_t (Invalid_argument \"foo\");;")
        (toplevel_responses ((OCaml "- : Sexp.t = (Invalid_argument foo)")))))))
    ((name 1)
     (chunks
      (((ocaml_code "List.sexp_of_t;;")
        (toplevel_responses
         ((OCaml "- : ('a -> Sexp.t) -> 'a list -> Sexp.t = <fun>"))))
       ((ocaml_code "List.sexp_of_t Int.sexp_of_t [1; 2; 3];;")
        (toplevel_responses ((OCaml "- : Sexp.t = (1 2 3)")))))))
    ((name 2)
     (chunks
      (((ocaml_code "List.t_of_sexp;;")
        (toplevel_responses
         ((OCaml "- : (Sexp.t -> 'a) -> Sexp.t -> 'a list = <fun>"))))
       ((ocaml_code
         "List.t_of_sexp Int.t_of_sexp (Sexp.of_string \"(1 2 3)\");;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]"))))
       ((ocaml_code
         "List.t_of_sexp Int.t_of_sexp (Sexp.of_string \"(1 2 three)\");;")
        (toplevel_responses
         ((Raw
            "Exception:\
           \n(Sexplib.Conv.Of_sexp_error (Failure \"int_of_sexp: (Failure int_of_string)\")\
           \n three).")))))))))
  (matched true)))
