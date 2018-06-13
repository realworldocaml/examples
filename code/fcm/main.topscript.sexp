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
    ((name 0.5)
     (chunks
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code "module type X_int = sig val x : int end;;")
        (toplevel_responses
         ((OCaml "module type X_int = sig val x : int end")))))))
    ((name 1)
     (chunks
      (((ocaml_code "module Three : X_int = struct let x = 3 end;;")
        (toplevel_responses ((OCaml "module Three : X_int"))))
       ((ocaml_code "Three.x;;")
        (toplevel_responses ((OCaml "- : int = 3")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let three = (module Three : X_int);;")
        (toplevel_responses
         ((OCaml "val three : (module X_int) = <module>")))))))
    ((name 3)
     (chunks
      (((ocaml_code "module Four = struct let x = 4 end;;")
        (toplevel_responses ((OCaml "module Four : sig val x : int end"))))
       ((ocaml_code "let numbers = [ three; (module Four) ];;")
        (toplevel_responses
         ((OCaml "val numbers : (module X_int) list = [<module>; <module>]")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let numbers = [three; (module struct let x = 4 end)];;")
        (toplevel_responses
         ((OCaml "val numbers : (module X_int) list = [<module>; <module>]")))))))
    ((name 5)
     (chunks
      (((ocaml_code "module New_three = (val three : X_int) ;;")
        (toplevel_responses ((OCaml "module New_three : X_int"))))
       ((ocaml_code "New_three.x;;")
        (toplevel_responses ((OCaml "- : int = 3")))))))
    ((name 6)
     (chunks
      (((ocaml_code "module type Y_int = X_int;;")
        (toplevel_responses ((OCaml "module type Y_int = X_int"))))
       ((ocaml_code "let five = (module struct let x = 5 end : Y_int);;")
        (toplevel_responses ((OCaml "val five : (module Y_int) = <module>"))))
       ((ocaml_code "[three; five];;")
        (toplevel_responses
         ((OCaml "- : (module X_int) list = [<module>; <module>]")))))))
    ((name 7)
     (chunks
      (((ocaml_code "[three; (module (val five))];;")
        (toplevel_responses
         ((OCaml "- : (module X_int) list = [<module>; <module>]")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let to_int m =\
         \n  let module M = (val m : X_int) in\
         \n  M.x\
         \n;;")
        (toplevel_responses
         ((OCaml "val to_int : (module X_int) -> int = <fun>"))))
       ((ocaml_code
          "let plus m1 m2 =\
         \n  (module struct\
         \n    let x = to_int m1 + to_int m2\
         \n  end : X_int)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val plus : (module X_int) -> (module X_int) -> (module X_int) = <fun>")))))))
    ((name 9)
     (chunks
      (((ocaml_code "let six = plus three three;;")
        (toplevel_responses ((OCaml "val six : (module X_int) = <module>"))))
       ((ocaml_code "to_int (List.fold ~init:six ~f:plus [three;three]);;")
        (toplevel_responses ((OCaml "- : int = 12")))))))
    ((name 10)
     (chunks
      (((ocaml_code "let to_int (module M : X_int) = M.x ;;")
        (toplevel_responses
         ((OCaml "val to_int : (module X_int) -> int = <fun>")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "module type Bumpable = sig\
         \n  type t\
         \n  val bump : t -> t\
         \nend;;")
        (toplevel_responses
         ((OCaml "module type Bumpable = sig type t val bump : t -> t end")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "module Int_bumper = struct\
         \n  type t = int\
         \n  let bump n = n + 1\
         \nend;;")
        (toplevel_responses
         ((OCaml
           "module Int_bumper : sig type t = int val bump : t -> t end"))))
       ((ocaml_code
          "module Float_bumper = struct\
         \n  type t = float\
         \n  let bump n = n +. 1.\
         \nend;;")
        (toplevel_responses
         ((OCaml
           "module Float_bumper : sig type t = float val bump : t -> t end")))))))
    ((name 13)
     (chunks
      (((ocaml_code "let int_bumper = (module Int_bumper : Bumpable);;")
        (toplevel_responses
         ((OCaml "val int_bumper : (module Bumpable) = <module>")))))))
    ((name 14)
     (chunks
      (((ocaml_code
         "let (module Bumpable) = int_bumper in Bumpable.bump 3;;")
        (toplevel_responses
         ((Raw
            "Characters 52-53:\
           \nError: This expression has type int but an expression was expected of type\
           \n         Bumpable.t")))))))
    ((name 15)
     (chunks
      (((ocaml_code
         "let int_bumper = (module Int_bumper : Bumpable with type t = int);;")
        (toplevel_responses
         ((OCaml
           "val int_bumper : (module Bumpable with type t = int) = <module>"))))
       ((ocaml_code
         "let float_bumper = (module Float_bumper : Bumpable with type t = float);;")
        (toplevel_responses
         ((OCaml
           "val float_bumper : (module Bumpable with type t = float) = <module>")))))))
    ((name 16)
     (chunks
      (((ocaml_code
         "let (module Bumpable) = int_bumper in Bumpable.bump 3;;")
        (toplevel_responses ((OCaml "- : int = 4"))))
       ((ocaml_code
         "let (module Bumpable) = float_bumper in Bumpable.bump 3.5;;")
        (toplevel_responses ((OCaml "- : float = 4.5")))))))
    ((name 17)
     (chunks
      (((ocaml_code
          "let bump_list\
         \n      (type a)\
         \n      (module B : Bumpable with type t = a)\
         \n      (l: a list)\
         \n  =\
         \n  List.map ~f:B.bump l\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val bump_list : (module Bumpable with type t = 'a) -> 'a list -> 'a list =\
           \n  <fun>")))))))
    ((name 18)
     (chunks
      (((ocaml_code "bump_list int_bumper [1;2;3];;")
        (toplevel_responses ((OCaml "- : int list = [2; 3; 4]"))))
       ((ocaml_code "bump_list float_bumper [1.5;2.5;3.5];;")
        (toplevel_responses ((OCaml "- : float list = [2.5; 3.5; 4.5]")))))))
    ((name 19)
     (chunks
      (((ocaml_code "let wrap_in_list (type a) (x:a) = [x];;")
        (toplevel_responses
         ((OCaml "val wrap_in_list : 'a -> 'a list = <fun>")))))))
    ((name 20)
     (chunks
      (((ocaml_code "let double_int (type a) (x:a) = x + x;;")
        (toplevel_responses
         ((Raw
            "Characters 32-33:\
           \nError: This expression has type a but an expression was expected of type int")))))))
    ((name 21)
     (chunks
      (((ocaml_code
          "module type Comparable = sig\
         \n  type t\
         \n  val compare : t -> t -> int\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "module type Comparable = sig type t val compare : t -> t -> int end"))))
       ((ocaml_code
          "let create_comparable (type a) compare =\
         \n  (module struct\
         \n    type t = a\
         \n    let compare = compare\
         \n  end : Comparable with type t = a)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create_comparable :\
           \n  ('a -> 'a -> int) -> (module Comparable with type t = 'a) = <fun>"))))
       ((ocaml_code "create_comparable Int.compare;;")
        (toplevel_responses
         ((OCaml "- : (module Comparable with type t = int) = <module>"))))
       ((ocaml_code "create_comparable Float.compare;;")
        (toplevel_responses
         ((OCaml "- : (module Comparable with type t = float) = <module>")))))))))
  (matched true)))
