(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \ntype basic_color =\
    \n  [ `Black   | `Blue | `Cyan  | `Green\
    \n  | `Magenta | `Red  | `White | `Yellow ]\
    \n\
    \ntype color =\
    \n  [ `Basic of basic_color * [ `Bold | `Regular ]\
    \n  | `Gray of int\
    \n  | `RGB  of int * int * int ]\
    \n\
    \ntype extended_color =\
    \n  [ color\
    \n  | `RGBA of int * int * int * int ]\
    \n\
    \nval color_to_int          : color -> int\
    \nval extended_color_to_int : extended_color -> int"))))
