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
    ((name 0.5)
     (chunks
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code
          "type basic_color =\
         \n  | Black | Red | Green | Yellow | Blue | Magenta | Cyan | White ;;")
        (toplevel_responses
         ((OCaml
            "type basic_color =\
           \n    Black\
           \n  | Red\
           \n  | Green\
           \n  | Yellow\
           \n  | Blue\
           \n  | Magenta\
           \n  | Cyan\
           \n  | White"))))
       ((ocaml_code "Cyan ;;")
        (toplevel_responses ((OCaml "- : basic_color = Cyan"))))
       ((ocaml_code "[Blue; Magenta; Red] ;;")
        (toplevel_responses
         ((OCaml "- : basic_color list = [Blue; Magenta; Red]")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "let basic_color_to_int = function\
         \n  | Black -> 0 | Red     -> 1 | Green -> 2 | Yellow -> 3\
         \n  | Blue  -> 4 | Magenta -> 5 | Cyan  -> 6 | White  -> 7 ;;")
        (toplevel_responses
         ((OCaml "val basic_color_to_int : basic_color -> int = <fun>"))))
       ((ocaml_code "List.map ~f:basic_color_to_int [Blue;Red];;")
        (toplevel_responses ((OCaml "- : int list = [4; 1]")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let color_by_number number text =\
         \n  sprintf \"\\027[38;5;%dm%s\\027[0m\" number text;;")
        (toplevel_responses
         ((OCaml "val color_by_number : int -> string -> string = <fun>"))))
       ((ocaml_code
         "let blue = color_by_number (basic_color_to_int Blue) \"Blue\";;")
        (toplevel_responses
         ((OCaml "val blue : string = \"\\027[38;5;4mBlue\\027[0m\""))))
       ((ocaml_code "printf \"Hello %s World!\\n\" blue;;")
        (toplevel_responses
         ((Raw "Hello \027[38;5;4mBlue\027[0m World!")
          (OCaml "- : unit = ()")))))))
    ((name 3)
     (chunks
      (((ocaml_code "type weight = Regular | Bold;;")
        (toplevel_responses ((OCaml "type weight = Regular | Bold"))))
       ((ocaml_code
          "type color =\
         \n  | Basic of basic_color * weight (* basic colors, regular and bold *)\
         \n  | RGB   of int * int * int       (* 6x6x6 color cube *)\
         \n  | Gray  of int                   (* 24 grayscale levels *)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type color =\
           \n    Basic of basic_color * weight\
           \n  | RGB of int * int * int\
           \n  | Gray of int"))))
       ((ocaml_code "[RGB (250,70,70); Basic (Green, Regular)];;")
        (toplevel_responses
         ((OCaml
           "- : color list = [RGB (250, 70, 70); Basic (Green, Regular)]")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let color_to_int = function\
         \n  | Basic (basic_color,weight) ->\
         \n    let base = match weight with Bold -> 8 | Regular -> 0 in\
         \n    base + basic_color_to_int basic_color\
         \n  | RGB (r,g,b) -> 16 + b + g * 6 + r * 36\
         \n  | Gray i -> 232 + i ;;")
        (toplevel_responses
         ((OCaml "val color_to_int : color -> int = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let color_print color s =\
         \n  printf \"%s\\n\" (color_by_number (color_to_int color) s);;")
        (toplevel_responses
         ((OCaml "val color_print : color -> string -> unit = <fun>"))))
       ((ocaml_code "color_print (Basic (Red,Bold)) \"A bold red!\";;")
        (toplevel_responses
         ((Raw "\027[38;5;9mA bold red!\027[0m") (OCaml "- : unit = ()"))))
       ((ocaml_code "color_print (Gray 4) \"A muted gray...\";;")
        (toplevel_responses
         ((Raw "\027[38;5;236mA muted gray...\027[0m")
          (OCaml "- : unit = ()")))))))
    ((name 6)
     (chunks
      (((ocaml_code "let three = `Int 3;;")
        (toplevel_responses
         ((OCaml "val three : [> `Int of int ] = `Int 3"))))
       ((ocaml_code "let four = `Float 4.;;")
        (toplevel_responses
         ((OCaml "val four : [> `Float of float ] = `Float 4."))))
       ((ocaml_code "let nan = `Not_a_number;;")
        (toplevel_responses
         ((OCaml "val nan : [> `Not_a_number ] = `Not_a_number"))))
       ((ocaml_code "[three; four; nan];;")
        (toplevel_responses
         ((OCaml
            "- : [> `Float of float | `Int of int | `Not_a_number ] list =\
           \n[`Int 3; `Float 4.; `Not_a_number]")))))))
    ((name 7)
     (chunks
      (((ocaml_code "let five = `Int \"five\";;")
        (toplevel_responses
         ((OCaml "val five : [> `Int of string ] = `Int \"five\""))))
       ((ocaml_code "[three; four; five];;")
        (toplevel_responses
         ((Raw
            "Characters 14-18:\
           \nError: This expression has type [> `Int of string ]\
           \n       but an expression was expected of type\
           \n         [> `Float of float | `Int of int ]\
           \n       Types for tag `Int are incompatible")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let is_positive = function\
         \n  | `Int   x -> x > 0\
         \n  | `Float x -> x > 0.\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val is_positive : [< `Float of float | `Int of int ] -> bool = <fun>")))))))
    ((name 9)
     (chunks
      (((ocaml_code "let exact = List.filter ~f:is_positive [three;four];;")
        (toplevel_responses
         ((OCaml
           "val exact : [ `Float of float | `Int of int ] list = [`Int 3; `Float 4.]")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "let is_positive = function\
         \n  | `Int   x -> Ok (x > 0)\
         \n  | `Float x -> Ok (x > 0.)\
         \n  | `Not_a_number -> Error \"not a number\";;")
        (toplevel_responses
         ((OCaml
            "val is_positive :\
           \n  [< `Float of float | `Int of int | `Not_a_number ] -> (bool, string) result =\
           \n  <fun>"))))
       ((ocaml_code
          "List.filter [three; four] ~f:(fun x ->\
         \n  match is_positive x with Error _ -> false | Ok b -> b);;")
        (toplevel_responses
         ((OCaml
            "- : [< `Float of float | `Int of int | `Not_a_number > `Float `Int ] list =\
           \n[`Int 3; `Float 4.]")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "type extended_color =\
         \n  | Basic of basic_color * weight  (* basic colors, regular and bold *)\
         \n  | RGB   of int * int * int       (* 6x6x6 color space *)\
         \n  | Gray  of int                   (* 24 grayscale levels *)\
         \n  | RGBA  of int * int * int * int (* 6x6x6x6 color space *)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type extended_color =\
           \n    Basic of basic_color * weight\
           \n  | RGB of int * int * int\
           \n  | Gray of int\
           \n  | RGBA of int * int * int * int")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let extended_color_to_int = function\
         \n  | RGBA (r,g,b,a) -> 256 + a + b * 6 + g * 36 + r * 216\
         \n  | (Basic _ | RGB _ | Gray _) as color -> color_to_int color\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 150-155:\
           \nError: This expression has type extended_color\
           \n       but an expression was expected of type color")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "let basic_color_to_int = function\
         \n  | `Black -> 0 | `Red     -> 1 | `Green -> 2 | `Yellow -> 3\
         \n  | `Blue  -> 4 | `Magenta -> 5 | `Cyan  -> 6 | `White  -> 7\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val basic_color_to_int :\
           \n  [< `Black | `Blue | `Cyan | `Green | `Magenta | `Red | `White | `Yellow ] ->\
           \n  int = <fun>"))))
       ((ocaml_code
          "let color_to_int = function\
         \n  | `Basic (basic_color,weight) ->\
         \n    let base = match weight with `Bold -> 8 | `Regular -> 0 in\
         \n    base + basic_color_to_int basic_color\
         \n  | `RGB (r,g,b) -> 16 + b + g * 6 + r * 36\
         \n  | `Gray i -> 232 + i\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val color_to_int :\
           \n  [< `Basic of\
           \n       [< `Black\
           \n        | `Blue\
           \n        | `Cyan\
           \n        | `Green\
           \n        | `Magenta\
           \n        | `Red\
           \n        | `White\
           \n        | `Yellow ] *\
           \n       [< `Bold | `Regular ]\
           \n   | `Gray of int\
           \n   | `RGB of int * int * int ] ->\
           \n  int = <fun>")))))))
    ((name 14)
     (chunks
      (((ocaml_code
          "let extended_color_to_int = function\
         \n  | `RGBA (r,g,b,a) -> 256 + a + b * 6 + g * 36 + r * 216\
         \n  | (`Basic _ | `RGB _ | `Gray _) as color -> color_to_int color\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val extended_color_to_int :\
           \n  [< `Basic of\
           \n       [< `Black\
           \n        | `Blue\
           \n        | `Cyan\
           \n        | `Green\
           \n        | `Magenta\
           \n        | `Red\
           \n        | `White\
           \n        | `Yellow ] *\
           \n       [< `Bold | `Regular ]\
           \n   | `Gray of int\
           \n   | `RGB of int * int * int\
           \n   | `RGBA of int * int * int * int ] ->\
           \n  int = <fun>")))))))
    ((name 15)
     (chunks
      (((ocaml_code
          "let extended_color_to_int = function\
         \n  | `RGBA (r,g,b,a) -> 256 + a + b * 6 + g * 36 + r * 216\
         \n  | color -> color_to_int color\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 121-126:\
           \nError: This expression has type [> `RGBA of int * int * int * int ]\
           \n       but an expression was expected of type\
           \n         [< `Basic of\
           \n              [< `Black\
           \n               | `Blue\
           \n               | `Cyan\
           \n               | `Green\
           \n               | `Magenta\
           \n               | `Red\
           \n               | `White\
           \n               | `Yellow ] *\
           \n              [< `Bold | `Regular ]\
           \n          | `Gray of int\
           \n          | `RGB of int * int * int ]\
           \n       The second variant type does not allow tag(s) `RGBA")))))))
    ((name 16)
     (chunks
      (((ocaml_code
          "let is_positive_permissive = function\
         \n  | `Int   x -> Ok (x > 0)\
         \n  | `Float x -> Ok (x > 0.)\
         \n  | _ -> Error \"Unknown number type\"\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val is_positive_permissive :\
           \n  [> `Float of float | `Int of int ] -> (bool, string) result = <fun>"))))
       ((ocaml_code "is_positive_permissive (`Int 0);;")
        (toplevel_responses ((OCaml "- : (bool, string) result = Ok false"))))
       ((ocaml_code "is_positive_permissive (`Ratio (3,4));;")
        (toplevel_responses
         ((OCaml "- : (bool, string) result = Error \"Unknown number type\"")))))))
    ((name 17)
     (chunks
      (((ocaml_code "is_positive_permissive (`Floot 3.5);;")
        (toplevel_responses
         ((OCaml "- : (bool, string) result = Error \"Unknown number type\"")))))))))
  (matched true)))
