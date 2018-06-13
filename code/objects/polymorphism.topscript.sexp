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
    ((name 1)
     (chunks
      (((ocaml_code "let area sq = sq#width * sq#width ;;")
        (toplevel_responses
         ((OCaml "val area : < width : int; .. > -> int = <fun>"))))
       ((ocaml_code "let minimize sq : unit = sq#resize 1 ;;")
        (toplevel_responses
         ((OCaml
           "val minimize : < resize : int -> unit; .. > -> unit = <fun>"))))
       ((ocaml_code
          "let limit sq = \
         \n  if (area sq) > 100 then minimize sq ;;")
        (toplevel_responses
         ((OCaml
           "val limit : < resize : int -> unit; width : int; .. > -> unit = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let toggle sq b : unit = \
         \n  if b then sq#resize `Fullscreen\
         \n  else minimize sq ;;")
        (toplevel_responses
         ((Raw
            "Characters 76-78:\
           \nError: This expression has type < resize : [> `Fullscreen ] -> unit; .. >\
           \n       but an expression was expected of type < resize : int -> unit; .. >\
           \n       Types for method resize are incompatible")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "let area_closed (sq: < width : int >) = sq#width * sq#width ;;")
        (toplevel_responses
         ((OCaml "val area_closed : < width : int > -> int = <fun>"))))
       ((ocaml_code
          "let sq = object\
         \n  method width = 30 \
         \n  method name = \"sq\" \
         \nend ;;")
        (toplevel_responses
         ((OCaml "val sq : < name : string; width : int > = <obj>"))))
       ((ocaml_code "area_closed sq ;;")
        (toplevel_responses
         ((Raw
            "Characters 12-14:\
           \nError: This expression has type < name : string; width : int >\
           \n       but an expression was expected of type < width : int >\
           \n       The second object type has no method name")))))))
    ((name 4)
     (chunks
      (((ocaml_code "type square = < width : int; ..> ;;")
        (toplevel_responses
         ((Raw
            "Characters 0-32:\
           \nError: A type variable is unbound in this type declaration.\
           \nIn type < width : int; .. > as 'a the variable 'a is unbound")))))))))
  (matched true)))
