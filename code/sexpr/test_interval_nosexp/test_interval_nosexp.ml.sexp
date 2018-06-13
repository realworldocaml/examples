(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet intervals =\
    \n  let module I = Int_interval in\
    \n  [ I.create 3 4;\
    \n    I.create 5 4; (* should be empty *)\
    \n    I.create 2 3;\
    \n    I.create 1 6;\
    \n  ]\
    \n\
    \nlet () =\
    \n  intervals\
    \n  |> List.sexp_of_t Int_interval.sexp_of_t\
    \n  |> Sexp.to_string_hum\
    \n  |> print_endline"))))
