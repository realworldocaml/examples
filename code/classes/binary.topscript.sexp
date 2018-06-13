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
          "class square w = object(self : 'self) \
         \n  method width = w\
         \n  method area = Float.of_int (self#width * self#width)\
         \n  method equals (other : 'self) = other#width = self#width\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class square :\
           \n  int ->\
           \n  object ('a)\
           \n    method area : float\
           \n    method equals : 'a -> bool\
           \n    method width : int\
           \n  end"))))
       ((ocaml_code
          "class circle r = object(self : 'self)\
         \n  method radius = r\
         \n  method area = 3.14 *. (Float.of_int self#radius) ** 2.0\
         \n  method equals (other : 'self) = other#radius = self#radius\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class circle :\
           \n  int ->\
           \n  object ('a)\
           \n    method area : float\
           \n    method equals : 'a -> bool\
           \n    method radius : int\
           \n  end")))))))
    ((name 1)
     (chunks
      (((ocaml_code "(new square 5)#equals (new square 5) ;;")
        (toplevel_responses ((OCaml "- : bool = true"))))
       ((ocaml_code "(new circle 10)#equals (new circle 7) ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 2)
     (chunks
      (((ocaml_code
         "type shape = < equals : shape -> bool; area : float > ;;")
        (toplevel_responses
         ((OCaml "type shape = < area : float; equals : shape -> bool >"))))
       ((ocaml_code "(new square 5 :> shape) ;;")
        (toplevel_responses
         ((Raw
            "Characters 0-23:\
           \nError: Type square = < area : float; equals : square -> bool; width : int >\
           \n       is not a subtype of shape = < area : float; equals : shape -> bool > \
           \n       Type shape = < area : float; equals : shape -> bool >\
           \n       is not a subtype of\
           \n         square = < area : float; equals : square -> bool; width : int > ")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "(object method area = 5 end) = (object method area = 5 end) ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "type shape_repr =\
         \n  | Square of int\
         \n  | Circle of int ;;")
        (toplevel_responses
         ((OCaml "type shape_repr = Square of int | Circle of int"))))
       ((ocaml_code
          "type shape =\
         \n  < repr : shape_repr; equals : shape -> bool; area : float > ;;")
        (toplevel_responses
         ((OCaml
           "type shape = < area : float; equals : shape -> bool; repr : shape_repr >"))))
       ((ocaml_code
          "class square w = object(self) \
         \n  method width = w\
         \n  method area = Float.of_int (self#width * self#width)\
         \n  method repr = Square self#width\
         \n  method equals (other : shape) = other#repr = self#repr\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class square :\
           \n  int ->\
           \n  object\
           \n    method area : float\
           \n    method equals : shape -> bool\
           \n    method repr : shape_repr\
           \n    method width : int\
           \n  end")))))))))
  (matched true)))
