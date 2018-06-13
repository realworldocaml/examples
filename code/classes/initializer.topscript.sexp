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
      (((ocaml_code
          "class obj x = \
         \n  let () = printf \"Creating obj %d\\n\" x in\
         \n  object \
         \n    val field = printf \"Initializing field\\n\"; x\
         \n  end ;;")
        (toplevel_responses
         ((OCaml "class obj : int -> object val field : int end"))))
       ((ocaml_code "let o = new obj 3 ;;")
        (toplevel_responses
         ((Raw  "Creating obj 3\
               \nInitializing field")
          (OCaml "val o : obj = <obj>")))))))))
  (matched true)))
