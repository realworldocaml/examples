(OCaml
 (((name 1)
   (content
     "(* file: dictionary.mli *)\
    \nopen Core_kernel\
    \n\
    \ntype ('a, 'b) t\
    \n\
    \nval create : unit -> ('a, 'b) t\
    \nval length : ('a, 'b) t -> int\
    \nval add    : ('a, 'b) t -> key:'a -> data:'b -> unit\
    \nval find   : ('a, 'b) t -> 'a -> 'b option\
    \nval iter   : ('a, 'b) t -> f:(key:'a -> data:'b -> unit) -> unit\
    \nval remove : ('a, 'b) t -> 'a -> unit"))
  ((name "") (content "\n"))))
