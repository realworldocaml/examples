(OCaml
 (((name "")
   (content
     "module Shapes : sig\
    \n  type shape_repr\
    \n  type shape =\
    \n    < repr : shape_repr; equals : shape -> bool; area: float >\
    \n\
    \n  class square : int ->\
    \n    object\
    \n      method width : int\
    \n      method area : float\
    \n      method repr : shape_repr\
    \n      method equals : shape -> bool\
    \n    end\
    \nend = struct\
    \n  type shape_repr = \
    \n  | Square of int \
    \n  | Circle of int \
    \n  ...\
    \nend"))))
