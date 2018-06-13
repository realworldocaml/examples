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
    ((name 1)
     (chunks
      (((ocaml_code
          "let imm_stack init = object\
         \n  val v = init\
         \n\
         \n  method pop =\
         \n    match v with\
         \n    | hd :: tl -> Some (hd, {< v = tl >})\
         \n    | [] -> None \
         \n\
         \n  method push hd = \
         \n    {< v = hd :: v >}\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "val imm_stack :\
           \n  'a list -> (< pop : ('a * 'b) option; push : 'a -> 'b > as 'b) = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let s = imm_stack [3; 2; 1] ;;")
        (toplevel_responses
         ((OCaml
           "val s : < pop : (int * 'a) option; push : int -> 'a > as 'a = <obj>"))))
       ((ocaml_code "let t = s#push 4 ;;")
        (toplevel_responses
         ((OCaml
           "val t : < pop : (int * 'a) option; push : int -> 'a > as 'a = <obj>"))))
       ((ocaml_code "s#pop ;;")
        (toplevel_responses
         ((OCaml
            "- : (int * (< pop : 'a; push : int -> 'b > as 'b)) option as 'a =\
           \nSome (3, <obj>)"))))
       ((ocaml_code "t#pop ;;")
        (toplevel_responses
         ((OCaml
            "- : (int * (< pop : 'a; push : int -> 'b > as 'b)) option as 'a =\
           \nSome (4, <obj>)")))))))))
  (matched true)))
