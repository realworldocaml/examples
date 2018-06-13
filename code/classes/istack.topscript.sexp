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
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code
          "class istack = object\
         \n  val mutable v = [0; 2]\
         \n\
         \n  method pop =\
         \n    match v with\
         \n    | hd :: tl ->\
         \n      v <- tl;\
         \n      Some hd\
         \n    | [] -> None\
         \n\
         \n  method push hd =\
         \n    v <- hd :: v\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class istack :\
           \n  object\
           \n    val mutable v : int list\
           \n    method pop : int option\
           \n    method push : int -> unit\
           \n  end")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let s = new istack ;;")
        (toplevel_responses ((OCaml "val s : istack = <obj>"))))
       ((ocaml_code "s#pop ;;")
        (toplevel_responses ((OCaml "- : int option = Some 0"))))
       ((ocaml_code "s#push 5 ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "s#pop ;;")
        (toplevel_responses ((OCaml "- : int option = Some 5")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "type istack = < pop: int option; push: int -> unit > ;;")
        (toplevel_responses
         ((OCaml "type istack = < pop : int option; push : int -> unit >")))))))))
  (matched true)))
