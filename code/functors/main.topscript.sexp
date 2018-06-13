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
      (((ocaml_code
          "module Increment (M : X_int) : X_int = struct\
         \n  let x = M.x + 1\
         \nend;;")
        (toplevel_responses
         ((OCaml "module Increment : functor (M : X_int) -> X_int")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "module Increment (M : X_int) = struct\
         \n  let x = M.x + 1\
         \nend;;")
        (toplevel_responses
         ((OCaml
           "module Increment : functor (M : X_int) -> sig val x : int end")))))))
    ((name 3)
     (chunks
      (((ocaml_code "module Three = struct let x = 3 end;;")
        (toplevel_responses ((OCaml "module Three : sig val x : int end"))))
       ((ocaml_code "module Four = Increment(Three);;")
        (toplevel_responses ((OCaml "module Four : sig val x : int end"))))
       ((ocaml_code "Four.x - Three.x;;")
        (toplevel_responses ((OCaml "- : int = 1")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "module Three_and_more = struct\
         \n  let x = 3\
         \n  let y = \"three\"\
         \nend;;")
        (toplevel_responses
         ((OCaml
           "module Three_and_more : sig val x : int val y : string end"))))
       ((ocaml_code "module Four = Increment(Three_and_more);;")
        (toplevel_responses ((OCaml "module Four : sig val x : int end")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "module type Comparable = sig\
         \n  type t\
         \n  val compare : t -> t -> int\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "module type Comparable = sig type t val compare : t -> t -> int end")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "module Make_interval(Endpoint : Comparable) = struct\
         \n\
         \n  type t = | Interval of Endpoint.t * Endpoint.t\
         \n           | Empty\
         \n\
         \n  (** [create low high] creates a new interval from [low] to\
         \n      [high].  If [low > high], then the interval is empty *)\
         \n  let create low high =\
         \n    if Endpoint.compare low high > 0 then Empty\
         \n    else Interval (low,high)\
         \n\
         \n  (** Returns true iff the interval is empty *)\
         \n  let is_empty = function\
         \n    | Empty -> true\
         \n    | Interval _ -> false\
         \n\
         \n  (** [contains t x] returns true iff [x] is contained in the\
         \n      interval [t] *)\
         \n  let contains t x =\
         \n    match t with\
         \n    | Empty -> false\
         \n    | Interval (l,h) ->\
         \n      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0\
         \n\
         \n  (** [intersect t1 t2] returns the intersection of the two input\
         \n      intervals *)\
         \n  let intersect t1 t2 =\
         \n    let min x y = if Endpoint.compare x y <= 0 then x else y in\
         \n    let max x y = if Endpoint.compare x y >= 0 then x else y in\
         \n    match t1,t2 with\
         \n    | Empty, _ | _, Empty -> Empty\
         \n    | Interval (l1,h1), Interval (l2,h2) ->\
         \n      create (max l1 l2) (min h1 h2)\
         \n\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "module Make_interval :\
           \n  functor (Endpoint : Comparable) ->\
           \n    sig\
           \n      type t = Interval of Endpoint.t * Endpoint.t | Empty\
           \n      val create : Endpoint.t -> Endpoint.t -> t\
           \n      val is_empty : t -> bool\
           \n      val contains : t -> Endpoint.t -> bool\
           \n      val intersect : t -> t -> t\
           \n    end")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "module Int_interval =\
         \n  Make_interval(struct\
         \n    type t = int\
         \n    let compare = Int.compare\
         \n  end);;")
        (toplevel_responses
         ((OCaml
            "module Int_interval :\
           \n  sig\
           \n    type t = Interval of int * int | Empty\
           \n    val create : int -> int -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> int -> bool\
           \n    val intersect : t -> t -> t\
           \n  end")))))))
    ((name 8)
     (chunks
      (((ocaml_code "module Int_interval = Make_interval(Int) ;;")
        (toplevel_responses
         ((OCaml
            "module Int_interval :\
           \n  sig\
           \n    type t =\
           \n      Make_interval(Core_kernel__Core_int).t =\
           \n        Interval of int * int\
           \n      | Empty\
           \n    val create : int -> int -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> int -> bool\
           \n    val intersect : t -> t -> t\
           \n  end"))))
       ((ocaml_code "module String_interval = Make_interval(String) ;;")
        (toplevel_responses
         ((OCaml
            "module String_interval :\
           \n  sig\
           \n    type t =\
           \n      Make_interval(Core_kernel__Core_string).t =\
           \n        Interval of string * string\
           \n      | Empty\
           \n    val create : string -> string -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> string -> bool\
           \n    val intersect : t -> t -> t\
           \n  end")))))))
    ((name 9)
     (chunks
      (((ocaml_code "let i1 = Int_interval.create 3 8;;")
        (toplevel_responses
         ((OCaml "val i1 : Int_interval.t = Int_interval.Interval (3, 8)"))))
       ((ocaml_code "let i2 = Int_interval.create 4 10;;")
        (toplevel_responses
         ((OCaml "val i2 : Int_interval.t = Int_interval.Interval (4, 10)"))))
       ((ocaml_code "Int_interval.intersect i1 i2;;")
        (toplevel_responses
         ((OCaml "- : Int_interval.t = Int_interval.Interval (4, 8)")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "module Rev_int_interval =\
         \n  Make_interval(struct\
         \n    type t = int\
         \n    let compare x y = Int.compare y x\
         \n  end);;")
        (toplevel_responses
         ((OCaml
            "module Rev_int_interval :\
           \n  sig\
           \n    type t = Interval of int * int | Empty\
           \n    val create : int -> int -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> int -> bool\
           \n    val intersect : t -> t -> t\
           \n  end")))))))
    ((name 11)
     (chunks
      (((ocaml_code "let interval = Int_interval.create 4 3;;")
        (toplevel_responses
         ((OCaml "val interval : Int_interval.t = Int_interval.Empty"))))
       ((ocaml_code "let rev_interval = Rev_int_interval.create 4 3;;")
        (toplevel_responses
         ((OCaml
           "val rev_interval : Rev_int_interval.t = Rev_int_interval.Interval (4, 3)")))))))
    ((name 12)
     (chunks
      (((ocaml_code "Int_interval.contains rev_interval 3;;")
        (toplevel_responses
         ((Raw
            "Characters 22-34:\
           \nError: This expression has type Rev_int_interval.t\
           \n       but an expression was expected of type Int_interval.t")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "Int_interval.is_empty (* going through create *)\
         \n  (Int_interval.create 4 3) ;;")
        (toplevel_responses ((OCaml "- : bool = true"))))
       ((ocaml_code
          "Int_interval.is_empty (* bypassing create *)\
         \n  (Int_interval.Interval (4,3)) ;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 14)
     (chunks
      (((ocaml_code
          "module type Interval_intf = sig\
         \n  type t\
         \n  type endpoint\
         \n  val create : endpoint -> endpoint -> t\
         \n  val is_empty : t -> bool\
         \n  val contains : t -> endpoint -> bool\
         \n  val intersect : t -> t -> t\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module type Interval_intf =\
           \n  sig\
           \n    type t\
           \n    type endpoint\
           \n    val create : endpoint -> endpoint -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> endpoint -> bool\
           \n    val intersect : t -> t -> t\
           \n  end")))))))
    ((name 15)
     (chunks
      (((ocaml_code
          "module Make_interval(Endpoint : Comparable) : Interval_intf = struct\
         \n  type endpoint = Endpoint.t\
         \n  type t = | Interval of Endpoint.t * Endpoint.t\
         \n           | Empty\
         \n\
         \n  (* CR: avoid this duplication *)\
         \n\
         \n  (** [create low high] creates a new interval from [low] to\
         \n      [high].  If [low > high], then the interval is empty *)\
         \n  let create low high =\
         \n    if Endpoint.compare low high > 0 then Empty\
         \n    else Interval (low,high)\
         \n\
         \n  (** Returns true iff the interval is empty *)\
         \n  let is_empty = function\
         \n    | Empty -> true\
         \n    | Interval _ -> false\
         \n\
         \n  (** [contains t x] returns true iff [x] is contained in the\
         \n      interval [t] *)\
         \n  let contains t x =\
         \n    match t with\
         \n    | Empty -> false\
         \n    | Interval (l,h) ->\
         \n      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0\
         \n\
         \n  (** [intersect t1 t2] returns the intersection of the two input\
         \n      intervals *)\
         \n  let intersect t1 t2 =\
         \n    let min x y = if Endpoint.compare x y <= 0 then x else y in\
         \n    let max x y = if Endpoint.compare x y >= 0 then x else y in\
         \n    match t1,t2 with\
         \n    | Empty, _ | _, Empty -> Empty\
         \n    | Interval (l1,h1), Interval (l2,h2) ->\
         \n      create (max l1 l2) (min h1 h2)\
         \n\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "module Make_interval : functor (Endpoint : Comparable) -> Interval_intf")))))))
    ((name 16)
     (chunks
      (((ocaml_code "module Int_interval = Make_interval(Int);;")
        (toplevel_responses
         ((OCaml
            "module Int_interval :\
           \n  sig\
           \n    type t = Make_interval(Core_kernel__Core_int).t\
           \n    type endpoint = Make_interval(Core_kernel__Core_int).endpoint\
           \n    val create : endpoint -> endpoint -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> endpoint -> bool\
           \n    val intersect : t -> t -> t\
           \n  end"))))
       ((ocaml_code "Int_interval.create 3 4;;")
        (toplevel_responses
         ((Raw
            "Characters 20-21:\
           \nError: This expression has type int but an expression was expected of type\
           \n         Int_interval.endpoint")))))))
    ((name 17)
     (chunks
      (((ocaml_code
          "module type Int_interval_intf =\
         \n  Interval_intf with type endpoint = int;;")
        (toplevel_responses
         ((OCaml
            "module type Int_interval_intf =\
           \n  sig\
           \n    type t\
           \n    type endpoint = int\
           \n    val create : endpoint -> endpoint -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> endpoint -> bool\
           \n    val intersect : t -> t -> t\
           \n  end")))))))
    ((name 18)
     (chunks
      (((ocaml_code
          "module Make_interval(Endpoint : Comparable)\
         \n  : (Interval_intf with type endpoint = Endpoint.t)\
         \n= struct\
         \n\
         \n  type endpoint = Endpoint.t\
         \n  type t = | Interval of Endpoint.t * Endpoint.t\
         \n           | Empty\
         \n\
         \n  (** [create low high] creates a new interval from [low] to\
         \n      [high].  If [low > high], then the interval is empty *)\
         \n  let create low high =\
         \n    if Endpoint.compare low high > 0 then Empty\
         \n    else Interval (low,high)\
         \n\
         \n  (** Returns true iff the interval is empty *)\
         \n  let is_empty = function\
         \n    | Empty -> true\
         \n    | Interval _ -> false\
         \n\
         \n  (** [contains t x] returns true iff [x] is contained in the\
         \n      interval [t] *)\
         \n  let contains t x =\
         \n    match t with\
         \n    | Empty -> false\
         \n    | Interval (l,h) ->\
         \n      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0\
         \n\
         \n  (** [intersect t1 t2] returns the intersection of the two input\
         \n      intervals *)\
         \n  let intersect t1 t2 =\
         \n    let min x y = if Endpoint.compare x y <= 0 then x else y in\
         \n    let max x y = if Endpoint.compare x y >= 0 then x else y in\
         \n    match t1,t2 with\
         \n    | Empty, _ | _, Empty -> Empty\
         \n    | Interval (l1,h1), Interval (l2,h2) ->\
         \n      create (max l1 l2) (min h1 h2)\
         \n\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "module Make_interval :\
           \n  functor (Endpoint : Comparable) ->\
           \n    sig\
           \n      type t\
           \n      type endpoint = Endpoint.t\
           \n      val create : endpoint -> endpoint -> t\
           \n      val is_empty : t -> bool\
           \n      val contains : t -> endpoint -> bool\
           \n      val intersect : t -> t -> t\
           \n    end")))))))
    ((name 19)
     (chunks
      (((ocaml_code "module Int_interval = Make_interval(Int);;")
        (toplevel_responses
         ((OCaml
            "module Int_interval :\
           \n  sig\
           \n    type t = Make_interval(Core_kernel__Core_int).t\
           \n    type endpoint = int\
           \n    val create : endpoint -> endpoint -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> endpoint -> bool\
           \n    val intersect : t -> t -> t\
           \n  end"))))
       ((ocaml_code "let i = Int_interval.create 3 4;;")
        (toplevel_responses ((OCaml "val i : Int_interval.t = <abstr>"))))
       ((ocaml_code "Int_interval.contains i 5;;")
        (toplevel_responses ((OCaml "- : bool = false")))))))
    ((name 20)
     (chunks
      (((ocaml_code
          "module type Int_interval_intf =\
         \n  Interval_intf with type endpoint := int;;")
        (toplevel_responses
         ((OCaml
            "module type Int_interval_intf =\
           \n  sig\
           \n    type t\
           \n    val create : int -> int -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> int -> bool\
           \n    val intersect : t -> t -> t\
           \n  end")))))))
    ((name 21)
     (chunks
      (((ocaml_code
          "(* Suspicious # ? *)\
         \nmodule Make_interval(Endpoint : Comparable)\
         \n  : Interval_intf with type endpoint := Endpoint.t =\
         \nstruct\
         \n\
         \n  type t = | Interval of Endpoint.t * Endpoint.t\
         \n           | Empty\
         \n\
         \n  (** [create low high] creates a new interval from [low] to\
         \n      [high].  If [low > high], then the interval is empty *)\
         \n  let create low high =\
         \n    if Endpoint.compare low high > 0 then Empty\
         \n    else Interval (low,high)\
         \n\
         \n  (** Returns true iff the interval is empty *)\
         \n  let is_empty = function\
         \n    | Empty -> true\
         \n    | Interval _ -> false\
         \n\
         \n  (** [contains t x] returns true iff [x] is contained in the\
         \n      interval [t] *)\
         \n  let contains t x =\
         \n    match t with\
         \n    | Empty -> false\
         \n    | Interval (l,h) ->\
         \n      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0\
         \n\
         \n  (** [intersect t1 t2] returns the intersection of the two input\
         \n      intervals *)\
         \n  let intersect t1 t2 =\
         \n    let min x y = if Endpoint.compare x y <= 0 then x else y in\
         \n    let max x y = if Endpoint.compare x y >= 0 then x else y in\
         \n    match t1,t2 with\
         \n    | Empty, _ | _, Empty -> Empty\
         \n    | Interval (l1,h1), Interval (l2,h2) ->\
         \n      create (max l1 l2) (min h1 h2)\
         \n\
         \nend ;;")
        (toplevel_responses
         ((OCaml
            "module Make_interval :\
           \n  functor (Endpoint : Comparable) ->\
           \n    sig\
           \n      type t\
           \n      val create : Endpoint.t -> Endpoint.t -> t\
           \n      val is_empty : t -> bool\
           \n      val contains : t -> Endpoint.t -> bool\
           \n      val intersect : t -> t -> t\
           \n    end")))))))
    ((name 22)
     (chunks
      (((ocaml_code "module Int_interval = Make_interval(Int);;")
        (toplevel_responses
         ((OCaml
            "module Int_interval :\
           \n  sig\
           \n    type t = Make_interval(Core_kernel__Core_int).t\
           \n    val create : int -> int -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> int -> bool\
           \n    val intersect : t -> t -> t\
           \n  end"))))
       ((ocaml_code  "Int_interval.is_empty\
                    \n  (Int_interval.create 3 4);;")
        (toplevel_responses ((OCaml "- : bool = false"))))
       ((ocaml_code "Int_interval.is_empty (Int_interval.Interval (4,3));;")
        (toplevel_responses
         ((Raw
            "Characters 23-44:\
           \nError: Unbound constructor Int_interval.Interval")))))))
    ((name 23)
     (chunks
      (((ocaml_code
          "Sexp.List [ Sexp.Atom \"This\"; Sexp.Atom \"is\"\
         \n          ; Sexp.List [Sexp.Atom \"an\"; Sexp.Atom \"s-expression\"]];;")
        (toplevel_responses
         ((OCaml "- : Sexp.t = (This is (an s-expression))")))))))
    ((name 24)
     (chunks
      (((ocaml_code "type some_type = int * string list [@@deriving sexp];;")
        (toplevel_responses
         ((OCaml
            "type some_type = int * string list\
           \nval some_type_of_sexp : Sexp.t -> some_type = <fun>\
           \nval sexp_of_some_type : some_type -> Sexp.t = <fun>"))))
       ((ocaml_code "sexp_of_some_type (33, [\"one\"; \"two\"]);;")
        (toplevel_responses ((OCaml "- : Sexp.t = (33 (one two))"))))
       ((ocaml_code
         "Sexp.of_string \"(44 (five six))\" |> some_type_of_sexp;;")
        (toplevel_responses
         ((OCaml "- : some_type = (44, [\"five\"; \"six\"])")))))))
    ((name 25)
     (chunks
      (((ocaml_code
          "module Make_interval(Endpoint : Comparable)\
         \n  : (Interval_intf with type endpoint := Endpoint.t) = struct\
         \n\
         \n  type t = | Interval of Endpoint.t * Endpoint.t\
         \n           | Empty\
         \n  [@@deriving sexp]\
         \n\
         \n  (** [create low high] creates a new interval from [low] to\
         \n      [high].  If [low > high], then the interval is empty *)\
         \n  let create low high =\
         \n    if Endpoint.compare low high > 0 then Empty\
         \n    else Interval (low,high)\
         \n\
         \n  (** Returns true iff the interval is empty *)\
         \n  let is_empty = function\
         \n    | Empty -> true\
         \n    | Interval _ -> false\
         \n\
         \n  (** [contains t x] returns true iff [x] is contained in the\
         \n      interval [t] *)\
         \n  let contains t x =\
         \n    match t with\
         \n    | Empty -> false\
         \n    | Interval (l,h) ->\
         \n      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0\
         \n\
         \n  (** [intersect t1 t2] returns the intersection of the two input\
         \n      intervals *)\
         \n  let intersect t1 t2 =\
         \n    let min x y = if Endpoint.compare x y <= 0 then x else y in\
         \n    let max x y = if Endpoint.compare x y >= 0 then x else y in\
         \n    match t1,t2 with\
         \n    | Empty, _ | _, Empty -> Empty\
         \n    | Interval (l1,h1), Interval (l2,h2) ->\
         \n      create (max l1 l2) (min h1 h2)\
         \n\
         \nend ;;")
        (toplevel_responses
         ((Raw
            "Characters 132-142:\
           \nError: Unbound value Endpoint.t_of_sexp")))))))
    ((name 26)
     (chunks
      (((ocaml_code
          "module type Interval_intf_with_sexp = sig\
         \n  include Interval_intf\
         \n  include Sexpable with type t := t\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module type Interval_intf_with_sexp =\
           \n  sig\
           \n    type t\
           \n    type endpoint\
           \n    val create : endpoint -> endpoint -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> endpoint -> bool\
           \n    val intersect : t -> t -> t\
           \n    val t_of_sexp : Sexp.t -> t\
           \n    val sexp_of_t : t -> Sexp.t\
           \n  end")))))))
    ((name 27)
     (chunks
      (((ocaml_code
          "module type Interval_intf_with_sexp = sig\
         \n  type t\
         \n  include Interval_intf with type t := t\
         \n  include Sexpable      with type t := t\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module type Interval_intf_with_sexp =\
           \n  sig\
           \n    type t\
           \n    type endpoint\
           \n    val create : endpoint -> endpoint -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> endpoint -> bool\
           \n    val intersect : t -> t -> t\
           \n    val t_of_sexp : Sexp.t -> t\
           \n    val sexp_of_t : t -> Sexp.t\
           \n  end")))))))
    ((name 28)
     (chunks
      (((ocaml_code
          "module Make_interval(Endpoint : sig\
         \n    type t\
         \n    include Comparable with type t := t\
         \n    include Sexpable   with type t := t\
         \n  end)\
         \n  : (Interval_intf_with_sexp with type endpoint := Endpoint.t)\
         \n= struct\
         \n\
         \n  type t = | Interval of Endpoint.t * Endpoint.t\
         \n           | Empty\
         \n  [@@deriving sexp]\
         \n\
         \n  (** [create low high] creates a new interval from [low] to\
         \n      [high].  If [low > high], then the interval is empty *)\
         \n  let create low high =\
         \n    if Endpoint.compare low high > 0 then Empty\
         \n    else Interval (low,high)\
         \n\
         \n  (* put a wrapper around the autogenerated [t_of_sexp] to enforce\
         \n     the invariants of the data structure *)\
         \n  let t_of_sexp sexp =\
         \n    match t_of_sexp sexp with\
         \n    | Empty -> Empty\
         \n    | Interval (x,y) -> create x y\
         \n\
         \n  (** Returns true iff the interval is empty *)\
         \n  let is_empty = function\
         \n    | Empty -> true\
         \n    | Interval _ -> false\
         \n\
         \n  (** [contains t x] returns true iff [x] is contained in the\
         \n      interval [t] *)\
         \n  let contains t x =\
         \n    match t with\
         \n    | Empty -> false\
         \n    | Interval (l,h) ->\
         \n      Endpoint.compare x l >= 0 && Endpoint.compare x h <= 0\
         \n\
         \n  (** [intersect t1 t2] returns the intersection of the two input\
         \n      intervals *)\
         \n  let intersect t1 t2 =\
         \n    let min x y = if Endpoint.compare x y <= 0 then x else y in\
         \n    let max x y = if Endpoint.compare x y >= 0 then x else y in\
         \n    match t1,t2 with\
         \n    | Empty, _ | _, Empty -> Empty\
         \n    | Interval (l1,h1), Interval (l2,h2) ->\
         \n      create (max l1 l2) (min h1 h2)\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Make_interval :\
           \n  functor\
           \n    (Endpoint : sig\
           \n                  type t\
           \n                  val compare : t -> t -> int\
           \n                  val t_of_sexp : Sexp.t -> t\
           \n                  val sexp_of_t : t -> Sexp.t\
           \n                end) ->\
           \n    sig\
           \n      type t\
           \n      val create : Endpoint.t -> Endpoint.t -> t\
           \n      val is_empty : t -> bool\
           \n      val contains : t -> Endpoint.t -> bool\
           \n      val intersect : t -> t -> t\
           \n      val t_of_sexp : Sexp.t -> t\
           \n      val sexp_of_t : t -> Sexp.t\
           \n    end")))))))
    ((name 29)
     (chunks
      (((ocaml_code "module Int_interval = Make_interval(Int) ;;")
        (toplevel_responses
         ((OCaml
            "module Int_interval :\
           \n  sig\
           \n    type t = Make_interval(Core_kernel__Core_int).t\
           \n    val create : int -> int -> t\
           \n    val is_empty : t -> bool\
           \n    val contains : t -> int -> bool\
           \n    val intersect : t -> t -> t\
           \n    val t_of_sexp : Sexp.t -> t\
           \n    val sexp_of_t : t -> Sexp.t\
           \n  end"))))
       ((ocaml_code "Int_interval.sexp_of_t (Int_interval.create 3 4);;")
        (toplevel_responses ((OCaml "- : Sexp.t = (Interval 3 4)"))))
       ((ocaml_code "Int_interval.sexp_of_t (Int_interval.create 4 3);;")
        (toplevel_responses ((OCaml "- : Sexp.t = Empty")))))))))
  (matched true)))
