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
       ((ocaml_code "#require \"mtime.os.top\";;")
        (toplevel_responses ((Raw "No such package: mtime.os.top"))))
       ((ocaml_code
          "let time f =\
         \n  let counter = Mtime.counter () in\
         \n  let x = f () in\
         \n  let elapsed = Mtime.count counter in\
         \n  printf \"Time: %F ms\\n\" (Mtime.to_ms elapsed);\
         \n  x \
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 29-42:\
           \nError: Unbound module Mtime\
           \nHint: Did you mean Time?"))))
       ((ocaml_code
          "let memoize f =\
         \n  let memo_table = Hashtbl.Poly.create () in\
         \n  (fun x ->\
         \n     Hashtbl.find_or_add memo_table x ~default:(fun () -> f x))\
         \n;;")
        (toplevel_responses
         ((OCaml "val memoize : ('a -> 'b) -> 'a -> 'b = <fun>"))))
       ((ocaml_code "let identity x = x;;")
        (toplevel_responses ((OCaml "val identity : 'a -> 'a = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code "(fun x -> [x;x]);;")
        (toplevel_responses ((OCaml "- : 'a -> 'a list = <fun>")))))))
    ((name 2)
     (chunks
      (((ocaml_code "memoize (fun x -> [x;x]);;")
        (toplevel_responses ((OCaml "- : '_a -> '_a list = <fun>")))))))
    ((name 3)
     (chunks
      (((ocaml_code "identity (fun x -> [x;x]);;")
        (toplevel_responses ((OCaml "- : '_a -> '_a list = <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let f () = ref None;;")
        (toplevel_responses
         ((OCaml "val f : unit -> 'a option ref = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code "List.init;;")
        (toplevel_responses
         ((OCaml "- : int -> f:(int -> 'a) -> 'a list = <fun>"))))
       ((ocaml_code "List.init 10 ~f:Int.to_string;;")
        (toplevel_responses
         ((OCaml
           "- : string list = [\"0\"; \"1\"; \"2\"; \"3\"; \"4\"; \"5\"; \"6\"; \"7\"; \"8\"; \"9\"]")))))))
    ((name 6)
     (chunks
      (((ocaml_code "let list_init_10 = List.init 10;;")
        (toplevel_responses
         ((OCaml "val list_init_10 : f:(int -> '_a) -> '_a list = <fun>")))))))
    ((name 7)
     (chunks
      (((ocaml_code "let list_init_10 ~f = List.init 10 ~f;;")
        (toplevel_responses
         ((OCaml "val list_init_10 : f:(int -> 'a) -> 'a list = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code "identity (fun x -> [x;x]);;")
        (toplevel_responses ((OCaml "- : '_a -> '_a list = <fun>")))))))
    ((name 9)
     (chunks
      (((ocaml_code "identity [];;")
        (toplevel_responses ((OCaml "- : 'a list = []")))))))
    ((name 10)
     (chunks
      (((ocaml_code "[||];;")
        (toplevel_responses ((OCaml "- : 'a array = [||]"))))
       ((ocaml_code "identity [||];;")
        (toplevel_responses ((OCaml "- : '_a array = [||]")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "module Concat_list : sig\
         \n  type 'a t\
         \n  val empty : 'a t\
         \n  val singleton : 'a -> 'a t\
         \n  val concat  : 'a t -> 'a t -> 'a t  (* constant time *)\
         \n  val to_list : 'a t -> 'a list       (* linear time   *)\
         \nend = struct\
         \n\
         \n  type 'a t = Empty | Singleton of 'a | Concat of 'a t * 'a t\
         \n\
         \n  let empty = Empty\
         \n  let singleton x = Singleton x\
         \n  let concat x y = Concat (x,y)\
         \n\
         \n  let rec to_list_with_tail t tail =\
         \n    match t with\
         \n    | Empty -> tail\
         \n    | Singleton x -> x :: tail\
         \n    | Concat (x,y) -> to_list_with_tail x (to_list_with_tail y tail)\
         \n\
         \n  let to_list t =\
         \n    to_list_with_tail t []\
         \n\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Concat_list :\
           \n  sig\
           \n    type 'a t\
           \n    val empty : 'a t\
           \n    val singleton : 'a -> 'a t\
           \n    val concat : 'a t -> 'a t -> 'a t\
           \n    val to_list : 'a t -> 'a list\
           \n  end")))))))
    ((name 12)
     (chunks
      (((ocaml_code "Concat_list.empty;;")
        (toplevel_responses ((OCaml "- : 'a Concat_list.t = <abstr>"))))
       ((ocaml_code "identity Concat_list.empty;;")
        (toplevel_responses ((OCaml "- : '_a Concat_list.t = <abstr>")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "module Concat_list : sig\
         \n  type +'a t\
         \n  val empty : 'a t\
         \n  val singleton : 'a -> 'a t\
         \n  val concat  : 'a t -> 'a t -> 'a t  (* constant time *)\
         \n  val to_list : 'a t -> 'a list       (* linear time   *)\
         \nend = struct\
         \n\
         \n  type 'a t = Empty | Singleton of 'a | Concat of 'a t * 'a t\
         \n\
         \n  let empty = Empty\
         \n  let singleton x = Singleton x\
         \n  let concat x y = Concat (x,y)\
         \n\
         \n  let rec to_list_with_tail t tail =\
         \n    match t with\
         \n    | Empty -> tail\
         \n    | Singleton x -> x :: tail\
         \n    | Concat (x,y) -> to_list_with_tail x (to_list_with_tail y tail)\
         \n\
         \n  let to_list t =\
         \n    to_list_with_tail t []\
         \n\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Concat_list :\
           \n  sig\
           \n    type +'a t\
           \n    val empty : 'a t\
           \n    val singleton : 'a -> 'a t\
           \n    val concat : 'a t -> 'a t -> 'a t\
           \n    val to_list : 'a t -> 'a list\
           \n  end")))))))
    ((name 14)
     (chunks
      (((ocaml_code "identity Concat_list.empty;;")
        (toplevel_responses ((OCaml "- : 'a Concat_list.t = <abstr>")))))))))
  (matched true)))
