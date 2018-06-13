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
          "let stack init = object\
         \n  val mutable v = init\
         \n\
         \n  method pop =\
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
         ((OCaml
           "val stack : 'a list -> < pop : 'a option; push : 'a -> unit > = <fun>"))))
       ((ocaml_code "type shape = < area : float > ;;")
        (toplevel_responses ((OCaml "type shape = < area : float >"))))
       ((ocaml_code "type square = < area : float; width : int > ;;")
        (toplevel_responses
         ((OCaml "type square = < area : float; width : int >"))))
       ((ocaml_code
          "let square w = object\
         \n  method area = Float.of_int (w * w)\
         \n  method width = w\
         \nend ;;")
        (toplevel_responses
         ((OCaml "val square : int -> < area : float; width : int > = <fun>"))))
       ((ocaml_code "type circle = < area : float; radius : int > ;;")
        (toplevel_responses
         ((OCaml "type circle = < area : float; radius : int >"))))
       ((ocaml_code
          "let circle r = object\
         \n  method area = 3.14 *. (Float.of_int r) ** 2.0\
         \n  method radius = r\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "val circle : int -> < area : float; radius : int > = <fun>"))))
       ((ocaml_code
         "type 'a stack = < pop: 'a option; push: 'a -> unit > ;;")
        (toplevel_responses
         ((OCaml "type 'a stack = < pop : 'a option; push : 'a -> unit >"))))
       ((ocaml_code
         "let square_stack: square stack = stack [square 30; square 10] ;;")
        (toplevel_responses
         ((OCaml "val square_stack : square stack = <obj>"))))
       ((ocaml_code
         "let circle_stack: circle stack = stack [circle 20; circle 40] ;;")
        (toplevel_responses
         ((OCaml "val circle_stack : circle stack = <obj>")))))))
    ((name 1)
     (chunks
      (((ocaml_code "let shape w : shape = square w ;;")
        (toplevel_responses
         ((Raw
            "Characters 22-30:\
           \nError: This expression has type < area : float; width : int >\
           \n       but an expression was expected of type shape\
           \n       The second object type has no method width"))))
       ((ocaml_code "let shape w : shape = (square w :> shape) ;;")
        (toplevel_responses ((OCaml "val shape : int -> shape = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let coin = object\
         \n  method shape = circle 5\
         \n  method color = \"silver\"\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "val coin : < color : string; shape : < area : float; radius : int > > = <obj>"))))
       ((ocaml_code
          "let map = object\
         \n  method shape = square 10\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "val map : < shape : < area : float; width : int > > = <obj>")))))))
    ((name 3)
     (chunks
      (((ocaml_code "type item = < shape : shape > ;;")
        (toplevel_responses ((OCaml "type item = < shape : shape >"))))
       ((ocaml_code "let items = [ (coin :> item) ; (map :> item) ] ;;")
        (toplevel_responses
         ((OCaml "val items : item list = [<obj>; <obj>]")))))))
    ((name 4)
     (chunks
      (((ocaml_code "type num = [ `Int of int | `Float of float ] ;;")
        (toplevel_responses
         ((OCaml "type num = [ `Float of float | `Int of int ]"))))
       ((ocaml_code "type const = [ num | `String of string ] ;;")
        (toplevel_responses
         ((OCaml
           "type const = [ `Float of float | `Int of int | `String of string ]"))))
       ((ocaml_code "let n : num = `Int 3 ;;")
        (toplevel_responses ((OCaml "val n : num = `Int 3"))))
       ((ocaml_code "let c : const = (n :> const) ;;")
        (toplevel_responses ((OCaml "val c : const = `Int 3")))))))
    ((name 5)
     (chunks
      (((ocaml_code "let squares: square list = [ square 10; square 20 ] ;;")
        (toplevel_responses
         ((OCaml "val squares : square list = [<obj>; <obj>]"))))
       ((ocaml_code "let shapes: shape list = (squares :> shape list) ;;")
        (toplevel_responses
         ((OCaml "val shapes : shape list = [<obj>; <obj>]")))))))
    ((name 6)
     (chunks
      (((ocaml_code
         "let square_array: square array = [| square 10; square 20 |] ;;")
        (toplevel_responses
         ((OCaml "val square_array : square array = [|<obj>; <obj>|]"))))
       ((ocaml_code
         "let shape_array: shape array = (square_array :> shape array) ;;")
        (toplevel_responses
         ((Raw
            "Characters 31-60:\
           \nError: Type square array is not a subtype of shape array \
           \n       Type square = < area : float; width : int >\
           \n       is not compatible with type shape = < area : float > \
           \n       The second object type has no method width")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "let shape_to_string: shape -> string = \
         \n  fun s -> sprintf \"Shape(%F)\" s#area ;;")
        (toplevel_responses
         ((OCaml "val shape_to_string : shape -> string = <fun>"))))
       ((ocaml_code
          "let square_to_string: square -> string = \
         \n  (shape_to_string :> square -> string) ;;")
        (toplevel_responses
         ((OCaml "val square_to_string : square -> string = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "module Either = struct\
         \n  type ('a, 'b) t = \
         \n    | Left of 'a\
         \n    | Right of 'b\
         \n  let left x = Left x\
         \n  let right x = Right x\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "module Either :\
           \n  sig\
           \n    type ('a, 'b) t = Left of 'a | Right of 'b\
           \n    val left : 'a -> ('a, 'b) t\
           \n    val right : 'a -> ('b, 'a) t\
           \n  end"))))
       ((ocaml_code
         "(Either.left (square 40) :> (shape, shape) Either.t) ;;")
        (toplevel_responses
         ((OCaml "- : (shape, shape) Either.t = Either.Left <obj>")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "module AbstractEither : sig \
         \n  type ('a, 'b) t\
         \n  val left: 'a -> ('a, 'b) t\
         \n  val right: 'b -> ('a, 'b) t\
         \nend = Either ;;")
        (toplevel_responses
         ((OCaml
            "module AbstractEither :\
           \n  sig\
           \n    type ('a, 'b) t\
           \n    val left : 'a -> ('a, 'b) t\
           \n    val right : 'b -> ('a, 'b) t\
           \n  end"))))
       ((ocaml_code
         "(AbstractEither.left (square 40) :> (shape, shape) AbstractEither.t) ;;")
        (toplevel_responses
         ((Raw
            "Characters 1-32:\
           \nError: This expression cannot be coerced to type\
           \n         (shape, shape) AbstractEither.t;\
           \n       it has type (< area : float; width : int >, 'a) AbstractEither.t\
           \n       but is here used with type (shape, shape) AbstractEither.t\
           \n       Type < area : float; width : int > is not compatible with type\
           \n         shape = < area : float > \
           \n       The second object type has no method width")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "module VarEither : sig \
         \n  type (+'a, +'b) t\
         \n  val left: 'a -> ('a, 'b) t\
         \n  val right: 'b -> ('a, 'b) t\
         \nend = Either ;;")
        (toplevel_responses
         ((OCaml
            "module VarEither :\
           \n  sig\
           \n    type (+'a, +'b) t\
           \n    val left : 'a -> ('a, 'b) t\
           \n    val right : 'b -> ('a, 'b) t\
           \n  end"))))
       ((ocaml_code
         "(VarEither.left (square 40) :> (shape, shape) VarEither.t) ;;")
        (toplevel_responses
         ((OCaml "- : (shape, shape) VarEither.t = <abstr>")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let total_area (shape_stacks: shape stack list) =\
         \n  let stack_area acc st = \
         \n    let rec loop acc =\
         \n      match st#pop with\
         \n      | Some s -> loop (acc +. s#area)\
         \n      | None -> acc\
         \n    in\
         \n    loop acc\
         \n  in\
         \n  List.fold ~init:0.0 ~f:stack_area shape_stacks ;;")
        (toplevel_responses
         ((OCaml "val total_area : shape stack list -> float = <fun>")))))))
    ((name 12)
     (chunks
      (((ocaml_code
         "total_area [(square_stack :> shape stack); (circle_stack :> shape stack)] ;;")
        (toplevel_responses
         ((Raw
            "Characters 12-41:\
           \nError: Type square stack = < pop : square option; push : square -> unit >\
           \n       is not a subtype of\
           \n         shape stack = < pop : shape option; push : shape -> unit > \
           \n       Type shape = < area : float > is not a subtype of\
           \n         square = < area : float; width : int > ")))))))
    ((name 13)
     (chunks
      (((ocaml_code "type 'a readonly_stack = < pop : 'a option > ;;")
        (toplevel_responses
         ((OCaml "type 'a readonly_stack = < pop : 'a option >"))))
       ((ocaml_code
          "let total_area (shape_stacks: shape readonly_stack list) =\
         \n  let stack_area acc st = \
         \n    let rec loop acc =\
         \n      match st#pop with\
         \n      | Some s -> loop (acc +. s#area)\
         \n      | None -> acc\
         \n    in\
         \n    loop acc\
         \n  in\
         \n  List.fold ~init:0.0 ~f:stack_area shape_stacks ;;")
        (toplevel_responses
         ((OCaml
           "val total_area : shape readonly_stack list -> float = <fun>"))))
       ((ocaml_code
          "total_area [(square_stack :> shape readonly_stack); (circle_stack :> \
         \n                                                       shape readonly_stack)] ;;")
        (toplevel_responses ((OCaml "- : float = 7280.")))))))))
  (matched true)))
