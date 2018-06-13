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
      (((ocaml_code "let l = [(1,\"one\"); (2,\"two\")] ;;")
        (toplevel_responses
         ((OCaml
           "val l : (int * string) list = [(1, \"one\"); (2, \"two\")]"))))
       ((ocaml_code
          "List.iter l ~f:(fun x ->\
         \n  [%sexp_of: int * string ] x\
         \n  |> Sexp.to_string\
         \n  |> print_endline) ;;")
        (toplevel_responses
         ((Raw  "(1 one)\
               \n(2 two)") (OCaml "- : unit = ()")))))))))
  (matched true)))
