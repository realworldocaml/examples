(OCaml
 (((name 1)
   (content
     "val to_basic : json -> Yojson.Basic.json\
    \n(** Tuples are converted to JSON arrays, Variants are converted to\
    \n    JSON strings or arrays of a string (constructor) and a json value\
    \n    (argument). Long integers are converted to JSON strings.\
    \n    Examples:\
    \n\
    \n    `Tuple [ `Int 1; `Float 2.3 ]   ->    `List [ `Int 1; `Float 2.3 ]\
    \n    `Variant (\"A\", None)            ->    `String \"A\"\
    \n    `Variant (\"B\", Some x)          ->    `List [ `String \"B\", x ]\
    \n    `Intlit \"12345678901234567890\"  ->    `String \"12345678901234567890\"\
    \n *)"))
  ((name "")
   (content
     "type json = [\
    \n  | `Assoc of (string * json) list\
    \n  | `Bool of bool\
    \n  | `Float of float\
    \n  | `Floatlit of string\
    \n  | `Int of int\
    \n  | `Intlit of string\
    \n  | `List of json list\
    \n  | `Null\
    \n  | `String of string\
    \n  | `Stringlit of string\
    \n  | `Tuple of json list\
    \n  | `Variant of string * json option\
    \n]\
    \n\
    \n"))))
