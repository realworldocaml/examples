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
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code "type shape = < area : float > ;;")
        (toplevel_responses ((OCaml "type shape = < area : float >"))))
       ((ocaml_code "type square = < area : float; width : int > ;;")
        (toplevel_responses
         ((OCaml "type square = < area : float; width : int >"))))
       ((ocaml_code
          "let square w = object\
         \n  method area = Float.of_int (w * w)\
         \n  method width = w\
         \nend ;;")
        (toplevel_responses
         ((OCaml "val square : int -> < area : float; width : int > = <fun>"))))
       ((ocaml_code "type circle = < area : float; radius : int > ;;")
        (toplevel_responses
         ((OCaml "type circle = < area : float; radius : int >"))))
       ((ocaml_code
          "let circle r = object\
         \n  method area = 3.14 *. (Float.of_int r) ** 2.0\
         \n  method radius = r\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "val circle : int -> < area : float; radius : int > = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "let remove_large l =\
         \n  List.filter ~f:(fun s -> s#area <= 100.) l ;;")
        (toplevel_responses
         ((OCaml
           "val remove_large : (< area : float; .. > as 'a) list -> 'a list = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let squares : < area : float; width : int > list = \
         \n  [square 5; square 15; square 10] ;;")
        (toplevel_responses
         ((OCaml
           "val squares : < area : float; width : int > list = [<obj>; <obj>; <obj>]"))))
       ((ocaml_code "remove_large squares ;;")
        (toplevel_responses
         ((OCaml "- : < area : float; width : int > list = [<obj>; <obj>]")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let remove_large (l: < area : float > list) = \
         \n  List.filter ~f:(fun s -> s#area <= 100.) l ;;")
        (toplevel_responses
         ((OCaml
           "val remove_large : < area : float > list -> < area : float > list = <fun>"))))
       ((ocaml_code "remove_large (squares :> < area : float > list ) ;;")
        (toplevel_responses
         ((OCaml "- : < area : float > list = [<obj>; <obj>]")))))))
    ((name 4)
     (chunks
      (((ocaml_code
         "let hlist: < area: float; ..> list = [square 10; circle 30] ;;")
        (toplevel_responses
         ((Raw
            "Characters 49-58:\
           \nError: This expression has type < area : float; radius : int >\
           \n       but an expression was expected of type < area : float; width : int >\
           \n       The second object type has no method radius")))))))
    ((name 5)
     (chunks
      (((ocaml_code
         "let shape_ref: < area: float; ..> ref = ref (square 40) ;;")
        (toplevel_responses
         ((OCaml
           "val shape_ref : < area : float; width : int > ref = {contents = <obj>}"))))
       ((ocaml_code "shape_ref := circle 20 ;;")
        (toplevel_responses
         ((Raw
            "Characters 13-22:\
           \nError: This expression has type < area : float; radius : int >\
           \n       but an expression was expected of type < area : float; width : int >\
           \n       The second object type has no method radius")))))))
    ((name 6)
     (chunks
      (((ocaml_code
         "let hlist: shape list = [(square 10 :> shape); (circle 30 :> shape)] ;;")
        (toplevel_responses
         ((OCaml "val hlist : shape list = [<obj>; <obj>]"))))
       ((ocaml_code "let shape_ref: shape ref = ref (square 40 :> shape) ;;")
        (toplevel_responses
         ((OCaml "val shape_ref : shape ref = {contents = <obj>}"))))
       ((ocaml_code "shape_ref := (circle 20 :> shape) ;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))))
  (matched true)))
