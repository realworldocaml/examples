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
       ((ocaml_code "#silent false;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code
          "let remember =\
         \n  let cache = ref None in\
         \n  (fun x ->\
         \n     match !cache with\
         \n     | Some y -> y\
         \n     | None -> cache := Some x; x)\
         \n;;")
        (toplevel_responses ((OCaml "val remember : '_a -> '_a = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let identity x = x;;")
        (toplevel_responses ((OCaml "val identity : 'a -> 'a = <fun>"))))
       ((ocaml_code "identity 3;;")
        (toplevel_responses ((OCaml "- : int = 3"))))
       ((ocaml_code "identity \"five\";;")
        (toplevel_responses ((OCaml "- : string = \"five\"")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let remember_three () = remember 3;;")
        (toplevel_responses
         ((OCaml "val remember_three : unit -> int = <fun>"))))
       ((ocaml_code "remember;;")
        (toplevel_responses ((OCaml "- : int -> int = <fun>"))))
       ((ocaml_code "remember \"avocado\";;")
        (toplevel_responses
         ((Raw
            "Characters 9-18:\
           \nError: This expression has type string but an expression was expected of type\
           \n         int")))))))))
  (matched true)))
