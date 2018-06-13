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
          "let x = Float.sin 120. in\
         \nlet y = Float.sin 75.  in\
         \nlet z = Float.sin 128. in\
         \nList.exists ~f:(fun x -> x < 0.) [x;y;z]\
         \n;;")
        (toplevel_responses ((OCaml "- : bool = true")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let x = lazy (Float.sin 120.) in\
         \nlet y = lazy (Float.sin 75.)  in\
         \nlet z = lazy (Float.sin 128.) in\
         \nList.exists ~f:(fun x -> Lazy.force x < 0.) [x;y;z]\
         \n;;")
        (toplevel_responses ((OCaml "- : bool = true")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let x = lazy (printf \"1\\n\"; Float.sin 120.) in\
         \nlet y = lazy (printf \"2\\n\"; Float.sin 75.)  in\
         \nlet z = lazy (printf \"3\\n\"; Float.sin 128.) in\
         \nList.exists ~f:(fun x -> Lazy.force x < 0.) [x;y;z]\
         \n;;")
        (toplevel_responses ((Raw  "1\
                                  \n2") (OCaml "- : bool = true")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "List.exists ~f:(fun x -> x < 0.)\
         \n  [ (printf \"1\\n\"; Float.sin 120.);\
         \n    (printf \"2\\n\"; Float.sin 75.);\
         \n    (printf \"3\\n\"; Float.sin 128.); ]\
         \n;;")
        (toplevel_responses ((Raw  "3\
                                  \n2\
                                  \n1") (OCaml "- : bool = true")))))))))
  (matched true)))
