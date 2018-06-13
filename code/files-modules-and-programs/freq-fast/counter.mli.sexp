(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \n(** A collection of string frequency counts *)\
    \ntype t\
    \n\
    \n(** The empty set of frequency counts  *)\
    \nval empty : t\
    \n\
    \n(** Bump the frequency count for the given string. *)\
    \nval touch : t -> string -> t\
    \n\
    \n(** Converts the set of frequency counts to an association list.\
    \n    Every string in the list will show up at most once, and the\
    \n    integers will be at least 1. *)\
    \nval to_list : t -> (string * int) list"))))
