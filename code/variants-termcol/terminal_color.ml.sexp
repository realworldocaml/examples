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
    \nlet basic_color_to_int = function\
    \n  | `Black -> 0 | `Red     -> 1 | `Green -> 2 | `Yellow -> 3\
    \n  | `Blue  -> 4 | `Magenta -> 5 | `Cyan  -> 6 | `White  -> 7\
    \n\
    \nlet color_to_int = function\
    \n  | `Basic (basic_color,weight) ->\
    \n    let base = match weight with `Bold -> 8 | `Regular -> 0 in\
    \n    base + basic_color_to_int basic_color\
    \n  | `RGB (r,g,b) -> 16 + b + g * 6 + r * 36\
    \n  | `Gray i -> 232 + i\
    \n \
    \nlet extended_color_to_int = function\
    \n  | `RGBA (r,g,b,a) -> 256 + a + b * 6 + g * 36 + r * 216\
    \n  | `Grey x -> 2000 + x\
    \n  | (`Basic _ | `RGB _ | `Gray _) as color -> color_to_int color"))))
