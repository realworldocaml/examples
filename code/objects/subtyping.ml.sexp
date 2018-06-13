(OCaml
 (((name 2)
   (content
     "type 'a stack = < pop: 'a option; push: 'a -> unit >\
    \n\
    \nlet square_stack: square stack = stack [square 30; square 10]\
    \n\
    \nlet circle_stack: circle stack = stack [circle 20; circle 40]"))
  ((name 1)
   (content
     "type shape = < area : float >\
    \n\
    \ntype square = < area : float; width : int >\
    \n\
    \nlet square w = object\
    \n  method area = Float.of_int (w * w)\
    \n  method width = w\
    \nend\
    \n\
    \ntype circle = < area : float; radius : int >\
    \n\
    \nlet circle r = object\
    \n  method area = 3.14 *. (Float.of_int r) ** 2.0\
    \n  method radius = r\
    \nend\
    \n\
    \n"))
  ((name "") (content "\n"))))
