(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nmodule type S = sig\
    \n  type 'a t\
    \n  val fold : 'a t -> init:'acc -> f:('acc -> 'a -> 'acc) -> 'acc\
    \nend\
    \n\
    \nmodule type Extension = sig\
    \n  type 'a t\
    \n  val iter    : 'a t -> f:('a -> unit) -> unit\
    \n  val length  : 'a t -> int\
    \n  val count   : 'a t -> f:('a -> bool) -> int\
    \n  val for_all : 'a t -> f:('a -> bool) -> bool\
    \n  val exists  : 'a t -> f:('a -> bool) -> bool\
    \nend\
    \n\
    \n(* For extending a Foldable module *)\
    \nmodule Extend(Arg : S)\
    \n  : (Extension with type 'a t := 'a Arg.t) =\
    \nstruct\
    \n  open Arg\
    \n\
    \n  let iter t ~f =\
    \n    fold t ~init:() ~f:(fun () a -> f a)\
    \n\
    \n  let length t =\
    \n    fold t ~init:0  ~f:(fun acc _ -> acc + 1)\
    \n\
    \n  let count t ~f =\
    \n    fold t ~init:0  ~f:(fun count x -> count + if f x then 1 else 0)\
    \n\
    \n  exception Short_circuit\
    \n\
    \n  let for_all c ~f =\
    \n    try iter c ~f:(fun x -> if not (f x) then raise Short_circuit); true\
    \n    with Short_circuit -> false\
    \n\
    \n  let exists c ~f =\
    \n    try iter c ~f:(fun x -> if f x then raise Short_circuit); false\
    \n    with Short_circuit -> true\
    \nend"))))
