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
         "type 'a iterator = < get : 'a; has_value : bool; next : unit > ;;")
        (toplevel_responses
         ((OCaml
           "type 'a iterator = < get : 'a; has_value : bool; next : unit >")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "class ['a] list_iterator init = object\
         \n  val mutable current : 'a list = init\
         \n\
         \n  method has_value = current <> []\
         \n\
         \n  method get =\
         \n    match current with\
         \n    | hd :: tl -> hd\
         \n    | [] -> raise (Invalid_argument \"no value\")\
         \n\
         \n  method next =\
         \n    match current with\
         \n    | hd :: tl -> current <- tl\
         \n    | [] -> raise (Invalid_argument \"no value\")\
         \nend  ;;")
        (toplevel_responses
         ((OCaml
            "class ['a] list_iterator :\
           \n  'a list ->\
           \n  object\
           \n    val mutable current : 'a list\
           \n    method get : 'a\
           \n    method has_value : bool\
           \n    method next : unit\
           \n  end")))))))
    ((name 2)
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
         \n\
         \n  method iterator : 'a iterator =\
         \n    new list_iterator v\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class ['a] stack :\
           \n  'a list ->\
           \n  object\
           \n    val mutable v : 'a list\
           \n    method iterator : 'a iterator\
           \n    method pop : 'a option\
           \n    method push : 'a -> unit\
           \n  end")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let s = new stack [] ;;")
        (toplevel_responses ((OCaml "val s : '_a stack = <obj>"))))
       ((ocaml_code "s#push 5 ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "s#push 4 ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "let it = s#iterator ;;")
        (toplevel_responses ((OCaml "val it : int iterator = <obj>"))))
       ((ocaml_code "it#get ;;")
        (toplevel_responses ((OCaml "- : int = 4"))))
       ((ocaml_code "it#next ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "it#get ;;")
        (toplevel_responses ((OCaml "- : int = 5"))))
       ((ocaml_code "it#next ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "it#has_value ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 4)
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
         \n\
         \n  method iter f = \
         \n    List.iter ~f v \
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class ['a] stack :\
           \n  'a list ->\
           \n  object\
           \n    val mutable v : 'a list\
           \n    method iter : ('a -> unit) -> unit\
           \n    method pop : 'a option\
           \n    method push : 'a -> unit\
           \n  end")))))))
    ((name 5)
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
         \n\
         \n  method fold : 'b. ('b -> 'a -> 'b) -> 'b -> 'b =\
         \n    (fun f init -> List.fold ~f ~init v) \
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "class ['a] stack :\
           \n  'a list ->\
           \n  object\
           \n    val mutable v : 'a list\
           \n    method fold : ('b -> 'a -> 'b) -> 'b -> 'b\
           \n    method pop : 'a option\
           \n    method push : 'a -> unit\
           \n  end")))))))))
  (matched true)))
