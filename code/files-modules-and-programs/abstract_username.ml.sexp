(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nmodule Username : sig\
    \n  type t\
    \n  val of_string : string -> t\
    \n  val to_string : t -> string\
    \nend = struct\
    \n  type t = string\
    \n  let of_string x = x\
    \n  let to_string x = x\
    \nend"))))
