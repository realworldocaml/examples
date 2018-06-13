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
      (((ocaml_code
          "printf \"%i is an integer, %F is a float, \\\"%s\\\" is a string\\n\"\
         \n  3 4.5 \"five\";;")
        (toplevel_responses
         ((Raw "3 is an integer, 4.5 is a float, \"five\" is a string")
          (OCaml "- : unit = ()")))))))
    ((name 2)
     (chunks
      (((ocaml_code "printf \"An integer: %i\\n\" 4.5;;")
        (toplevel_responses
         ((Raw
            "Characters 26-29:\
           \nError: This expression has type float but an expression was expected of type\
           \n         int")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let fmt = \"%i is an integer\\n\";;")
        (toplevel_responses
         ((OCaml "val fmt : string = \"%i is an integer\\n\""))))
       ((ocaml_code "printf fmt 3;;")
        (toplevel_responses
         ((Raw
            "Characters 7-10:\
           \nError: This expression has type string but an expression was expected of type\
           \n         ('a -> 'b, out_channel, unit) format =\
           \n           ('a -> 'b, out_channel, unit, unit, unit, unit) format6")))))))
    ((name 4)
     (chunks
      (((ocaml_code "open CamlinternalFormatBasics;;")
        (toplevel_responses ()))
       ((ocaml_code
          "let fmt : ('a, 'b, 'c) format =\
         \n  \"%i is an integer\\n\";;")
        (toplevel_responses
         ((OCaml
            "val fmt : (int -> 'c, 'b, 'c) Core_kernel.format =\
           \n  Format\
           \n   (Int (Int_i, No_padding, No_precision,\
           \n     String_literal (\" is an integer\\n\", End_of_format)),\
           \n   \"%i is an integer\\n\")")))))))
    ((name 5)
     (chunks
      (((ocaml_code "printf fmt 3;;")
        (toplevel_responses
         ((Raw "3 is an integer") (OCaml "- : unit = ()")))))))))
  (matched true)))
