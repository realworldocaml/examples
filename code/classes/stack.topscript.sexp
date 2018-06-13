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
    ((name 0.5)
     (chunks
      (((ocaml_code
          "class ['a] stack init = object\
         \n  val mutable v : 'a list = init\
         \n\
         \n  method pop =\
         \n    match v with\
         \n    | hd :: tl ->\
         \n      v <- tl;\
         \n      Some hd\
         \n    | [] -> None\
         \n\
         \n  method push hd =\
         \n    v <- hd :: v\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class ['a] stack :\
           \n  'a list ->\
           \n  object\
           \n    val mutable v : 'a list\
           \n    method pop : 'a option\
           \n    method push : 'a -> unit\
           \n  end")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "class ['a] stack init = object\
         \n  val mutable v = init\
         \n\
         \n  method pop = \
         \n    match v with\
         \n    | hd :: tl -> \
         \n      v <- tl;\
         \n      Some hd\
         \n    | [] -> None\
         \n\
         \n  method push hd = \
         \n    v <- hd :: v\
         \nend ;;")
        (toplevel_responses
         ((Raw
            "Characters 0-194:\
           \nError: Some type variables are unbound in this type:\
           \n         class ['a] stack :\
           \n           'b list ->\
           \n           object\
           \n             val mutable v : 'b list\
           \n             method pop : 'b option\
           \n             method push : 'b -> unit\
           \n           end\
           \n       The method pop has type 'b option where 'b is unbound")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "class sstack init = object\
         \n  inherit [string] stack init\
         \n\
         \n  method print =\
         \n    List.iter ~f:print_string v\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class sstack :\
           \n  string list ->\
           \n  object\
           \n    val mutable v : string list\
           \n    method pop : string option\
           \n    method print : unit\
           \n    method push : string -> unit\
           \n  end")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "class double_stack init = object\
         \n  inherit [int] stack init as super\
         \n\
         \n  method push hd =\
         \n    super#push (hd * 2)\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class double_stack :\
           \n  int list ->\
           \n  object\
           \n    val mutable v : int list\
           \n    method pop : int option\
           \n    method push : int -> unit\
           \n  end")))))))))
  (matched true)))
