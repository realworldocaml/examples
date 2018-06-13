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
      (((ocaml_code "type no_converter = int * int ;;")
        (toplevel_responses ((OCaml "type no_converter = int * int"))))
       ((ocaml_code
         "type t = { a: no_converter; b: string } [@@deriving sexp] ;;")
        (toplevel_responses
         ((Raw
            "Characters 14-26:\
           \nError: Unbound value no_converter_of_sexp")))))))
    ((name 1)
     (chunks
      (((ocaml_code
         "type t = { a: no_converter sexp_opaque; b: string } [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { a : no_converter; b : string; }\
           \nval t_of_sexp : Sexplib0.Sexp.t -> t = <fun>\
           \nval sexp_of_t : t -> Sexplib0.Sexp.t = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "sexp_of_t { a = (3,4); b = \"foo\" } ;;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((a <opaque>) (b foo))")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "t_of_sexp (Sexp.of_string \"((a whatever) (b foo))\") ;;")
        (toplevel_responses
         ((Raw
            "Exception:\
           \n(Sexplib.Conv.Of_sexp_error\
           \n (Failure \"opaque_of_sexp: cannot convert opaque values\") whatever).")))))))
    ((name 4)
     (chunks
      (((ocaml_code
         "type t = { a: no_converter sexp_opaque list; b: string } [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { a : no_converter list; b : string; }\
           \nval t_of_sexp : Sexp.t -> t = <fun>\
           \nval sexp_of_t : t -> Sexp.t = <fun>"))))
       ((ocaml_code "t_of_sexp (Sexp.of_string \"((a ()) (b foo))\") ;;")
        (toplevel_responses ((OCaml "- : t = {a = []; b = \"foo\"}")))))))
    ((name 5)
     (chunks
      (((ocaml_code
         "type t = { a: no_converter sexp_opaque; b: string } [@@deriving sexp_of] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { a : no_converter; b : string; }\
           \nval sexp_of_t : t -> Sexp.t = <fun>"))))
       ((ocaml_code
         "type t = { a: no_converter sexp_opaque; b: string } [@@deriving of_sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type t = { a : no_converter; b : string; }\
           \nval t_of_sexp : Sexp.t -> t = <fun>")))))))))
  (matched true)))
