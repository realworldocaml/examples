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
    ((name 1)
     (chunks
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code
          "let digit_alist =\
         \n  [ 0, \"zero\"; 1, \"one\"; 2, \"two\"  ; 3, \"three\"; 4, \"four\"\
         \n  ; 5, \"five\"; 6, \"six\"; 7, \"seven\"; 8, \"eight\"; 9, \"nine\" ]\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val digit_alist : (int * string) list =\
           \n  [(0, \"zero\"); (1, \"one\"); (2, \"two\"); (3, \"three\"); (4, \"four\");\
           \n   (5, \"five\"); (6, \"six\"); (7, \"seven\"); (8, \"eight\"); (9, \"nine\")]")))))))
    ((name 2)
     (chunks
      (((ocaml_code "List.Assoc.find ~equal:Int.equal digit_alist 6;;")
        (toplevel_responses ((OCaml "- : string option = Some \"six\""))))
       ((ocaml_code "List.Assoc.find ~equal:Int.equal digit_alist 22;;")
        (toplevel_responses ((OCaml "- : string option = None"))))
       ((ocaml_code
         "List.Assoc.add ~equal:Int.equal digit_alist 0 \"zilch\";;")
        (toplevel_responses
         ((OCaml
            "- : (int, string) Base__List.Assoc.t =\
           \n[(0, \"zilch\"); (1, \"one\"); (2, \"two\"); (3, \"three\"); (4, \"four\");\
           \n (5, \"five\"); (6, \"six\"); (7, \"seven\"); (8, \"eight\"); (9, \"nine\")]")))))))
    ((name 3)
     (chunks
      (((ocaml_code
         "let digit_map = Map.of_alist_exn digit_alist ~comparator:Int.comparator;;")
        (toplevel_responses
         ((OCaml
           "val digit_map : (int, string, Int.comparator_witness) Map.t = <abstr>"))))
       ((ocaml_code "Map.find digit_map 3;;")
        (toplevel_responses ((OCaml "- : string option = Some \"three\"")))))))
    ((name 4)
     (chunks
      (((ocaml_code
         "let zilch_map = Map.add digit_map ~key:0 ~data:\"zilch\";;")
        (toplevel_responses
         ((OCaml
           "val zilch_map : (int, string, Int.comparator_witness) Map.t = <abstr>")))))))
    ((name 5)
     (chunks
      (((ocaml_code
         "let left = String.Map.of_alist_exn [\"foo\",1; \"bar\",3; \"snoo\",0];;")
        (toplevel_responses
         ((OCaml "val left : int String.Map.t = <abstr>"))))
       ((ocaml_code
         "let right = String.Map.of_alist_exn [\"foo\",0; \"snoo\",0];;")
        (toplevel_responses
         ((OCaml "val right : int String.Map.t = <abstr>"))))
       ((ocaml_code
         "Map.symmetric_diff ~data_equal:Int.equal left right |> Sequence.to_list;;")
        (toplevel_responses
         ((OCaml
            "- : (string, int) Map.Symmetric_diff_element.t list =\
           \n[(\"bar\", `Left 3); (\"foo\", `Unequal (1, 0))]")))))))
    ((name 6)
     (chunks
      (((ocaml_code "Map.symmetric_diff;;")
        (toplevel_responses
         ((OCaml
            "- : ('k, 'v, 'cmp) Map.t ->\
           \n    ('k, 'v, 'cmp) Map.t ->\
           \n    data_equal:('v -> 'v -> bool) ->\
           \n    ('k, 'v) Map.Symmetric_diff_element.t Sequence.t\
           \n= <fun>")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "module Reverse = Comparator.Make(struct\
         \n    type t = string\
         \n    let sexp_of_t = String.sexp_of_t\
         \n    let t_of_sexp = String.t_of_sexp\
         \n    let compare x y = String.compare y x\
         \n  end);;")
        (toplevel_responses
         ((OCaml
            "module Reverse :\
           \n  sig\
           \n    type comparator_witness\
           \n    val comparator : (string, comparator_witness) Comparator.t\
           \n  end")))))))
    ((name 8)
     (chunks
      (((ocaml_code "let alist = [\"foo\", 0; \"snoo\", 3];;")
        (toplevel_responses
         ((OCaml
           "val alist : (string * int) list = [(\"foo\", 0); (\"snoo\", 3)]"))))
       ((ocaml_code
         "let ord_map = Map.of_alist_exn ~comparator:String.comparator alist;;")
        (toplevel_responses
         ((OCaml
           "val ord_map : (string, int, String.comparator_witness) Map.t = <abstr>"))))
       ((ocaml_code
         "let rev_map = Map.of_alist_exn ~comparator:Reverse.comparator alist;;")
        (toplevel_responses
         ((OCaml
           "val rev_map : (string, int, Reverse.comparator_witness) Map.t = <abstr>")))))))
    ((name 9)
     (chunks
      (((ocaml_code "Map.min_elt ord_map;;")
        (toplevel_responses
         ((OCaml "- : (string * int) option = Some (\"foo\", 0)"))))
       ((ocaml_code "Map.min_elt rev_map;;")
        (toplevel_responses
         ((OCaml "- : (string * int) option = Some (\"snoo\", 3)")))))))
    ((name 10)
     (chunks
      (((ocaml_code "Map.symmetric_diff ord_map rev_map;;")
        (toplevel_responses
         ((Raw
            "Characters 27-34:\
           \nError: This expression has type\
           \n         (string, int, Reverse.comparator_witness) Map.t\
           \n       but an expression was expected of type\
           \n         (string, int, String.comparator_witness) Map.t\
           \n       Type Reverse.comparator_witness is not compatible with type\
           \n         String.comparator_witness ")))))))
    ((name 11)
     (chunks
      (((ocaml_code "let ord_tree = Map.to_tree ord_map;;")
        (toplevel_responses
         ((OCaml
           "val ord_tree : (string, int, String.comparator_witness) Map.Tree.t = <abstr>")))))))
    ((name 12)
     (chunks
      (((ocaml_code
         "Map.Tree.find ~comparator:String.comparator ord_tree \"snoo\";;")
        (toplevel_responses ((OCaml "- : int option = Some 3")))))))
    ((name 13)
     (chunks
      (((ocaml_code
         "Map.Tree.find ~comparator:Reverse.comparator ord_tree \"snoo\";;")
        (toplevel_responses
         ((Raw
            "Characters 45-53:\
           \nError: This expression has type\
           \n         (string, int, String.comparator_witness) Map.Tree.t\
           \n       but an expression was expected of type\
           \n         (string, int, Reverse.comparator_witness) Map.Tree.t\
           \n       Type String.comparator_witness is not compatible with type\
           \n         Reverse.comparator_witness ")))))))
    ((name 14)
     (chunks
      (((ocaml_code
         "Map.of_alist_exn ~comparator:Comparator.Poly.comparator digit_alist;;")
        (toplevel_responses
         ((OCaml
           "- : (int, string, Comparator.Poly.comparator_witness) Map.t = <abstr>")))))))
    ((name 15)
     (chunks
      (((ocaml_code "Map.Poly.of_alist_exn digit_alist;;")
        (toplevel_responses
         ((OCaml "- : (int, string) Map.Poly.t = <abstr>")))))))
    ((name 16)
     (chunks
      (((ocaml_code
          "Map.symmetric_diff\
         \n  (Map.Poly.singleton 3 \"three\")\
         \n  (Int.Map.singleton  3 \"four\" )\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 54-84:\
           \nError: This expression has type\
           \n         string Int.Map.t = (int, string, Int.comparator_witness) Map.t\
           \n       but an expression was expected of type\
           \n         (int, string, Comparator.Poly.comparator_witness) Map.t\
           \n       Type Int.comparator_witness is not compatible with type\
           \n         Comparator.Poly.comparator_witness ")))))))
    ((name 17)
     (chunks
      (((ocaml_code
          "let dedup ~comparator l =\
         \n  List.fold l ~init:(Set.empty ~comparator) ~f:Set.add\
         \n  |> Set.to_list\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val dedup : comparator:('a, 'b) Comparator.t -> 'a list -> 'a list = <fun>"))))
       ((ocaml_code "dedup ~comparator:Int.comparator [8;3;2;3;7;8;10];;")
        (toplevel_responses ((OCaml "- : int list = [2; 3; 7; 8; 10]")))))))
    ((name 18)
     (chunks
      (((ocaml_code "let s1 = Int.Set.of_list [1;2];;")
        (toplevel_responses ((OCaml "val s1 : Int.Set.t = <abstr>"))))
       ((ocaml_code "let s2 = Int.Set.of_list [2;1];;")
        (toplevel_responses ((OCaml "val s2 : Int.Set.t = <abstr>")))))))
    ((name 19)
     (chunks
      (((ocaml_code "Set.equal s1 s2;;")
        (toplevel_responses ((OCaml "- : bool = true")))))))
    ((name 20)
     (chunks
      (((ocaml_code "s1 = s2;;")
        (toplevel_responses
         ((Raw
           "Exception: (Invalid_argument \"compare: functional value\").")))))))
    ((name 21)
     (chunks
      (((ocaml_code "Set.to_tree s1 = Set.to_tree s2;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 22)
     (chunks
      (((ocaml_code
          "module Foo_and_bar : sig\
         \n  type t = { foo: Int.Set.t; bar: string }\
         \n  include Comparable.S with type t := t\
         \nend = struct\
         \n  module T = struct\
         \n    type t = { foo: Int.Set.t; bar: string } [@@deriving sexp]\
         \n    let compare t1 t2 =\
         \n      let c = Int.Set.compare t1.foo t2.foo in\
         \n      if c <> 0 then c else String.compare t1.bar t2.bar\
         \n  end\
         \n  include T\
         \n  include Comparable.Make(T)\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Foo_and_bar :\
           \n  sig\
           \n    type t = { foo : Int.Set.t; bar : string; }\
           \n    val ( >= ) : t -> t -> bool\
           \n    val ( <= ) : t -> t -> bool\
           \n    val ( = ) : t -> t -> bool\
           \n    val ( > ) : t -> t -> bool\
           \n    val ( < ) : t -> t -> bool\
           \n    val ( <> ) : t -> t -> bool\
           \n    val equal : t -> t -> bool\
           \n    val compare : t -> t -> int\
           \n...\
           \n    module Replace_polymorphic_compare :\
           \n      sig\
           \n        val ( >= ) : t -> t -> bool\
           \n        val ( <= ) : t -> t -> bool\
           \n        val ( = ) : t -> t -> bool\
           \n        val ( > ) : t -> t -> bool\
           \n...\
           \n      end\
           \n    module Map :\
           \n      sig\
           \n...\
           \n      end\
           \n    module Set :\
           \n      sig\
           \n...\
           \n      end\
           \n  end")))))))
    ((name 23)
     (chunks
      (((ocaml_code
          "module Foo_and_bar : sig\
         \n  type t = { foo: Int.Set.t; bar: string }\
         \n  include Comparable.S with type t := t\
         \nend = struct\
         \n  module T = struct\
         \n    type t = { foo: Int.Set.t; bar: string } [@@deriving sexp, compare]\
         \n  end\
         \n  include T\
         \n  include Comparable.Make(T)\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Foo_and_bar :\
           \n  sig\
           \n    type t = { foo : Int.Set.t; bar : string; }\
           \n    val ( >= ) : t -> t -> bool\
           \n    val ( <= ) : t -> t -> bool\
           \n    val ( = ) : t -> t -> bool\
           \n    val ( > ) : t -> t -> bool\
           \n...\
           \n  end")))))))
    ((name 24)
     (chunks
      (((ocaml_code
          "module Foo_and_bar : sig\
         \n  type t = { foo: int; bar: string }\
         \n  include Comparable.S with type t := t\
         \nend = struct\
         \n  module T = struct\
         \n    type t = { foo: int; bar: string } [@@deriving sexp]\
         \n  end\
         \n  include T\
         \n  include Comparable.Poly(T)\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Foo_and_bar :\
           \n  sig\
           \n    type t = { foo : int; bar : string; }\
           \n    val ( >= ) : t -> t -> bool\
           \n    val ( <= ) : t -> t -> bool\
           \n    val ( = ) : t -> t -> bool\
           \n    val ( > ) : t -> t -> bool\
           \n    val ( < ) : t -> t -> bool\
           \n    val ( <> ) : t -> t -> bool\
           \n    val equal : t -> t -> bool\
           \n    val compare : t -> t -> int\
           \n...\
           \n  end")))))))
    ((name 25)
     (chunks
      (((ocaml_code
         "let table = Hashtbl.create ~hashable:String.hashable ();;")
        (toplevel_responses
         ((OCaml "val table : (string, '_a) Hashtbl.t = <abstr>"))))
       ((ocaml_code "Hashtbl.set table ~key:\"three\" ~data:3;;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "Hashtbl.find table \"three\";;")
        (toplevel_responses ((OCaml "- : int option = Some 3")))))))
    ((name 26)
     (chunks
      (((ocaml_code "let table = String.Table.create ();;")
        (toplevel_responses
         ((OCaml "val table : '_a String.Table.t = <abstr>")))))))
    ((name 27)
     (chunks
      (((ocaml_code
         "let table = Hashtbl.create ~hashable:Hashtbl.Poly.hashable ();;")
        (toplevel_responses
         ((OCaml "val table : ('_a, '_b) Hashtbl.t = <abstr>")))))))
    ((name 28)
     (chunks
      (((ocaml_code "let table = Hashtbl.Poly.create ();;")
        (toplevel_responses
         ((OCaml "val table : ('_a, '_b) Hashtbl.t = <abstr>")))))))
    ((name 29)
     (chunks
      (((ocaml_code "Caml.Hashtbl.hash (List.range 0 9);;")
        (toplevel_responses ((OCaml "- : int = 209331808"))))
       ((ocaml_code "Caml.Hashtbl.hash (List.range 0 10);;")
        (toplevel_responses ((OCaml "- : int = 182325193"))))
       ((ocaml_code "Caml.Hashtbl.hash (List.range 0 11);;")
        (toplevel_responses ((OCaml "- : int = 182325193"))))
       ((ocaml_code "Caml.Hashtbl.hash (List.range 0 100);;")
        (toplevel_responses ((OCaml "- : int = 182325193")))))))
    ((name 30)
     (chunks
      (((ocaml_code
          "module Foo_and_bar : sig\
         \n  type t = { foo: int; bar: string }\
         \n  include Hashable.S with type t := t\
         \nend = struct\
         \n  module T = struct\
         \n    type t = { foo: int; bar: string } [@@deriving sexp, compare, hash]\
         \n  end\
         \n  include T\
         \n  include Hashable.Make(T)\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Foo_and_bar :\
           \n  sig\
           \n    type t = { foo : int; bar : string; }\
           \n    val hash : t -> int\
           \n    val compare : t -> t -> int\
           \n    val hashable : t Hashtbl_intf.Hashable.t\
           \n    module Table :\
           \n      sig\
           \n        type key = t\
           \n        type ('a, 'b) hashtbl = ('a, 'b) Hashtbl.t\
           \n...\
           \n      end\
           \n    module Hash_set :\
           \n      sig\
           \n...\
           \n      end\
           \n    module Hash_queue :\
           \n      sig\
           \n...\
           \n      end\
           \n  end")))))))))
  (matched true)))
