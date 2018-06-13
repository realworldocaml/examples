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
       ((ocaml_code "let x = 3;;")
        (toplevel_responses ((OCaml "val x : int = 3"))))
       ((ocaml_code "let y = 4;;")
        (toplevel_responses ((OCaml "val y : int = 4"))))
       ((ocaml_code "let z = x + y;;")
        (toplevel_responses ((OCaml "val z : int = 7")))))))
    ((name 1)
     (chunks
      (((ocaml_code "let languages = \"OCaml,Perl,C++,C\";;")
        (toplevel_responses
         ((OCaml "val languages : string = \"OCaml,Perl,C++,C\""))))
       ((ocaml_code
          "let dashed_languages =\
         \n  let language_list = String.split languages ~on:',' in\
         \n  String.concat ~sep:\"-\" language_list\
         \n;;")
        (toplevel_responses
         ((OCaml "val dashed_languages : string = \"OCaml-Perl-C++-C\"")))))))
    ((name 2)
     (chunks
      (((ocaml_code "language_list;;")
        (toplevel_responses
         ((Raw  "Characters 0-13:\
               \nError: Unbound value language_list")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let languages = \"OCaml,Perl,C++,C\";;")
        (toplevel_responses
         ((OCaml "val languages : string = \"OCaml,Perl,C++,C\""))))
       ((ocaml_code
          "let dashed_languages =\
         \n  let languages = String.split languages ~on:',' in\
         \n  String.concat ~sep:\"-\" languages\
         \n;;")
        (toplevel_responses
         ((OCaml "val dashed_languages : string = \"OCaml-Perl-C++-C\"")))))))
    ((name 4)
     (chunks
      (((ocaml_code "languages;;")
        (toplevel_responses ((OCaml "- : string = \"OCaml,Perl,C++,C\"")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let area_of_ring inner_radius outer_radius =\
         \n  let pi = Float.pi in\
         \n  let area_of_circle r = pi *. r *. r in\
         \n  area_of_circle outer_radius -. area_of_circle inner_radius\
         \n;;")
        (toplevel_responses
         ((OCaml "val area_of_ring : float -> float -> float = <fun>"))))
       ((ocaml_code "area_of_ring 1. 3.;;")
        (toplevel_responses ((OCaml "- : float = 25.1327412287")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "let area_of_ring inner_radius outer_radius =\
         \n  let pi = Float.pi in\
         \n  let area_of_circle r = pi *. r *. r in\
         \n  let pi = 0. in\
         \n  area_of_circle outer_radius -. area_of_circle inner_radius\
         \n;;")
        (toplevel_responses
         ((Raw  "Characters 115-117:\
               \nWarning 26: unused variable pi.")
          (OCaml "val area_of_ring : float -> float -> float = <fun>")))))))
    ((name 7)
     (chunks
      (((ocaml_code
         "let (ints,strings) = List.unzip [(1,\"one\"); (2,\"two\"); (3,\"three\")];;")
        (toplevel_responses
         ((OCaml
            "val ints : int list = [1; 2; 3]\
           \nval strings : string list = [\"one\"; \"two\"; \"three\"]")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let upcase_first_entry line =\
         \n  let (first :: rest) = String.split ~on:',' line in\
         \n  String.concat ~sep:\",\" (String.uppercase first :: rest)\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 36-51:\
           \nWarning 8: this pattern-matching is not exhaustive.\
           \nHere is an example of a case that is not matched:\
           \n[]")
          (OCaml "val upcase_first_entry : string -> string = <fun>")))))))
    ((name 8.1)
     (chunks
      (((ocaml_code "upcase_first_entry \"one,two,three\";;")
        (toplevel_responses ((OCaml "- : string = \"ONE,two,three\""))))
       ((ocaml_code "upcase_first_entry \"\";;")
        (toplevel_responses ((OCaml "- : string = \"\"")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let upcase_first_entry line =\
         \n  match String.split ~on:',' line with\
         \n  | [] -> assert false (* String.split returns at least one element *)\
         \n  | first :: rest -> String.concat ~sep:\",\" (String.uppercase first :: rest)\
         \n;;")
        (toplevel_responses
         ((OCaml "val upcase_first_entry : string -> string = <fun>")))))))
    ((name 10)
     (chunks
      (((ocaml_code "(fun x -> x + 1);;")
        (toplevel_responses ((OCaml "- : int -> int = <fun>")))))))
    ((name 11)
     (chunks
      (((ocaml_code "(fun x -> x + 1) 7;;")
        (toplevel_responses ((OCaml "- : int = 8")))))))
    ((name 12)
     (chunks
      (((ocaml_code "List.map ~f:(fun x -> x + 1) [1;2;3];;")
        (toplevel_responses ((OCaml "- : int list = [2; 3; 4]")))))))
    ((name 13)
     (chunks
      (((ocaml_code
         "let transforms = [ String.uppercase; String.lowercase ];;")
        (toplevel_responses
         ((OCaml "val transforms : (string -> string) list = [<fun>; <fun>]"))))
       ((ocaml_code "List.map ~f:(fun g -> g \"Hello World\") transforms;;")
        (toplevel_responses
         ((OCaml "- : string list = [\"HELLO WORLD\"; \"hello world\"]")))))))
    ((name 14)
     (chunks
      (((ocaml_code "let plusone = (fun x -> x + 1);;")
        (toplevel_responses ((OCaml "val plusone : int -> int = <fun>"))))
       ((ocaml_code "plusone 3;;")
        (toplevel_responses ((OCaml "- : int = 4")))))))
    ((name 15)
     (chunks
      (((ocaml_code "let plusone x = x + 1;;")
        (toplevel_responses ((OCaml "val plusone : int -> int = <fun>")))))))
    ((name 16)
     (chunks
      (((ocaml_code "(fun x -> x + 1) 7;;")
        (toplevel_responses ((OCaml "- : int = 8"))))
       ((ocaml_code "let x = 7 in x + 1;;")
        (toplevel_responses ((OCaml "- : int = 8")))))))
    ((name 17)
     (chunks
      (((ocaml_code "let abs_diff x y = abs (x - y);;")
        (toplevel_responses
         ((OCaml "val abs_diff : int -> int -> int = <fun>"))))
       ((ocaml_code "abs_diff 3 4;;")
        (toplevel_responses ((OCaml "- : int = 1")))))))
    ((name 18)
     (chunks
      (((ocaml_code
          "let abs_diff =\
         \n  (fun x -> (fun y -> abs (x - y)));;")
        (toplevel_responses
         ((OCaml "val abs_diff : int -> int -> int = <fun>")))))))
    ((name 19)
     (chunks
      (((ocaml_code "let dist_from_3 = abs_diff 3;;")
        (toplevel_responses ((OCaml "val dist_from_3 : int -> int = <fun>"))))
       ((ocaml_code "dist_from_3 8;;")
        (toplevel_responses ((OCaml "- : int = 5"))))
       ((ocaml_code "dist_from_3 (-1);;")
        (toplevel_responses ((OCaml "- : int = 4")))))))
    ((name 20)
     (chunks
      (((ocaml_code "let abs_diff = (fun x y -> abs (x - y));;")
        (toplevel_responses
         ((OCaml "val abs_diff : int -> int -> int = <fun>")))))))
    ((name 21)
     (chunks
      (((ocaml_code "let abs_diff (x,y) = abs (x - y);;")
        (toplevel_responses
         ((OCaml "val abs_diff : int * int -> int = <fun>"))))
       ((ocaml_code "abs_diff (3,4);;")
        (toplevel_responses ((OCaml "- : int = 1")))))))
    ((name 22)
     (chunks
      (((ocaml_code
          "let rec find_first_repeat list =\
         \n  match list with\
         \n  | [] | [_] ->\
         \n    (* only zero or one elements, so no repeats *)\
         \n    None\
         \n  | x :: y :: tl ->\
         \n    if x = y then Some x else find_first_repeat (y::tl)\
         \n;;")
        (toplevel_responses
         ((OCaml "val find_first_repeat : 'a list -> 'a option = <fun>")))))))
    ((name 23)
     (chunks
      (((ocaml_code
          "let rec is_even x =\
         \n  if x = 0 then true else is_odd (x - 1)\
         \nand is_odd x =\
         \n  if x = 0 then false else is_even (x - 1)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val is_even : int -> bool = <fun>\
           \nval is_odd : int -> bool = <fun>"))))
       ((ocaml_code "List.map ~f:is_even [0;1;2;3;4;5];;")
        (toplevel_responses
         ((OCaml "- : bool list = [true; false; true; false; true; false]"))))
       ((ocaml_code "List.map ~f:is_odd [0;1;2;3;4;5];;")
        (toplevel_responses
         ((OCaml "- : bool list = [false; true; false; true; false; true]")))))))
    ((name 24)
     (chunks
      (((ocaml_code "Int.max 3 4  (* prefix *);;")
        (toplevel_responses ((OCaml "- : int = 4"))))
       ((ocaml_code "3 + 4        (* infix  *);;")
        (toplevel_responses ((OCaml "- : int = 7")))))))
    ((name 25)
     (chunks
      (((ocaml_code "(+) 3 4;;")
        (toplevel_responses ((OCaml "- : int = 7"))))
       ((ocaml_code "List.map ~f:((+) 3) [4;5;6];;")
        (toplevel_responses ((OCaml "- : int list = [7; 8; 9]")))))))
    ((name 26)
     (chunks
      (((ocaml_code "let (+!) (x1,y1) (x2,y2) = (x1 + x2, y1 + y2);;")
        (toplevel_responses
         ((OCaml "val ( +! ) : int * int -> int * int -> int * int = <fun>"))))
       ((ocaml_code "(3,2) +! (-2,4);;")
        (toplevel_responses ((OCaml "- : int * int = (1, 6)")))))))
    ((name 27)
     (chunks
      (((ocaml_code "let (***) x y = (x ** y) ** y;;")
        (toplevel_responses
         ((Raw
            "Characters 17-18:\
           \nError: This expression has type int but an expression was expected of type\
           \n         float")))))))
    ((name 28)
     (chunks
      (((ocaml_code "let ( *** ) x y = (x ** y) ** y;;")
        (toplevel_responses
         ((OCaml "val ( *** ) : float -> float -> float = <fun>")))))))
    ((name 29)
     (chunks
      (((ocaml_code "Int.max 3 (-4);;")
        (toplevel_responses ((OCaml "- : int = 3"))))
       ((ocaml_code "Int.max 3 -4;;")
        (toplevel_responses
         ((Raw
            "Characters 0-9:\
           \nError: This expression has type int -> int\
           \n       but an expression was expected of type int")))))))
    ((name 30)
     (chunks
      (((ocaml_code "(Int.max 3) - 4;;")
        (toplevel_responses
         ((Raw
            "Characters 0-11:\
           \nError: This expression has type int -> int\
           \n       but an expression was expected of type int")))))))
    ((name 31)
     (chunks
      (((ocaml_code "let (|>) x f = f x ;;")
        (toplevel_responses
         ((OCaml "val ( |> ) : 'a -> ('a -> 'b) -> 'b = <fun>")))))))
    ((name 32)
     (chunks
      (((ocaml_code
         "let path = \"/usr/bin:/usr/local/bin:/bin:/sbin:/usr/bin\";;")
        (toplevel_responses
         ((OCaml
           "val path : string = \"/usr/bin:/usr/local/bin:/bin:/sbin:/usr/bin\""))))
       ((ocaml_code
          "String.split ~on:':' path\
         \n|> List.dedup ~compare:String.compare\
         \n|> List.iter ~f:print_endline\
         \n;;")
        (toplevel_responses
         ((Raw  "/bin\
               \n/sbin\
               \n/usr/bin\
               \n/usr/local/bin")
          (OCaml "- : unit = ()")))))))
    ((name 33)
     (chunks
      (((ocaml_code
          "let split_path = String.split ~on:':' path in\
         \nlet deduped_path = List.dedup ~compare:String.compare split_path in\
         \nList.iter ~f:print_endline deduped_path\
         \n;;")
        (toplevel_responses
         ((Raw  "/bin\
               \n/sbin\
               \n/usr/bin\
               \n/usr/local/bin")
          (OCaml "- : unit = ()")))))))
    ((name 34)
     (chunks
      (((ocaml_code "List.iter ~f:print_endline [\"Two\"; \"lines\"];;")
        (toplevel_responses ((Raw  "Two\
                                  \nlines") (OCaml "- : unit = ()")))))))
    ((name 35)
     (chunks
      (((ocaml_code "List.iter ~f:print_endline;;")
        (toplevel_responses ((OCaml "- : string list -> unit = <fun>")))))))
    ((name 36)
     (chunks
      (((ocaml_code "let (^>) x f = f x;;")
        (toplevel_responses
         ((OCaml "val ( ^> ) : 'a -> ('a -> 'b) -> 'b = <fun>"))))
       ((ocaml_code
          "Sys.getenv \"PATH\"\
         \n^> String.split ~on:':' path\
         \n^> List.dedup ~compare:String.compare\
         \n^> List.iter ~f:print_endline\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 88-114:\
           \nError: This expression has type string list -> unit\
           \n       but an expression was expected of type\
           \n         (string list -> string list) -> 'a\
           \n       Type string list is not compatible with type\
           \n         string list -> string list ")))))))
    ((name 37)
     (chunks
      (((ocaml_code
          "let some_or_zero = function\
         \n  | Some x -> x\
         \n  | None -> 0\
         \n;;")
        (toplevel_responses
         ((OCaml "val some_or_zero : int option -> int = <fun>"))))
       ((ocaml_code "List.map ~f:some_or_zero [Some 3; None; Some 4];;")
        (toplevel_responses ((OCaml "- : int list = [3; 0; 4]")))))))
    ((name 38)
     (chunks
      (((ocaml_code
          "let some_or_zero num_opt =\
         \n  match num_opt with\
         \n  | Some x -> x\
         \n  | None -> 0\
         \n;;")
        (toplevel_responses
         ((OCaml "val some_or_zero : int option -> int = <fun>")))))))
    ((name 39)
     (chunks
      (((ocaml_code
          "let some_or_default default = function\
         \n  | Some x -> x\
         \n  | None -> default\
         \n;;")
        (toplevel_responses
         ((OCaml "val some_or_default : 'a -> 'a option -> 'a = <fun>"))))
       ((ocaml_code "some_or_default 3 (Some 5);;")
        (toplevel_responses ((OCaml "- : int = 5"))))
       ((ocaml_code
         "List.map ~f:(some_or_default 100) [Some 3; None; Some 4];;")
        (toplevel_responses ((OCaml "- : int list = [3; 100; 4]")))))))
    ((name 40)
     (chunks
      (((ocaml_code "let ratio ~num ~denom = float num /. float denom;;")
        (toplevel_responses
         ((OCaml "val ratio : num:int -> denom:int -> float = <fun>")))))))
    ((name 41)
     (chunks
      (((ocaml_code "ratio ~num:3 ~denom:10;;")
        (toplevel_responses ((OCaml "- : float = 0.3"))))
       ((ocaml_code "ratio ~denom:10 ~num:3;;")
        (toplevel_responses ((OCaml "- : float = 0.3")))))))
    ((name 42)
     (chunks
      (((ocaml_code
          "let num = 3 in\
         \nlet denom = 4 in\
         \nratio ~num ~denom;;")
        (toplevel_responses ((OCaml "- : float = 0.75")))))))
    ((name 43)
     (chunks
      (((ocaml_code
          "String.split ~on:':' path\
         \n|> List.dedup ~compare:String.compare\
         \n|> List.iter ~f:print_endline\
         \n;;")
        (toplevel_responses
         ((Raw  "/bin\
               \n/sbin\
               \n/usr/bin\
               \n/usr/local/bin")
          (OCaml "- : unit = ()")))))))
    ((name 44)
     (chunks
      (((ocaml_code
         "let apply_to_tuple f (first,second) = f ~first ~second;;")
        (toplevel_responses
         ((OCaml
           "val apply_to_tuple : (first:'a -> second:'b -> 'c) -> 'a * 'b -> 'c = <fun>")))))))
    ((name 45)
     (chunks
      (((ocaml_code
         "let apply_to_tuple_2 f (first,second) = f ~second ~first;;")
        (toplevel_responses
         ((OCaml
           "val apply_to_tuple_2 : (second:'a -> first:'b -> 'c) -> 'b * 'a -> 'c = <fun>")))))))
    ((name 46)
     (chunks
      (((ocaml_code "let divide ~first ~second = first / second;;")
        (toplevel_responses
         ((OCaml "val divide : first:int -> second:int -> int = <fun>")))))))
    ((name 47)
     (chunks
      (((ocaml_code "apply_to_tuple_2 divide (3,4);;")
        (toplevel_responses
         ((Raw
            "Characters 17-23:\
           \nError: This expression has type first:int -> second:int -> int\
           \n       but an expression was expected of type second:'a -> first:'b -> 'c")))))))
    ((name 48)
     (chunks
      (((ocaml_code
         "let apply_to_tuple f (first,second) = f ~first ~second;;")
        (toplevel_responses
         ((OCaml
           "val apply_to_tuple : (first:'a -> second:'b -> 'c) -> 'a * 'b -> 'c = <fun>"))))
       ((ocaml_code "apply_to_tuple divide (3,4);;")
        (toplevel_responses ((OCaml "- : int = 0")))))))
    ((name 49)
     (chunks
      (((ocaml_code
          "let concat ?sep x y =\
         \n  let sep = match sep with None -> \"\" | Some x -> x in\
         \n  x ^ sep ^ y\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val concat : ?sep:string -> string -> string -> string = <fun>"))))
       ((ocaml_code
         "concat \"foo\" \"bar\"             (* without the optional argument *);;")
        (toplevel_responses ((OCaml "- : string = \"foobar\""))))
       ((ocaml_code
         "concat ~sep:\":\" \"foo\" \"bar\"    (* with the optional argument    *);;")
        (toplevel_responses ((OCaml "- : string = \"foo:bar\"")))))))
    ((name 50)
     (chunks
      (((ocaml_code "let concat ?(sep=\"\") x y = x ^ sep ^ y ;;")
        (toplevel_responses
         ((OCaml
           "val concat : ?sep:string -> string -> string -> string = <fun>")))))))
    ((name 51)
     (chunks
      (((ocaml_code
         "concat ~sep:\":\" \"foo\" \"bar\" (* provide the optional argument *);;")
        (toplevel_responses ((OCaml "- : string = \"foo:bar\""))))
       ((ocaml_code
         "concat ?sep:(Some \":\") \"foo\" \"bar\" (* pass an explicit [Some] *);;")
        (toplevel_responses ((OCaml "- : string = \"foo:bar\"")))))))
    ((name 52)
     (chunks
      (((ocaml_code
         "concat \"foo\" \"bar\" (* don't provide the optional argument *);;")
        (toplevel_responses ((OCaml "- : string = \"foobar\""))))
       ((ocaml_code
         "concat ?sep:None \"foo\" \"bar\" (* explicitly pass `None` *);;")
        (toplevel_responses ((OCaml "- : string = \"foobar\"")))))))
    ((name 53)
     (chunks
      (((ocaml_code
         "let uppercase_concat ?(sep=\"\") a b = concat ~sep (String.uppercase a) b ;;")
        (toplevel_responses
         ((OCaml
           "val uppercase_concat : ?sep:string -> string -> string -> string = <fun>"))))
       ((ocaml_code "uppercase_concat \"foo\" \"bar\";;")
        (toplevel_responses ((OCaml "- : string = \"FOObar\""))))
       ((ocaml_code "uppercase_concat \"foo\" \"bar\" ~sep:\":\";;")
        (toplevel_responses ((OCaml "- : string = \"FOO:bar\"")))))))
    ((name 54)
     (chunks
      (((ocaml_code
         "let uppercase_concat ?sep a b = concat ?sep (String.uppercase a) b ;;")
        (toplevel_responses
         ((OCaml
           "val uppercase_concat : ?sep:string -> string -> string -> string = <fun>")))))))
    ((name 55)
     (chunks
      (((ocaml_code
          "let numeric_deriv ~delta ~x ~y ~f =\
         \n  let x' = x +. delta in\
         \n  let y' = y +. delta in\
         \n  let base = f ~x ~y in\
         \n  let dx = (f ~x:x' ~y -. base) /. delta in\
         \n  let dy = (f ~x ~y:y' -. base) /. delta in\
         \n  (dx,dy)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val numeric_deriv :\
           \n  delta:float ->\
           \n  x:float -> y:float -> f:(x:float -> y:float -> float) -> float * float =\
           \n  <fun>")))))))
    ((name 56)
     (chunks
      (((ocaml_code
          "let numeric_deriv ~delta ~x ~y ~f =\
         \n  let x' = x +. delta in\
         \n  let y' = y +. delta in\
         \n  let base = f ~x ~y in\
         \n  let dx = (f ~y ~x:x' -. base) /. delta in\
         \n  let dy = (f ~x ~y:y' -. base) /. delta in\
         \n  (dx,dy)\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 122-123:\
           \nError: This function is applied to arguments\
           \nin an order different from other calls.\
           \nThis is only allowed when the real type is known.")))))))
    ((name 57)
     (chunks
      (((ocaml_code
          "let numeric_deriv ~delta ~x ~y ~(f: x:float -> y:float -> float) =\
         \n  let x' = x +. delta in\
         \n  let y' = y +. delta in\
         \n  let base = f ~x ~y in\
         \n  let dx = (f ~y ~x:x' -. base) /. delta in\
         \n  let dy = (f ~x ~y:y' -. base) /. delta in\
         \n  (dx,dy)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val numeric_deriv :\
           \n  delta:float ->\
           \n  x:float -> y:float -> f:(x:float -> y:float -> float) -> float * float =\
           \n  <fun>")))))))
    ((name 58)
     (chunks
      (((ocaml_code "let colon_concat = concat ~sep:\":\";;")
        (toplevel_responses
         ((OCaml "val colon_concat : string -> string -> string = <fun>"))))
       ((ocaml_code "colon_concat \"a\" \"b\";;")
        (toplevel_responses ((OCaml "- : string = \"a:b\"")))))))
    ((name 59)
     (chunks
      (((ocaml_code "let prepend_pound = concat \"# \";;")
        (toplevel_responses
         ((OCaml "val prepend_pound : string -> string = <fun>"))))
       ((ocaml_code "prepend_pound \"a BASH comment\";;")
        (toplevel_responses ((OCaml "- : string = \"# a BASH comment\"")))))))
    ((name 60)
     (chunks
      (((ocaml_code "prepend_pound \"a BASH comment\" ~sep:\":\";;")
        (toplevel_responses
         ((Raw
            "Characters 0-13:\
           \nError: This function has type string -> string\
           \n       It is applied to too many arguments; maybe you forgot a `;'.")))))))
    ((name 61)
     (chunks
      (((ocaml_code "let concat x ?(sep=\"\") y = x ^ sep ^ y ;;")
        (toplevel_responses
         ((OCaml
           "val concat : string -> ?sep:string -> string -> string = <fun>")))))))
    ((name 62)
     (chunks
      (((ocaml_code "let prepend_pound = concat \"# \";;")
        (toplevel_responses
         ((OCaml
           "val prepend_pound : ?sep:string -> string -> string = <fun>"))))
       ((ocaml_code "prepend_pound \"a BASH comment\";;")
        (toplevel_responses ((OCaml "- : string = \"# a BASH comment\""))))
       ((ocaml_code "prepend_pound \"a BASH comment\" ~sep:\"--- \";;")
        (toplevel_responses
         ((OCaml "- : string = \"# --- a BASH comment\"")))))))
    ((name 63)
     (chunks
      (((ocaml_code "concat \"a\" \"b\" ~sep:\"=\";;")
        (toplevel_responses ((OCaml "- : string = \"a=b\"")))))))
    ((name 64)
     (chunks
      (((ocaml_code "let concat x y ?(sep=\"\") = x ^ sep ^ y ;;")
        (toplevel_responses
         ((Raw
            "Characters 17-23:\
           \nWarning 16: this optional argument cannot be erased.")
          (OCaml
           "val concat : string -> string -> ?sep:string -> string = <fun>")))))))
    ((name 65)
     (chunks
      (((ocaml_code "concat \"a\" \"b\";;")
        (toplevel_responses ((OCaml "- : ?sep:string -> string = <fun>")))))))))
  (matched true)))
