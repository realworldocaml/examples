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
      (((ocaml_code "type t = { foo: int; bar: float } [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { foo : int; bar : float; }\
           \nval t_of_sexp : Sexplib0.Sexp.t -> t = <fun>\
           \nval sexp_of_t : t -> Sexplib0.Sexp.t = <fun>"))))
       ((ocaml_code "t_of_sexp (Sexp.of_string \"((bar 35) (foo 3))\") ;;")
        (toplevel_responses ((OCaml "- : t = {foo = 3; bar = 35.}")))))))
    ((name 1)
     (chunks
      (((ocaml_code "exception Bad_message of string list ;;")
        (toplevel_responses ((OCaml "exception Bad_message of string list"))))
       ((ocaml_code "Exn.to_string (Bad_message [\"1\";\"2\";\"3\"]) ;;")
        (toplevel_responses
         ((OCaml "- : string = \"(\\\"Bad_message(_)\\\")\""))))
       ((ocaml_code
         "exception Good_message of string list [@@deriving sexp];;")
        (toplevel_responses
         ((OCaml "exception Good_message of string list"))))
       ((ocaml_code "Exn.to_string (Good_message [\"1\";\"2\";\"3\"]) ;;")
        (toplevel_responses
         ((OCaml "- : string = \"(//toplevel//.Good_message (1 2 3))\"")))))))))
  (matched true)))
