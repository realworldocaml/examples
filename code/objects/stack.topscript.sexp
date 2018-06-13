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
          "let s = object\
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
         ((OCaml "val s : < pop : int option; push : int -> unit > = <obj>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "s#pop ;;")
        (toplevel_responses ((OCaml "- : int option = Some 0"))))
       ((ocaml_code "s#push 4 ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "s#pop ;;")
        (toplevel_responses ((OCaml "- : int option = Some 4")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let stack init = object\
         \n  val mutable v = init\
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
           "val stack : 'a list -> < pop : 'a option; push : 'a -> unit > = <fun>"))))
       ((ocaml_code "let s = stack [3; 2; 1] ;;")
        (toplevel_responses
         ((OCaml "val s : < pop : int option; push : int -> unit > = <obj>"))))
       ((ocaml_code "s#pop ;;")
        (toplevel_responses ((OCaml "- : int option = Some 3")))))))
    ((name 4)
     (chunks
      (((ocaml_code
         "let print_pop st = Option.iter ~f:(printf \"Popped: %d\\n\") st#pop ;;")
        (toplevel_responses
         ((OCaml "val print_pop : < pop : int option; .. > -> unit = <fun>"))))
       ((ocaml_code "print_pop (stack [5;4;3;2;1]) ;;")
        (toplevel_responses ((Raw "Popped: 5") (OCaml "- : unit = ()"))))
       ((ocaml_code
          "let t = object\
         \n  method pop = Some (Time_ns.to_int_ns_since_epoch (Time_ns.now ()))\
         \nend ;;")
        (toplevel_responses ((OCaml "val t : < pop : int option > = <obj>"))))
       ((ocaml_code "print_pop t ;;")
        (toplevel_responses ((Raw " ... ") (OCaml "- : unit = ()")))))))))
  (matched true)))
