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
       ((ocaml_code
          "type basic_color =\
         \n  | Black | Red | Green | Yellow | Blue | Magenta | Cyan | White;;")
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
       ((ocaml_code
          "let basic_color_to_int = function\
         \n  | Black -> 0 | Red     -> 1 | Green -> 2 | Yellow -> 3\
         \n  | Blue  -> 4 | Magenta -> 5 | Cyan  -> 6 | White  -> 7 ;;")
        (toplevel_responses
         ((OCaml "val basic_color_to_int : basic_color -> int = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "type color =\
         \n  | Basic of basic_color     (* basic colors *)\
         \n  | Bold  of basic_color     (* bold basic colors *)\
         \n  | RGB   of int * int * int (* 6x6x6 color cube *)\
         \n  | Gray  of int             (* 24 grayscale levels *)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type color =\
           \n    Basic of basic_color\
           \n  | Bold of basic_color\
           \n  | RGB of int * int * int\
           \n  | Gray of int")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let color_to_int = function\
         \n  | Basic (basic_color,weight) ->\
         \n    let base = match weight with Bold -> 8 | Regular -> 0 in\
         \n    base + basic_color_to_int basic_color\
         \n  | RGB (r,g,b) -> 16 + b + g * 6 + r * 36\
         \n  | Gray i -> 232 + i ;;")
        (toplevel_responses
         ((Raw
            "Characters 38-58:\
           \nError: This pattern matches values of type 'a * 'b\
           \n       but a pattern was expected which matches values of type basic_color")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let color_to_int = function\
         \n  | Basic basic_color -> basic_color_to_int basic_color\
         \n  | RGB (r,g,b) -> 16 + b + g * 6 + r * 36\
         \n  | Gray i -> 232 + i ;;")
        (toplevel_responses
         ((Raw
            "Characters 19-148:\
           \nWarning 8: this pattern-matching is not exhaustive.\
           \nHere is an example of a case that is not matched:\
           \nBold _")
          (OCaml "val color_to_int : color -> int = <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let color_to_int = function\
         \n  | Basic basic_color -> basic_color_to_int basic_color\
         \n  | Bold  basic_color -> 8 + basic_color_to_int basic_color\
         \n  | RGB (r,g,b) -> 16 + b + g * 6 + r * 36\
         \n  | Gray i -> 232 + i ;;")
        (toplevel_responses
         ((OCaml "val color_to_int : color -> int = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let oldschool_color_to_int = function\
         \n  | Basic (basic_color,weight) ->\
         \n    let base = match weight with Bold -> 8 | Regular -> 0 in\
         \n    base + basic_color_to_int basic_color\
         \n  | _ -> basic_color_to_int White;;")
        (toplevel_responses
         ((Raw
            "Characters 48-68:\
           \nError: This pattern matches values of type 'a * 'b\
           \n       but a pattern was expected which matches values of type basic_color")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "let oldschool_color_to_int = function\
         \n  | Basic basic_color -> basic_color_to_int basic_color\
         \n  | _ -> basic_color_to_int White;;")
        (toplevel_responses
         ((OCaml "val oldschool_color_to_int : color -> int = <fun>")))))))))
  (matched true)))
