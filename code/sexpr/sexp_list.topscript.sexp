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
          "type compatible_versions =\
         \n  | Specific of string list\
         \n  | All [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type compatible_versions = Specific of string list | All\
           \nval compatible_versions_of_sexp : Sexplib0.Sexp.t -> compatible_versions =\
           \n  <fun>\
           \nval sexp_of_compatible_versions : compatible_versions -> Sexplib0.Sexp.t =\
           \n  <fun>"))))
       ((ocaml_code
          "sexp_of_compatible_versions\
         \n  (Specific [\"3.12.0\"; \"3.12.1\"; \"3.13.0\"]) ;;")
        (toplevel_responses
         ((OCaml "- : Sexp.t = (Specific (3.12.0 3.12.1 3.13.0))")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "type compatible_versions =\
         \n  | Specific of string sexp_list\
         \n  | All [@@deriving sexp] ;;")
        (toplevel_responses
         ((OCaml
            "type compatible_versions = Specific of string list | All\
           \nval compatible_versions_of_sexp : Sexp.t -> compatible_versions = <fun>\
           \nval sexp_of_compatible_versions : compatible_versions -> Sexp.t = <fun>"))))
       ((ocaml_code
          "sexp_of_compatible_versions\
         \n  (Specific [\"3.12.0\"; \"3.12.1\"; \"3.13.0\"]) ;;")
        (toplevel_responses
         ((OCaml "- : Sexp.t = (Specific 3.12.0 3.12.1 3.13.0)")))))))))
  (matched true)))
