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
      (((ocaml_code "List.find_map;;")
        (toplevel_responses
         ((OCaml "- : 'a list -> f:('a -> 'b option) -> 'b option = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let rec endless_loop = 1 :: 2 :: 3 :: endless_loop;;")
        (toplevel_responses
         ((OCaml "val endless_loop : int list = [1; 2; 3; <cycle>]")))))))))
  (matched true)))
