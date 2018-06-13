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
       ((ocaml_code "[1;2;3];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]")))))))
    ((name 1)
     (chunks
      (((ocaml_code "1 :: (2 :: (3 :: [])) ;;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]"))))
       ((ocaml_code "1 :: 2 :: 3 :: [] ;;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]")))))))
    ((name 2)
     (chunks
      (((ocaml_code "let empty = [];;")
        (toplevel_responses ((OCaml "val empty : 'a list = []"))))
       ((ocaml_code "3 :: empty;;")
        (toplevel_responses ((OCaml "- : int list = [3]"))))
       ((ocaml_code "\"three\" :: empty;;")
        (toplevel_responses ((OCaml "- : string list = [\"three\"]")))))))
    ((name 3)
     (chunks
      (((ocaml_code "let l = 1 :: 2 :: 3 :: [];;")
        (toplevel_responses ((OCaml "val l : int list = [1; 2; 3]"))))
       ((ocaml_code "let m = 0 :: l;;")
        (toplevel_responses ((OCaml "val m : int list = [0; 1; 2; 3]"))))
       ((ocaml_code "l;;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let rec sum l =\
         \n  match l with\
         \n  | [] -> 0\
         \n  | hd :: tl -> hd + sum tl\
         \n;;")
        (toplevel_responses ((OCaml "val sum : int list -> int = <fun>"))))
       ((ocaml_code "sum [1;2;3];;")
        (toplevel_responses ((OCaml "- : int = 6"))))
       ((ocaml_code "sum [];;") (toplevel_responses ((OCaml "- : int = 0")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let rec drop_value l to_drop =\
         \n  match l with\
         \n  | [] -> []\
         \n  | to_drop :: tl -> drop_value tl to_drop\
         \n  | hd :: tl -> hd :: drop_value tl to_drop\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 106-114:\
           \nWarning 11: this match case is unused.")
          (OCaml "val drop_value : 'a list -> 'a -> 'a list = <fun>")))))))
    ((name 6)
     (chunks
      (((ocaml_code "drop_value [1;2;3] 2;;")
        (toplevel_responses ((OCaml "- : int list = []")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "let rec drop_value l to_drop =\
         \n  match l with\
         \n  | [] -> []\
         \n  | hd :: tl ->\
         \n    let new_tl = drop_value tl to_drop in\
         \n    if hd = to_drop then new_tl else hd :: new_tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val drop_value : 'a list -> 'a -> 'a list = <fun>"))))
       ((ocaml_code "drop_value [1;2;3] 2;;")
        (toplevel_responses ((OCaml "- : int list = [1; 3]")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let rec drop_zero l =\
         \n  match l with\
         \n  | [] -> []\
         \n  | 0  :: tl -> drop_zero tl\
         \n  | hd :: tl -> hd :: drop_zero tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val drop_zero : int list -> int list = <fun>"))))
       ((ocaml_code "drop_zero [1;2;0;3];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3]")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let plus_one_match x =\
         \n  match x with\
         \n  | 0 -> 1\
         \n  | 1 -> 2\
         \n  | 2 -> 3\
         \n  | 3 -> 4\
         \n  | 4 -> 5\
         \n  | 5 -> 6\
         \n  | _ -> x + 1\
         \n;;")
        (toplevel_responses
         ((OCaml "val plus_one_match : int -> int = <fun>"))))
       ((ocaml_code
          "let plus_one_if x =\
         \n  if      x = 0 then 1\
         \n  else if x = 1 then 2\
         \n  else if x = 2 then 3\
         \n  else if x = 3 then 4\
         \n  else if x = 4 then 5\
         \n  else if x = 5 then 6\
         \n  else x + 1\
         \n;;")
        (toplevel_responses ((OCaml "val plus_one_if : int -> int = <fun>")))))))
    ((name 10)
     (chunks
      (((ocaml_code "#require \"core_bench\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/textutils: added to search path\
           \n/home/travis/.opam/4.04.2/lib/textutils/textutils.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_bench: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_bench/core_bench.cma: loaded"))))
       ((ocaml_code "open Core_bench;;") (toplevel_responses ()))
       ((ocaml_code
          "[ Bench.Test.create ~name:\"plus_one_match\" (fun () ->\
         \n      ignore (plus_one_match 10))\
         \n; Bench.Test.create ~name:\"plus_one_if\" (fun () ->\
         \n      ignore (plus_one_if 10)) ]\
         \n|> Bench.bench\
         \n;;")
        (toplevel_responses
         ((Raw
            "Estimated testing time 20s (2 benchmarks x 10s). Change using -quota SECS.\
           \n\226\148\140\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\172\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\144\
           \n\226\148\130 Name           \226\148\130 Time/Run \226\148\130\
           \n\226\148\156\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\188\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\164\
           \n\226\148\130 plus_one_match \226\148\130  34.86ns \226\148\130\
           \n\226\148\130 plus_one_if    \226\148\130  54.89ns \226\148\130\
           \n\226\148\148\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\180\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\152")
          (OCaml "- : unit = ()")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let rec sum_if l =\
         \n  if List.is_empty l then 0\
         \n  else List.hd_exn l + sum_if (List.tl_exn l)\
         \n;;")
        (toplevel_responses ((OCaml "val sum_if : int list -> int = <fun>")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let numbers = List.range 0 1000 in\
         \n[ Bench.Test.create ~name:\"sum_if\" (fun () -> ignore (sum_if numbers))\
         \n; Bench.Test.create ~name:\"sum\"    (fun () -> ignore (sum numbers)) ]\
         \n|> Bench.bench\
         \n;;")
        (toplevel_responses
         ((Raw
            "Estimated testing time 20s (2 benchmarks x 10s). Change using -quota SECS.\
           \n\226\148\140\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\172\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\144\
           \n\226\148\130 Name   \226\148\130 Time/Run \226\148\130\
           \n\226\148\156\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\188\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\164\
           \n\226\148\130 sum_if \226\148\130  62.00us \226\148\130\
           \n\226\148\130 sum    \226\148\130  17.99us \226\148\130\
           \n\226\148\148\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\180\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\152")
          (OCaml "- : unit = ()")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "let rec drop_zero l =\
         \n  match l with\
         \n  | [] -> []\
         \n  | 0  :: tl -> drop_zero tl\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 24-78:\
           \nWarning 8: this pattern-matching is not exhaustive.\
           \nHere is an example of a case that is not matched:\
           \n1::_")
          (OCaml "val drop_zero : int list -> 'a list = <fun>")))))))
    ((name 14)
     (chunks
      (((ocaml_code "List.map ~f:String.length [\"Hello\"; \"World!\"];;")
        (toplevel_responses ((OCaml "- : int list = [5; 6]")))))))
    ((name 15)
     (chunks
      (((ocaml_code "List.map2_exn ~f:Int.max [1;2;3] [3;2;1];;")
        (toplevel_responses ((OCaml "- : int list = [3; 2; 3]")))))))
    ((name 16)
     (chunks
      (((ocaml_code "List.map2_exn ~f:Int.max [1;2;3] [3;2;1;0];;")
        (toplevel_responses
         ((Raw
           "Exception: (Invalid_argument \"length mismatch in map2_exn: 3 <> 4 \").")))))))
    ((name 17)
     (chunks
      (((ocaml_code "List.fold;;")
        (toplevel_responses
         ((OCaml
           "- : 'a list -> init:'accum -> f:('accum -> 'a -> 'accum) -> 'accum = <fun>")))))))
    ((name 18)
     (chunks
      (((ocaml_code "List.fold ~init:0 ~f:(+) [1;2;3;4];;")
        (toplevel_responses ((OCaml "- : int = 10")))))))
    ((name 19)
     (chunks
      (((ocaml_code
         "List.fold ~init:[] ~f:(fun list x -> x :: list) [1;2;3;4];;")
        (toplevel_responses ((OCaml "- : int list = [4; 3; 2; 1]")))))))
    ((name 20)
     (chunks
      (((ocaml_code
          "let max_widths header rows =\
         \n  let lengths l = List.map ~f:String.length l in\
         \n  List.fold rows\
         \n    ~init:(lengths header)\
         \n    ~f:(fun acc row ->\
         \n        List.map2_exn ~f:Int.max acc (lengths row))\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val max_widths : string list -> string list list -> int list = <fun>")))))))
    ((name 21)
     (chunks
      (((ocaml_code
          "let render_separator widths =\
         \n  let pieces = List.map widths\
         \n      ~f:(fun w -> String.make (w + 2) '-')\
         \n  in\
         \n  \"|\" ^ String.concat ~sep:\"+\" pieces ^ \"|\"\
         \n;;")
        (toplevel_responses
         ((OCaml "val render_separator : int list -> string = <fun>"))))
       ((ocaml_code "render_separator [3;6;2];;")
        (toplevel_responses
         ((OCaml "- : string = \"|-----+--------+----|\"")))))))
    ((name 22)
     (chunks
      (((ocaml_code
         "let s = \".\" ^ \".\"  ^ \".\"  ^ \".\"  ^ \".\"  ^ \".\"  ^ \".\";;")
        (toplevel_responses ((OCaml "val s : string = \".......\"")))))))
    ((name 23)
     (chunks
      (((ocaml_code
         "let s = String.concat [\".\";\".\";\".\";\".\";\".\";\".\";\".\"];;")
        (toplevel_responses ((OCaml "val s : string = \".......\"")))))))
    ((name 24)
     (chunks
      (((ocaml_code
          "let pad s length =\
         \n  \" \" ^ s ^ String.make (length - String.length s + 1) ' '\
         \n;;")
        (toplevel_responses
         ((OCaml "val pad : string -> int -> string = <fun>"))))
       ((ocaml_code "pad \"hello\" 10;;")
        (toplevel_responses ((OCaml "- : string = \" hello      \"")))))))
    ((name 25)
     (chunks
      (((ocaml_code
          "let render_row row widths =\
         \n  let padded = List.map2_exn row widths ~f:pad in\
         \n  \"|\" ^ String.concat ~sep:\"|\" padded ^ \"|\"\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val render_row : string list -> int list -> string = <fun>"))))
       ((ocaml_code "render_row [\"Hello\";\"World\"] [10;15];;")
        (toplevel_responses
         ((OCaml "- : string = \"| Hello      | World           |\"")))))))
    ((name 26)
     (chunks
      (((ocaml_code
          "let render_table header rows =\
         \n  let widths = max_widths header rows in\
         \n  String.concat ~sep:\"\\n\"\
         \n    (render_row header widths\
         \n     :: render_separator widths\
         \n     :: List.map rows ~f:(fun row -> render_row row widths)\
         \n    )\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val render_table : string list -> string list list -> string = <fun>")))))))
    ((name 27)
     (chunks
      (((ocaml_code "List.reduce;;")
        (toplevel_responses
         ((OCaml "- : 'a list -> f:('a -> 'a -> 'a) -> 'a option = <fun>")))))))
    ((name 28)
     (chunks
      (((ocaml_code "List.reduce ~f:(+) [1;2;3;4;5];;")
        (toplevel_responses ((OCaml "- : int option = Some 15"))))
       ((ocaml_code "List.reduce ~f:(+) [];;")
        (toplevel_responses ((OCaml "- : int option = None")))))))
    ((name 29)
     (chunks
      (((ocaml_code "List.filter ~f:(fun x -> x mod 2 = 0) [1;2;3;4;5];;")
        (toplevel_responses ((OCaml "- : int list = [2; 4]")))))))
    ((name 30)
     (chunks
      (((ocaml_code
          "let extensions filenames =\
         \n  List.filter_map filenames ~f:(fun fname ->\
         \n      match String.rsplit2 ~on:'.' fname with\
         \n      | None  | Some (\"\",_) -> None\
         \n      | Some (_,ext) ->\
         \n        Some ext)\
         \n  |> List.dedup\
         \n;;")
        (toplevel_responses
         ((OCaml "val extensions : string list -> string list = <fun>"))))
       ((ocaml_code
         "extensions [\"foo.c\"; \"foo.ml\"; \"bar.ml\"; \"bar.mli\"];;")
        (toplevel_responses
         ((OCaml "- : string list = [\"c\"; \"ml\"; \"mli\"]")))))))
    ((name 31)
     (chunks
      (((ocaml_code
          "let is_ocaml_source s =\
         \n  match String.rsplit2 s ~on:'.' with\
         \n  | Some (_,(\"ml\"|\"mli\")) -> true\
         \n  | _ -> false\
         \n;;")
        (toplevel_responses
         ((OCaml "val is_ocaml_source : string -> bool = <fun>"))))
       ((ocaml_code
          "let (ml_files,other_files) =\
         \n  List.partition_tf [\"foo.c\"; \"foo.ml\"; \"bar.ml\"; \"bar.mli\"]  ~f:is_ocaml_source;;")
        (toplevel_responses
         ((OCaml
            "val ml_files : string list = [\"foo.ml\"; \"bar.ml\"; \"bar.mli\"]\
           \nval other_files : string list = [\"foo.c\"]")))))))
    ((name 32)
     (chunks
      (((ocaml_code "List.append [1;2;3] [4;5;6];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3; 4; 5; 6]")))))))
    ((name 33)
     (chunks
      (((ocaml_code "[1;2;3] @ [4;5;6];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3; 4; 5; 6]")))))))
    ((name 34)
     (chunks
      (((ocaml_code "List.concat [[1;2];[3;4;5];[6];[]];;")
        (toplevel_responses ((OCaml "- : int list = [1; 2; 3; 4; 5; 6]")))))))
    ((name 35)
     (chunks
      (((ocaml_code
          "module Sys = Core.Sys\
         \nlet rec ls_rec s =\
         \n  if Sys.is_file_exn ~follow_symlinks:true s\
         \n  then [s]\
         \n  else\
         \n    Sys.ls_dir s\
         \n    |> List.map ~f:(fun sub -> ls_rec (Filename.concat s sub))\
         \n    |> List.concat\
         \n;;")
        (toplevel_responses
         ((OCaml
            "module Sys = Core.Sys\
           \nval ls_rec : string -> string list = <fun>")))))))
    ((name 36)
     (chunks
      (((ocaml_code
          "let rec ls_rec s =\
         \n  if Sys.is_file_exn ~follow_symlinks:true s\
         \n  then [s]\
         \n  else\
         \n    Sys.ls_dir s\
         \n    |> List.concat_map ~f:(fun sub -> ls_rec (Filename.concat s sub))\
         \n;;")
        (toplevel_responses
         ((OCaml "val ls_rec : string -> string list = <fun>")))))))
    ((name 37)
     (chunks
      (((ocaml_code
          "let rec length = function\
         \n  | [] -> 0\
         \n  | _ :: tl -> 1 + length tl\
         \n;;")
        (toplevel_responses ((OCaml "val length : 'a list -> int = <fun>"))))
       ((ocaml_code "length [1;2;3];;")
        (toplevel_responses ((OCaml "- : int = 3")))))))
    ((name 38)
     (chunks
      (((ocaml_code "let make_list n = List.init n ~f:(fun x -> x);;")
        (toplevel_responses
         ((OCaml "val make_list : int -> int list = <fun>"))))
       ((ocaml_code "length (make_list 10);;")
        (toplevel_responses ((OCaml "- : int = 10"))))
       ((ocaml_code "length (make_list 10_000_000);;")
        (toplevel_responses
         ((Raw "Stack overflow during evaluation (looping recursion?).")))))))
    ((name 39)
     (chunks
      (((ocaml_code
          "let rec length_plus_n l n =\
         \n  match l with\
         \n  | [] -> n\
         \n  | _ :: tl -> length_plus_n tl (n + 1)\
         \n;;")
        (toplevel_responses
         ((OCaml "val length_plus_n : 'a list -> int -> int = <fun>"))))
       ((ocaml_code "let length l = length_plus_n l 0 ;;")
        (toplevel_responses ((OCaml "val length : 'a list -> int = <fun>"))))
       ((ocaml_code "length [1;2;3;4];;")
        (toplevel_responses ((OCaml "- : int = 4")))))))
    ((name 40)
     (chunks
      (((ocaml_code "length (make_list 10_000_000);;")
        (toplevel_responses ((OCaml "- : int = 10000000")))))))
    ((name 41)
     (chunks
      (((ocaml_code
          "let rec destutter list =\
         \n  match list with\
         \n  | [] -> []\
         \n  | [hd] -> [hd]\
         \n  | hd :: hd' :: tl ->\
         \n    if hd = hd' then destutter (hd' :: tl)\
         \n    else hd :: destutter (hd' :: tl)\
         \n;;")
        (toplevel_responses
         ((OCaml "val destutter : 'a list -> 'a list = <fun>")))))))
    ((name 42)
     (chunks
      (((ocaml_code
          "let rec destutter = function\
         \n  | [] as l -> l\
         \n  | [_] as l -> l\
         \n  | hd :: (hd' :: _ as tl) ->\
         \n    if hd = hd' then destutter tl\
         \n    else hd :: destutter tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val destutter : 'a list -> 'a list = <fun>")))))))
    ((name 43)
     (chunks
      (((ocaml_code
          "let rec destutter = function\
         \n  | [] | [_] as l -> l\
         \n  | hd :: (hd' :: _ as tl) ->\
         \n    if hd = hd' then destutter tl\
         \n    else hd :: destutter tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val destutter : 'a list -> 'a list = <fun>")))))))
    ((name 44)
     (chunks
      (((ocaml_code
          "let rec destutter = function\
         \n  | [] | [_] as l -> l\
         \n  | hd :: (hd' :: _ as tl) when hd = hd' -> destutter tl\
         \n  | hd :: tl -> hd :: destutter tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val destutter : 'a list -> 'a list = <fun>")))))))
    ((name 45)
     (chunks
      (((ocaml_code "3 = 4;;")
        (toplevel_responses ((OCaml "- : bool = false"))))
       ((ocaml_code "[3;4;5] = [3;4;5];;")
        (toplevel_responses ((OCaml "- : bool = true"))))
       ((ocaml_code "[Some 3; None] = [None; Some 3];;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 46)
     (chunks
      (((ocaml_code "(=);;")
        (toplevel_responses ((OCaml "- : 'a -> 'a -> bool = <fun>")))))))
    ((name 47)
     (chunks
      (((ocaml_code "(fun x -> x + 1) = (fun x -> x + 1);;")
        (toplevel_responses
         ((Raw
           "Exception: (Invalid_argument \"compare: functional value\").")))))))
    ((name 48)
     (chunks
      (((ocaml_code
          "let rec count_some list =\
         \n  match list with\
         \n  | [] -> 0\
         \n  | x :: tl when Option.is_none x -> count_some tl\
         \n  | x :: tl when Option.is_some x -> 1 + count_some tl\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 28-161:\
           \nWarning 8: this pattern-matching is not exhaustive.\
           \nHere is an example of a case that is not matched:\
           \n_::_\
           \n(However, some guarded clause may match this value.)")
          (OCaml "val count_some : 'a option list -> int = <fun>")))))))
    ((name 49)
     (chunks
      (((ocaml_code "count_some [Some 3; None; Some 4];;")
        (toplevel_responses ((OCaml "- : int = 2")))))))
    ((name 50)
     (chunks
      (((ocaml_code
          "let rec count_some list =\
         \n  match list with\
         \n  | [] -> 0\
         \n  | x :: tl when Option.is_none x -> count_some tl\
         \n  | x :: tl when Option.is_some x -> 1 + count_some tl\
         \n  | x :: tl -> -1 (* unreachable *)\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_some : 'a option list -> int = <fun>")))))))
    ((name 51)
     (chunks
      (((ocaml_code
          "let rec count_some list =\
         \n  match list with\
         \n  | [] -> 0\
         \n  | x :: tl when Option.is_none x -> count_some tl\
         \n  | _ :: tl -> 1 + count_some tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_some : 'a option list -> int = <fun>")))))))
    ((name 52)
     (chunks
      (((ocaml_code
          "let rec count_some list =\
         \n  match list with\
         \n  | [] -> 0\
         \n  | None   :: tl -> count_some tl\
         \n  | Some _ :: tl -> 1 + count_some tl\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_some : 'a option list -> int = <fun>")))))))
    ((name 53)
     (chunks
      (((ocaml_code "let count_some l = List.count ~f:Option.is_some l;;")
        (toplevel_responses
         ((OCaml "val count_some : 'a option list -> int = <fun>")))))))
    ((name 69)
     (chunks
      (((ocaml_code
          "printf \"%s\\n\"\
         \n  (render_table\
         \n     [\"language\";\"architect\";\"first release\"]\
         \n     [ [\"Lisp\" ;\"John McCarthy\" ;\"1958\"] ;\
         \n       [\"C\"    ;\"Dennis Ritchie\";\"1969\"] ;\
         \n       [\"ML\"   ;\"Robin Milner\"  ;\"1973\"] ;\
         \n       [\"OCaml\";\"Xavier Leroy\"  ;\"1996\"] ;\
         \n     ]);;")
        (toplevel_responses
         ((Raw
            "| language | architect      | first release |\
           \n|----------+----------------+---------------|\
           \n| Lisp     | John McCarthy  | 1958          |\
           \n| C        | Dennis Ritchie | 1969          |\
           \n| ML       | Robin Milner   | 1973          |\
           \n| OCaml    | Xavier Leroy   | 1996          |")
          (OCaml "- : unit = ()")))))))))
  (matched false)))
