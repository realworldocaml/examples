(OCaml
 (((name 1)
   (content
     "val from_string : ?buf:Bi_outbuf.t -> ?fname:string -> ?lnum:int ->\
    \n   string -> json\
    \n(* Read a JSON value from a string.\
    \n   [buf]   : use this buffer at will during parsing instead of\
    \n             creating a new one. \
    \n   [fname] : data file name to be used in error messages. It does not \
    \n             have to be a real file. \
    \n   [lnum]  : number of the first line of input. Default is 1. *)\
    \n\
    \nval from_file : ?buf:Bi_outbuf.t -> ?fname:string -> ?lnum:int -> \
    \n   string -> json\
    \n(* Read a JSON value from a file. See [from_string] for the meaning of the optional\
    \n   arguments. *)\
    \n\
    \nval from_channel : ?buf:Bi_outbuf.t -> ?fname:string -> ?lnum:int ->\
    \n  in_channel -> json\
    \n  (** Read a JSON value from a channel.\
    \n      See [from_string] for the meaning of the optional arguments. *)"))
  ((name "")
   (content
     "type json = [\
    \n  | `Assoc of (string * json) list\
    \n  | `Bool of bool\
    \n  | `Float of float\
    \n  | `Int of int\
    \n  | `List of json list\
    \n  | `Null\
    \n  | `String of string\
    \n]\
    \n\
    \n"))))
