(OCaml
 (((name 1)
   (content
     "(** Represents the median computed from a set of strings.  In the case where\
    \n    there is an even number of choices, the one before and after the median is\
    \n    returned.  *)\
    \ntype median = | Median of string\
    \n              | Before_and_after of string * string\
    \n\
    \nval median : t -> median"))
  ((name "")
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
    \nval to_list : t -> (string * int) list\
    \n"))))
