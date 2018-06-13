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
       ((ocaml_code "List.find;;")
        (toplevel_responses
         ((OCaml "- : 'a list -> f:('a -> bool) -> 'a option = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code "List.find [1;2;3] ~f:(fun x -> x >= 2) ;;")
        (toplevel_responses ((OCaml "- : int option = Some 2"))))
       ((ocaml_code "List.find [1;2;3] ~f:(fun x -> x >= 10) ;;")
        (toplevel_responses ((OCaml "- : int option = None")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "let compute_bounds ~cmp list =\
         \n  let sorted = List.sort ~cmp list in\
         \n  match List.hd sorted, List.last sorted with\
         \n  | None,_ | _, None -> None\
         \n  | Some x, Some y -> Some (x,y)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val compute_bounds : cmp:('a -> 'a -> int) -> 'a list -> ('a * 'a) option =\
           \n  <fun>")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let find_mismatches table1 table2 =\
         \n  Hashtbl.fold table1 ~init:[] ~f:(fun ~key ~data mismatches ->\
         \n    match Hashtbl.find table2 key with\
         \n    | Some data' when data' <> data -> key :: mismatches\
         \n    | _ -> mismatches\
         \n  )\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val find_mismatches : ('a, 'b) Hashtbl.t -> ('a, 'b) Hashtbl.t -> 'a list =\
           \n  <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code "[ Ok 3; Error \"abject failure\"; Ok 4 ];;")
        (toplevel_responses
         ((OCaml
           "- : (int, string) result list = [Ok 3; Error \"abject failure\"; Ok 4]")))))))
    ((name 5)
     (chunks
      (((ocaml_code "Error.of_string \"something went wrong\";;")
        (toplevel_responses ((OCaml "- : Error.t = something went wrong")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "Error.of_thunk (fun () ->\
         \n  sprintf \"something went wrong: %f\" 32.3343);;")
        (toplevel_responses
         ((OCaml "- : Error.t = something went wrong: 32.334300")))))))
    ((name 7)
     (chunks
      (((ocaml_code
         "Error.create \"Unexpected character\" 'z' Char.sexp_of_t;;")
        (toplevel_responses
         ((OCaml "- : Error.t = (\"Unexpected character\" z)")))))))
    ((name 8)
     (chunks
      (((ocaml_code
         "let custom_to_sexp = [%sexp_of: float * string list * int];;")
        (toplevel_responses
         ((OCaml
           "val custom_to_sexp : float * string list * int -> Sexp.t = <fun>"))))
       ((ocaml_code "custom_to_sexp (3.5, [\"a\";\"b\";\"c\"], 6034);;")
        (toplevel_responses ((OCaml "- : Sexp.t = (3.5 (a b c) 6034)")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "Error.create \"Something went terribly wrong\"\
         \n  (3.5, [\"a\";\"b\";\"c\"], 6034)\
         \n  [%sexp_of: float * string list * int] ;;")
        (toplevel_responses
         ((OCaml
           "- : Error.t = (\"Something went terribly wrong\" (3.5 (a b c) 6034))")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "Error.tag\
         \n  (Error.of_list [ Error.of_string \"Your tires were slashed\";\
         \n                   Error.of_string \"Your windshield was smashed\" ])\
         \n  \"over the weekend\"\
         \n;;")
        (toplevel_responses
         ((OCaml
            "- : Error.t =\
           \n(\"over the weekend\" \"Your tires were slashed\" \"Your windshield was smashed\")")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let bind option f =\
         \n  match option with\
         \n  | None -> None\
         \n  | Some x -> f x\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val bind : 'a option -> ('a -> 'b option) -> 'b option = <fun>")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let compute_bounds ~cmp list =\
         \n  let sorted = List.sort ~cmp list in\
         \n  Option.bind (List.hd sorted) (fun first ->\
         \n    Option.bind (List.last sorted) (fun last ->\
         \n      Some (first,last)))\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val compute_bounds : cmp:('a -> 'a -> int) -> 'a list -> ('a * 'a) option =\
           \n  <fun>")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "let compute_bounds ~cmp list =\
         \n  let open Option.Monad_infix in\
         \n  let sorted = List.sort ~cmp list in\
         \n  List.hd sorted   >>= fun first ->\
         \n  List.last sorted >>= fun last  ->\
         \n  Some (first,last)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val compute_bounds : cmp:('a -> 'a -> int) -> 'a list -> ('a * 'a) option =\
           \n  <fun>")))))))
    ((name 13.1)
     (chunks
      (((ocaml_code
          "let compute_bounds ~cmp list =\
         \n  let open Option.Let_syntax in\
         \n  let sorted = List.sort ~cmp list in\
         \n  let%bind first = List.hd sorted in\
         \n  let%bind last  = List.last sorted in\
         \n  Some (first,last)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val compute_bounds : cmp:('a -> 'a -> int) -> 'a list -> ('a * 'a) option =\
           \n  <fun>")))))))
    ((name 14)
     (chunks
      (((ocaml_code
          "let compute_bounds ~cmp list =\
         \n  let sorted = List.sort ~cmp list in\
         \n  Option.both (List.hd sorted) (List.last sorted)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val compute_bounds : cmp:('a -> 'a -> int) -> 'a list -> ('a * 'a) option =\
           \n  <fun>")))))))
    ((name 15)
     (chunks
      (((ocaml_code "3 / 0;;")
        (toplevel_responses ((Raw "Exception: Division_by_zero.")))))))
    ((name 16)
     (chunks
      (((ocaml_code "List.map ~f:(fun x -> 100 / x) [1;3;0;4];;")
        (toplevel_responses ((Raw "Exception: Division_by_zero.")))))))
    ((name 17)
     (chunks
      (((ocaml_code
         "List.map ~f:(fun x -> printf \"%d\\n%!\" x; 100 / x) [1;3;0;4];;")
        (toplevel_responses
         ((Raw  "Exception: Division_by_zero.\
               \n1\
               \n3\
               \n0")))))))
    ((name 18)
     (chunks
      (((ocaml_code "exception Key_not_found of string;;")
        (toplevel_responses ((OCaml "exception Key_not_found of string"))))
       ((ocaml_code "raise (Key_not_found \"a\");;")
        (toplevel_responses ((Raw "Exception: Key_not_found(\"a\").")))))))
    ((name 19)
     (chunks
      (((ocaml_code
         "let exceptions = [ Not_found; Division_by_zero; Key_not_found \"b\" ];;")
        (toplevel_responses
         ((OCaml
           "val exceptions : exn list = [Not_found; Division_by_zero; Key_not_found(\"b\")]"))))
       ((ocaml_code
          "List.filter exceptions  ~f:(function\
         \n  | Key_not_found _ | Not_found -> true\
         \n  | _ -> false);;")
        (toplevel_responses
         ((OCaml "- : exn list = [Not_found; Key_not_found(\"b\")]")))))))
    ((name 20)
     (chunks
      (((ocaml_code
          "let rec find_exn alist key = match alist with\
         \n  | [] -> raise (Key_not_found key)\
         \n  | (key',data) :: tl -> if key = key' then data else find_exn tl key\
         \n;;")
        (toplevel_responses
         ((OCaml "val find_exn : (string * 'a) list -> string -> 'a = <fun>"))))
       ((ocaml_code "let alist = [(\"a\",1); (\"b\",2)];;")
        (toplevel_responses
         ((OCaml
           "val alist : (string * int) list = [(\"a\", 1); (\"b\", 2)]"))))
       ((ocaml_code "find_exn alist \"a\";;")
        (toplevel_responses ((OCaml "- : int = 1"))))
       ((ocaml_code "find_exn alist \"c\";;")
        (toplevel_responses ((Raw "Exception: Key_not_found(\"c\").")))))))
    ((name 21)
     (chunks
      (((ocaml_code "raise;;")
        (toplevel_responses ((OCaml "- : exn -> 'a = <fun>")))))))
    ((name 22)
     (chunks
      (((ocaml_code "let rec forever () = forever ();;")
        (toplevel_responses ((OCaml "val forever : unit -> 'a = <fun>")))))))
    ((name 23)
     (chunks
      (((ocaml_code "type 'a bounds = { lower: 'a; upper: 'a };;")
        (toplevel_responses
         ((OCaml "type 'a bounds = { lower : 'a; upper : 'a; }"))))
       ((ocaml_code "exception Crossed_bounds of int bounds;;")
        (toplevel_responses
         ((OCaml "exception Crossed_bounds of int bounds"))))
       ((ocaml_code "Crossed_bounds { lower=10; upper=0 };;")
        (toplevel_responses ((OCaml "- : exn = Crossed_bounds(_)")))))))
    ((name 24)
     (chunks
      (((ocaml_code
         "type 'a bounds = { lower: 'a; upper: 'a } [@@deriving sexp];;")
        (toplevel_responses
         ((OCaml
            "type 'a bounds = { lower : 'a; upper : 'a; }\
           \nval bounds_of_sexp : (Sexp.t -> 'a) -> Sexp.t -> 'a bounds = <fun>\
           \nval sexp_of_bounds : ('a -> Sexp.t) -> 'a bounds -> Sexp.t = <fun>"))))
       ((ocaml_code
         "exception Crossed_bounds of int bounds [@@deriving sexp];;")
        (toplevel_responses
         ((OCaml "exception Crossed_bounds of int bounds"))))
       ((ocaml_code "Crossed_bounds { lower=10; upper=0 };;")
        (toplevel_responses
         ((OCaml
           "- : exn = (//toplevel//.Crossed_bounds ((lower 10) (upper 0)))")))))))
    ((name 25)
     (chunks
      (((ocaml_code "let failwith msg = raise (Failure msg);;")
        (toplevel_responses ((OCaml "val failwith : string -> 'a = <fun>")))))))
    ((name 26)
     (chunks
      (((ocaml_code
          "let merge_lists xs ys ~f =\
         \n  if List.length xs <> List.length ys then None\
         \n  else\
         \n    let rec loop xs ys =\
         \n      match xs,ys with\
         \n      | [],[] -> []\
         \n      | x::xs, y::ys -> f x y :: loop xs ys\
         \n      | _ -> assert false\
         \n    in\
         \n    Some (loop xs ys)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val merge_lists : 'a list -> 'b list -> f:('a -> 'b -> 'c) -> 'c list option =\
           \n  <fun>"))))
       ((ocaml_code "merge_lists [1;2;3] [-1;1;2] ~f:(+);;")
        (toplevel_responses ((OCaml "- : int list option = Some [0; 3; 5]"))))
       ((ocaml_code "merge_lists [1;2;3] [-1;1] ~f:(+);;")
        (toplevel_responses ((OCaml "- : int list option = None")))))))
    ((name 27)
     (chunks
      (((ocaml_code
          "let merge_lists xs ys ~f =\
         \n  let rec loop xs ys =\
         \n    match xs,ys with\
         \n    | [],[] -> []\
         \n    | x::xs, y::ys -> f x y :: loop xs ys\
         \n    | _ -> assert false\
         \n  in\
         \n  loop xs ys\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val merge_lists : 'a list -> 'b list -> f:('a -> 'b -> 'c) -> 'c list = <fun>"))))
       ((ocaml_code "merge_lists [1;2;3] [-1] ~f:(+);;")
        (toplevel_responses
         ((Raw "Exception: \"Assert_failure //toplevel//:7:11\".")))))))
    ((name 28)
     (chunks
      (((ocaml_code
          "let parse_line line =\
         \n  String.split_on_chars ~on:[','] line\
         \n  |> List.map ~f:Float.of_string\
         \n;;")
        (toplevel_responses
         ((OCaml "val parse_line : string -> float list = <fun>"))))
       ((ocaml_code
          "let load filename =\
         \n  let inc = In_channel.create filename in\
         \n  let data = In_channel.input_lines inc |> List.map ~f:parse_line in\
         \n  In_channel.close inc;\
         \n  data\
         \n;;")
        (toplevel_responses
         ((OCaml "val load : string -> float list list = <fun>")))))))
    ((name 29)
     (chunks
      (((ocaml_code
          "let load filename =\
         \n  let inc = In_channel.create filename in\
         \n  protect ~f:(fun () ->\
         \n    In_channel.input_lines inc |> List.map ~f:parse_line)\
         \n    ~finally:(fun () -> In_channel.close inc)\
         \n;;")
        (toplevel_responses
         ((OCaml "val load : string -> float list list = <fun>")))))))
    ((name 30)
     (chunks
      (((ocaml_code
          "let load filename =\
         \n  In_channel.with_file filename ~f:(fun inc ->\
         \n    In_channel.input_lines inc |> List.map ~f:parse_line)\
         \n;;")
        (toplevel_responses
         ((OCaml "val load : string -> float list list = <fun>")))))))
    ((name 31)
     (chunks
      (((ocaml_code
          "let lookup_weight ~compute_weight alist key =\
         \n  try\
         \n    let data = List.Assoc.find_exn alist key in\
         \n    compute_weight data\
         \n  with\
         \n    Not_found -> 0. ;;")
        (toplevel_responses
         ((OCaml
            "val lookup_weight :\
           \n  compute_weight:((equal:('a -> 'a -> bool) -> 'b) -> float) ->\
           \n  ('a, 'b) Base__List.Assoc.t -> 'a -> float = <fun>")))))))
    ((name 32)
     (chunks
      (((ocaml_code
          "lookup_weight ~compute_weight:(fun _ -> raise Not_found)\
         \n  [\"a\",3; \"b\",4] \"a\" ;;")
        (toplevel_responses ((OCaml "- : float = 0.")))))))
    ((name 33)
     (chunks
      (((ocaml_code
          "let lookup_weight ~compute_weight alist key =\
         \n  match\
         \n    try Some (List.Assoc.find_exn alist key)\
         \n    with _ -> None\
         \n  with\
         \n  | None -> 0.\
         \n  | Some data -> compute_weight data ;;")
        (toplevel_responses
         ((OCaml
            "val lookup_weight :\
           \n  compute_weight:((equal:('a -> 'a -> bool) -> 'b) -> float) ->\
           \n  ('a, 'b) Base__List.Assoc.t -> 'a -> float = <fun>")))))))
    ((name 33.1)
     (chunks
      (((ocaml_code
          "let lookup_weight ~compute_weight alist key =\
         \n  match List.Assoc.find_exn alist key with\
         \n  | exception _ -> 0.\
         \n  | data -> compute_weight data ;;")
        (toplevel_responses
         ((OCaml
            "val lookup_weight :\
           \n  compute_weight:((equal:('a -> 'a -> bool) -> 'b) -> float) ->\
           \n  ('a, 'b) Base__List.Assoc.t -> 'a -> float = <fun>")))))))
    ((name 34)
     (chunks
      (((ocaml_code
          "let lookup_weight ~compute_weight alist key =\
         \n  match List.Assoc.find alist key with\
         \n  | None -> 0.\
         \n  | Some data -> compute_weight data ;;")
        (toplevel_responses
         ((Raw
            "Characters 89-93:\
           \nError: This pattern matches values of type 'a option\
           \n       but a pattern was expected which matches values of type\
           \n         equal:('b -> 'b -> bool) -> 'c option")))))))
    ((name 35)
     (chunks
      (((ocaml_code
          "let find alist key =\
         \n  Option.try_with (fun () -> find_exn alist key) ;;")
        (toplevel_responses
         ((OCaml
           "val find : (string * 'a) list -> string -> 'a option = <fun>"))))
       ((ocaml_code "find [\"a\",1; \"b\",2] \"c\";;")
        (toplevel_responses ((OCaml "- : int option = None"))))
       ((ocaml_code "find [\"a\",1; \"b\",2] \"b\";;")
        (toplevel_responses ((OCaml "- : int option = Some 2")))))))
    ((name 36)
     (chunks
      (((ocaml_code
          "let find alist key =\
         \n  Or_error.try_with (fun () -> find_exn alist key) ;;")
        (toplevel_responses
         ((OCaml
           "val find : (string * 'a) list -> string -> 'a Or_error.t = <fun>"))))
       ((ocaml_code "find [\"a\",1; \"b\",2] \"c\";;")
        (toplevel_responses
         ((OCaml
           "- : int Or_error.t = Core_kernel__.Result.Error (\"Key_not_found(\\\"c\\\")\")")))))))
    ((name 37)
     (chunks
      (((ocaml_code "Or_error.ok_exn (find [\"a\",1; \"b\",2] \"b\");;")
        (toplevel_responses ((OCaml "- : int = 2"))))
       ((ocaml_code "Or_error.ok_exn (find [\"a\",1; \"b\",2] \"c\");;")
        (toplevel_responses ((Raw "Exception: Key_not_found(\"c\").")))))))))
  (matched true)))
