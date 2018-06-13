(OCaml
 (((name "")
   (content
     "(* file: dlist.mli *)\
    \nopen Core_kernel\
    \n\
    \ntype 'a t\
    \ntype 'a element\
    \n\
    \n(** Basic list operations  *)\
    \nval create   : unit -> 'a t\
    \nval is_empty : 'a t -> bool\
    \n\
    \n(** Navigation using [element]s *)\
    \nval first : 'a t -> 'a element option\
    \nval next  : 'a element -> 'a element option\
    \nval prev  : 'a element -> 'a element option\
    \nval value : 'a element -> 'a\
    \n\
    \n(** Whole-data-structure iteration *)\
    \nval iter    : 'a t -> f:('a -> unit) -> unit\
    \nval find_el : 'a t -> f:('a -> bool) -> 'a element option\
    \n\
    \n(** Mutation *)\
    \nval insert_first : 'a t -> 'a -> 'a element\
    \nval insert_after : 'a element -> 'a -> 'a element\
    \nval remove : 'a t -> 'a element -> unit"))))
