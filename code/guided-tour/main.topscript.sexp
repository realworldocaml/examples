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
     (chunks (((ocaml_code "open Core_kernel;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code "3 + 4;;") (toplevel_responses ((OCaml "- : int = 7"))))
       ((ocaml_code "8 / 3;;") (toplevel_responses ((OCaml "- : int = 2"))))
       ((ocaml_code "3.5 +. 6.;;")
        (toplevel_responses ((OCaml "- : float = 9.5"))))
       ((ocaml_code "30_000_000 / 300_000;;")
        (toplevel_responses ((OCaml "- : int = 100"))))
       ((ocaml_code "sqrt 9.;;")
        (toplevel_responses ((OCaml "- : float = 3.")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let x = 3 + 4;;")
        (toplevel_responses ((OCaml "val x : int = 7"))))
       ((ocaml_code "let y = x + x;;")
        (toplevel_responses ((OCaml "val y : int = 14")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let x7 = 3 + 4;;")
        (toplevel_responses ((OCaml "val x7 : int = 7"))))
       ((ocaml_code "let x_plus_y = x + y;;")
        (toplevel_responses ((OCaml "val x_plus_y : int = 21"))))
       ((ocaml_code "let x' = x + 1;;")
        (toplevel_responses ((OCaml "val x' : int = 8"))))
       ((ocaml_code "let _x' = x' + x';;")
        (toplevel_responses ((OCaml "val _x' : int = 16"))))
       ((ocaml_code "_x';;") (toplevel_responses ((OCaml "- : int = 16")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let Seven = 3 + 4;;")
        (toplevel_responses
         ((Raw  "Characters 4-9:\
               \nError: Unbound constructor Seven"))))
       ((ocaml_code "let 7x = 7;;")
        (toplevel_responses
         ((Raw
            "Characters 4-6:\
           \nError: Unknown modifier 'x' for literal 7x"))))
       ((ocaml_code "let x-plus-y = x + y;;")
        (toplevel_responses
         ((Raw  "Characters 6-10:\
               \nError: Syntax error")))))))
    ((name 5)
     (chunks
      (((ocaml_code "let square x = x * x ;;")
        (toplevel_responses ((OCaml "val square : int -> int = <fun>"))))
       ((ocaml_code "square 2;;")
        (toplevel_responses ((OCaml "- : int = 4"))))
       ((ocaml_code "square (square 2);;")
        (toplevel_responses ((OCaml "- : int = 16")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "let ratio x y =\
         \n  Float.of_int x /. Float.of_int y\
         \n;;")
        (toplevel_responses
         ((OCaml "val ratio : int -> int -> float = <fun>"))))
       ((ocaml_code "ratio 4 7;;")
        (toplevel_responses ((OCaml "- : float = 0.571428571429")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "let sum_if_true test first second =\
         \n  (if test first then first else 0)\
         \n  + (if test second then second else 0)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val sum_if_true : (int -> bool) -> int -> int -> int = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code  "let even x =\
                    \n  x mod 2 = 0 ;;")
        (toplevel_responses ((OCaml "val even : int -> bool = <fun>"))))
       ((ocaml_code "sum_if_true even 3 4;;")
        (toplevel_responses ((OCaml "- : int = 4"))))
       ((ocaml_code "sum_if_true even 2 4;;")
        (toplevel_responses ((OCaml "- : int = 6")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let sum_if_true (test : int -> bool) (x : int) (y : int) : int =\
         \n  (if test x then x else 0)\
         \n  + (if test y then y else 0)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val sum_if_true : (int -> bool) -> int -> int -> int = <fun>")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "let first_if_true test x y =\
         \n  if test x then x else y\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val first_if_true : ('a -> bool) -> 'a -> 'a -> 'a = <fun>")))))))
    ((name 11)
     (chunks
      (((ocaml_code "let long_string s = String.length s > 6;;")
        (toplevel_responses
         ((OCaml "val long_string : string -> bool = <fun>"))))
       ((ocaml_code "first_if_true long_string \"short\" \"loooooong\";;")
        (toplevel_responses ((OCaml "- : string = \"loooooong\"")))))))
    ((name 12)
     (chunks
      (((ocaml_code "let big_number x = x > 3;;")
        (toplevel_responses ((OCaml "val big_number : int -> bool = <fun>"))))
       ((ocaml_code "first_if_true big_number 4 3;;")
        (toplevel_responses ((OCaml "- : int = 4")))))))
    ((name 13)
     (chunks
      (((ocaml_code "first_if_true big_number \"short\" \"loooooong\";;")
        (toplevel_responses
         ((Raw
            "Characters 25-32:\
           \nError: This expression has type string but an expression was expected of type\
           \n         int")))))))
    ((name 14)
     (chunks
      (((ocaml_code  "let add_potato x =\
                    \n  x + \"potato\";;")
        (toplevel_responses
         ((Raw
            "Characters 25-33:\
           \nError: This expression has type string but an expression was expected of type\
           \n         int")))))))
    ((name 15)
     (chunks
      (((ocaml_code  "let is_a_multiple x y =\
                    \n  x mod y = 0 ;;")
        (toplevel_responses
         ((OCaml "val is_a_multiple : int -> int -> bool = <fun>"))))
       ((ocaml_code "is_a_multiple 8 2;;")
        (toplevel_responses ((OCaml "- : bool = true"))))
       ((ocaml_code "is_a_multiple 8 0;;")
        (toplevel_responses ((Raw "Exception: Division_by_zero.")))))))
    ((name 16)
     (chunks
      (((ocaml_code "let a_tuple = (3,\"three\");;")
        (toplevel_responses
         ((OCaml "val a_tuple : int * string = (3, \"three\")"))))
       ((ocaml_code "let another_tuple = (3,\"four\",5.);;")
        (toplevel_responses
         ((OCaml
           "val another_tuple : int * string * float = (3, \"four\", 5.)")))))))
    ((name 17)
     (chunks
      (((ocaml_code "let (x,y) = a_tuple;;")
        (toplevel_responses
         ((OCaml  "val x : int = 3\
                 \nval y : string = \"three\"")))))))
    ((name 18)
     (chunks
      (((ocaml_code "x + String.length y;;")
        (toplevel_responses ((OCaml "- : int = 8")))))))
    ((name 19)
     (chunks
      (((ocaml_code
          "let distance (x1,y1) (x2,y2) =\
         \n  sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val distance : float * float -> float * float -> float = <fun>")))))))
    ((name 20)
     (chunks
      (((ocaml_code "let languages = [\"OCaml\";\"Perl\";\"C\"];;")
        (toplevel_responses
         ((OCaml
           "val languages : string list = [\"OCaml\"; \"Perl\"; \"C\"]")))))))
    ((name 21)
     (chunks
      (((ocaml_code "let numbers = [3;\"four\";5];;")
        (toplevel_responses
         ((Raw
            "Characters 17-23:\
           \nError: This expression has type string but an expression was expected of type\
           \n         int")))))))
    ((name 22)
     (chunks
      (((ocaml_code "List.length languages;;")
        (toplevel_responses ((OCaml "- : int = 3")))))))
    ((name 23)
     (chunks
      (((ocaml_code "List.map languages ~f:String.length;;")
        (toplevel_responses ((OCaml "- : int list = [5; 4; 1]")))))))
    ((name 24)
     (chunks
      (((ocaml_code "List.map ~f:String.length languages;;")
        (toplevel_responses ((OCaml "- : int list = [5; 4; 1]")))))))
    ((name 25)
     (chunks
      (((ocaml_code "\"French\" :: \"Spanish\" :: languages;;")
        (toplevel_responses
         ((OCaml
           "- : string list = [\"French\"; \"Spanish\"; \"OCaml\"; \"Perl\"; \"C\"]")))))))
    ((name 26)
     (chunks
      (((ocaml_code "languages;;")
        (toplevel_responses
         ((OCaml "- : string list = [\"OCaml\"; \"Perl\"; \"C\"]")))))))
    ((name 27)
     (chunks
      (((ocaml_code "[\"OCaml\", \"Perl\", \"C\"];;")
        (toplevel_responses
         ((OCaml
           "- : (string * string * string) list = [(\"OCaml\", \"Perl\", \"C\")]")))))))
    ((name 28)
     (chunks
      (((ocaml_code "1,2,3;;")
        (toplevel_responses ((OCaml "- : int * int * int = (1, 2, 3)")))))))
    ((name 29)
     (chunks
      (((ocaml_code "[1; 2; 3];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]"))))
       ((ocaml_code "1 :: (2 :: (3 :: []));;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]"))))
       ((ocaml_code "1 :: 2 :: 3 :: [];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]")))))))
    ((name 30)
     (chunks
      (((ocaml_code "[1;2;3] @ [4;5;6];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3; 4; 5; 6]")))))))
    ((name 31)
     (chunks
      (((ocaml_code
          "let my_favorite_language (my_favorite :: the_rest) =\
         \n  my_favorite\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 25-66:\
           \nWarning 8: this pattern-matching is not exhaustive.\
           \nHere is an example of a case that is not matched:\
           \n[]")
          (OCaml "val my_favorite_language : 'a list -> 'a = <fun>")))))))
    ((name 32)
     (chunks
      (((ocaml_code
         "my_favorite_language [\"English\";\"Spanish\";\"French\"];;")
        (toplevel_responses ((OCaml "- : string = \"English\""))))
       ((ocaml_code "my_favorite_language [];;")
        (toplevel_responses
         ((Raw "Exception: \"Match_failure //toplevel//:2:25\".")))))))
    ((name 33)
     (chunks
      (((ocaml_code
          "let my_favorite_language languages =\
         \n  match languages with\
         \n  | first :: the_rest -> first\
         \n  | [] -> \"OCaml\" (* A good default! *)\
         \n;;")
        (toplevel_responses
         ((OCaml "val my_favorite_language : string list -> string = <fun>"))))
       ((ocaml_code
         "my_favorite_language [\"English\";\"Spanish\";\"French\"];;")
        (toplevel_responses ((OCaml "- : string = \"English\""))))
       ((ocaml_code "my_favorite_language [];;")
        (toplevel_responses ((OCaml "- : string = \"OCaml\"")))))))
    ((name 34)
     (chunks
      (((ocaml_code
          "let rec sum l =\
         \n  match l with\
         \n  | [] -> 0                   (* base case *)\
         \n  | hd :: tl -> hd + sum tl   (* inductive case *)\
         \n;;")
        (toplevel_responses ((OCaml "val sum : int list -> int = <fun>"))))
       ((ocaml_code "sum [1;2;3];;")
        (toplevel_responses ((OCaml "- : int = 6")))))))
    ((name 35)
     (chunks
      (((ocaml_code
          "let rec remove_sequential_duplicates list =\
         \n  match list with\
         \n  | [] -> []\
         \n  | first :: second :: tl ->\
         \n    if first = second then remove_sequential_duplicates (second :: tl)\
         \n    else first :: remove_sequential_duplicates (second :: tl)\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 46-236:\
           \nWarning 8: this pattern-matching is not exhaustive.\
           \nHere is an example of a case that is not matched:\
           \n_::[]")
          (OCaml
           "val remove_sequential_duplicates : 'a list -> 'a list = <fun>")))))))
    ((name 36)
     (chunks
      (((ocaml_code
          "let rec remove_sequential_duplicates list =\
         \n  match list with\
         \n  | [] -> []\
         \n  | [hd] -> [hd]\
         \n  | hd1 :: hd2 :: tl ->\
         \n    if hd1 = hd2 then remove_sequential_duplicates (hd2 :: tl)\
         \n    else hd1 :: remove_sequential_duplicates (hd2 :: tl)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val remove_sequential_duplicates : 'a list -> 'a list = <fun>"))))
       ((ocaml_code
         "remove_sequential_duplicates [\"hey\";\"hey\";\"hey\";\"man!\"];;")
        (toplevel_responses
         ((OCaml "- : string list = [\"hey\"; \"man!\"]")))))))
    ((name 37)
     (chunks
      (((ocaml_code
          "let divide x y =\
         \n  if y = 0 then None else Some (x / y) ;;")
        (toplevel_responses
         ((OCaml "val divide : int -> int -> int option = <fun>")))))))
    ((name 38)
     (chunks
      (((ocaml_code
          "let downcase_extension filename =\
         \n  match String.rsplit2 filename ~on:'.' with\
         \n  | None -> filename\
         \n  | Some (base,ext) -> \
         \n    base ^ \".\" ^ String.lowercase ext\
         \n;;")
        (toplevel_responses
         ((OCaml "val downcase_extension : string -> string = <fun>"))))
       ((ocaml_code
          "List.map ~f:downcase_extension\
         \n  [ \"Hello_World.TXT\"; \"Hello_World.TXT\"; \"Hello_World\" ]\
         \n;;")
        (toplevel_responses
         ((OCaml
           "- : string list = [\"Hello_World.txt\"; \"Hello_World.txt\"; \"Hello_World\"]")))))))
    ((name 41)
     (chunks
      (((ocaml_code "type point2d = { x : float; y : float };;")
        (toplevel_responses
         ((OCaml "type point2d = { x : float; y : float; }")))))))
    ((name 42)
     (chunks
      (((ocaml_code "let p = { x = 3.; y = -4. };;")
        (toplevel_responses ((OCaml "val p : point2d = {x = 3.; y = -4.}")))))))
    ((name 43)
     (chunks
      (((ocaml_code
          "let magnitude { x = x_pos; y = y_pos } =\
         \n  sqrt (x_pos ** 2. +. y_pos ** 2.);;")
        (toplevel_responses
         ((OCaml "val magnitude : point2d -> float = <fun>")))))))
    ((name 44)
     (chunks
      (((ocaml_code "let magnitude { x; y } = sqrt (x ** 2. +. y ** 2.);;")
        (toplevel_responses
         ((OCaml "val magnitude : point2d -> float = <fun>")))))))
    ((name 45)
     (chunks
      (((ocaml_code
          "let distance v1 v2 =\
         \n  magnitude { x = v1.x -. v2.x; y = v1.y -. v2.y };;")
        (toplevel_responses
         ((OCaml "val distance : point2d -> point2d -> float = <fun>")))))))
    ((name 46)
     (chunks
      (((ocaml_code
         "type circle_desc  = { center: point2d; radius: float };;")
        (toplevel_responses
         ((OCaml "type circle_desc = { center : point2d; radius : float; }"))))
       ((ocaml_code
         "type rect_desc    = { lower_left: point2d; width: float; height: float };;")
        (toplevel_responses
         ((OCaml
           "type rect_desc = { lower_left : point2d; width : float; height : float; }"))))
       ((ocaml_code
         "type segment_desc = { endpoint1: point2d; endpoint2: point2d } ;;")
        (toplevel_responses
         ((OCaml
           "type segment_desc = { endpoint1 : point2d; endpoint2 : point2d; }")))))))
    ((name 47)
     (chunks
      (((ocaml_code
          "type scene_element =\
         \n  | Circle  of circle_desc\
         \n  | Rect    of rect_desc\
         \n  | Segment of segment_desc\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type scene_element =\
           \n    Circle of circle_desc\
           \n  | Rect of rect_desc\
           \n  | Segment of segment_desc")))))))
    ((name 48)
     (chunks
      (((ocaml_code
          "let is_inside_scene_element point scene_element =\
         \n  match scene_element with\
         \n  | Circle { center; radius } ->\
         \n    distance center point < radius\
         \n  | Rect { lower_left; width; height } ->\
         \n    point.x    > lower_left.x && point.x < lower_left.x +. width\
         \n    && point.y > lower_left.y && point.y < lower_left.y +. height\
         \n  | Segment { endpoint1; endpoint2 } -> false\
         \n\
         \nlet is_inside_scene point scene =\
         \n  List.exists scene\
         \n    ~f:(fun el -> is_inside_scene_element point el)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val is_inside_scene_element : point2d -> scene_element -> bool = <fun>\
           \nval is_inside_scene : point2d -> scene_element list -> bool = <fun>"))))
       ((ocaml_code
          "is_inside_scene {x=3.;y=7.}\
         \n  [ Circle {center = {x=4.;y= 4.}; radius = 0.5 } ];;")
        (toplevel_responses ((OCaml "- : bool = false"))))
       ((ocaml_code
          "is_inside_scene {x=3.;y=7.}\
         \n  [ Circle {center = {x=4.;y= 4.}; radius = 5.0 } ];;")
        (toplevel_responses ((OCaml "- : bool = true")))))))
    ((name 49)
     (chunks
      (((ocaml_code "let numbers = [| 1; 2; 3; 4 |];;")
        (toplevel_responses
         ((OCaml "val numbers : int array = [|1; 2; 3; 4|]"))))
       ((ocaml_code "numbers.(2) <- 4;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "numbers;;")
        (toplevel_responses ((OCaml "- : int array = [|1; 2; 4; 4|]")))))))
    ((name 50)
     (chunks
      (((ocaml_code
          "type running_sum =\
         \n  { mutable sum: float;\
         \n    mutable sum_sq: float; (* sum of squares *)\
         \n    mutable samples: int;\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type running_sum = {\
           \n  mutable sum : float;\
           \n  mutable sum_sq : float;\
           \n  mutable samples : int;\
           \n}")))))))
    ((name 51)
     (chunks
      (((ocaml_code
          "let mean rsum = rsum.sum /. Float.of_int rsum.samples\
         \nlet stdev rsum =\
         \n  sqrt (rsum.sum_sq /. Float.of_int rsum.samples\
         \n        -. (rsum.sum /. Float.of_int rsum.samples) ** 2.) ;;")
        (toplevel_responses
         ((OCaml
            "val mean : running_sum -> float = <fun>\
           \nval stdev : running_sum -> float = <fun>")))))))
    ((name 52)
     (chunks
      (((ocaml_code
          "let create () = { sum = 0.; sum_sq = 0.; samples = 0 }\
         \nlet update rsum x =\
         \n  rsum.samples <- rsum.samples + 1;\
         \n  rsum.sum     <- rsum.sum     +. x;\
         \n  rsum.sum_sq  <- rsum.sum_sq  +. x *. x\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create : unit -> running_sum = <fun>\
           \nval update : running_sum -> float -> unit = <fun>")))))))
    ((name 53)
     (chunks
      (((ocaml_code "let rsum = create ();;")
        (toplevel_responses
         ((OCaml
           "val rsum : running_sum = {sum = 0.; sum_sq = 0.; samples = 0}"))))
       ((ocaml_code
         "List.iter [1.;3.;2.;-7.;4.;5.] ~f:(fun x -> update rsum x);;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "mean rsum;;")
        (toplevel_responses ((OCaml "- : float = 1.33333333333"))))
       ((ocaml_code "stdev rsum;;")
        (toplevel_responses ((OCaml "- : float = 3.94405318873")))))))
    ((name 54)
     (chunks
      (((ocaml_code "let x = { contents = 0 };;")
        (toplevel_responses ((OCaml "val x : int ref = {contents = 0}"))))
       ((ocaml_code "x.contents <- x.contents + 1;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "x;;")
        (toplevel_responses ((OCaml "- : int ref = {contents = 1}")))))))
    ((name 55)
     (chunks
      (((ocaml_code
         "let x = ref 0  (* create a ref, i.e., { contents = 0 } *) ;;")
        (toplevel_responses ((OCaml "val x : int ref = {contents = 0}"))))
       ((ocaml_code
         "!x             (* get the contents of a ref, i.e., x.contents *) ;;")
        (toplevel_responses ((OCaml "- : int = 0"))))
       ((ocaml_code
         "x := !x + 1    (* assignment, i.e., x.contents <- ... *) ;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "!x ;;") (toplevel_responses ((OCaml "- : int = 1")))))))
    ((name 56)
     (chunks
      (((ocaml_code "type 'a ref = { mutable contents : 'a };;")
        (toplevel_responses
         ((OCaml "type 'a ref = { mutable contents : 'a; }"))))
       ((ocaml_code "let ref x = { contents = x };;")
        (toplevel_responses ((OCaml "val ref : 'a -> 'a ref = <fun>"))))
       ((ocaml_code "let (!) r = r.contents;;")
        (toplevel_responses ((OCaml "val ( ! ) : 'a ref -> 'a = <fun>"))))
       ((ocaml_code "let (:=) r x = r.contents <- x;;")
        (toplevel_responses
         ((OCaml "val ( := ) : 'a ref -> 'a -> unit = <fun>")))))))
    ((name 57)
     (chunks
      (((ocaml_code
          "let sum list =\
         \n  let sum = ref 0 in\
         \n  List.iter list ~f:(fun x -> sum := !sum + x);\
         \n  !sum\
         \n;;")
        (toplevel_responses ((OCaml "val sum : int list -> int = <fun>")))))))
    ((name 58)
     (chunks
      (((ocaml_code
          "let permute array =\
         \n  let length = Array.length array in\
         \n  for i = 0 to length - 2 do\
         \n    (* pick a j to swap with *)\
         \n    let j = i + Random.int (length - i) in\
         \n    (* Swap i and j *)\
         \n    let tmp = array.(i) in\
         \n    array.(i) <- array.(j);\
         \n    array.(j) <- tmp\
         \n  done\
         \n;;")
        (toplevel_responses
         ((OCaml "val permute : 'a array -> unit = <fun>")))))))
    ((name 59)
     (chunks
      (((ocaml_code "let ar = Array.init 20 ~f:(fun i -> i);;")
        (toplevel_responses
         ((OCaml
            "val ar : int array =\
           \n  [|0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19|]"))))
       ((ocaml_code "permute ar;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "ar;;")
        (toplevel_responses
         ((OCaml
            "- : int array =\
           \n[|6; 0; 7; 17; 2; 11; 8; 19; 5; 1; 3; 16; 12; 18; 13; 10; 15; 14; 9; 4|]")))))))
    ((name 60)
     (chunks
      (((ocaml_code
          "let find_first_negative_entry array =\
         \n  let pos = ref 0 in\
         \n  while !pos < Array.length array && array.(!pos) >= 0 do\
         \n    pos := !pos + 1\
         \n  done;\
         \n  if !pos = Array.length array then None else Some !pos\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val find_first_negative_entry : int array -> int option = <fun>"))))
       ((ocaml_code "find_first_negative_entry [|1;2;0;3|];;")
        (toplevel_responses ((OCaml "- : int option = None"))))
       ((ocaml_code "find_first_negative_entry [|1;-2;0;3|];;")
        (toplevel_responses ((OCaml "- : int option = Some 1")))))))
    ((name 61)
     (chunks
      (((ocaml_code
          "let find_first_negative_entry array =\
         \n  let pos = ref 0 in\
         \n  while\
         \n    let pos_is_good = !pos < Array.length array in\
         \n    let element_is_non_negative = array.(!pos) >= 0 in\
         \n    pos_is_good && element_is_non_negative\
         \n  do\
         \n    pos := !pos + 1\
         \n  done;\
         \n  if !pos = Array.length array then None else Some !pos\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val find_first_negative_entry : int array -> int option = <fun>"))))
       ((ocaml_code "find_first_negative_entry [|1;2;0;3|];;")
        (toplevel_responses
         ((Raw "Exception: (Invalid_argument \"index out of bounds\").")))))))))
  (matched false)))
