(OCaml
 (((name 5)
   (content
     "module Array : sig\
    \n  type 'a t = 'a array\
    \n\
    \n  val get : 'a t -> int -> 'a\
    \n  val set : 'a t -> int -> 'a -> unit\
    \n  val of_list : 'a typ -> 'a list -> 'a t\
    \n  val to_list : 'a t -> 'a list\
    \n  val length : 'a t -> int\
    \n  val start : 'a t -> 'a ptr\
    \n  val from_ptr : 'a ptr -> int -> 'a t\
    \n  val make : 'a typ -> ?initial:'a -> int -> 'a t\
    \nend"))
  ((name 4) (content  "val string    : string.typ\
                     \n\
                     \n"))
  ((name 3)
   (content
     "val string_of_char_ptr : char ptr -> string\
    \nval char_ptr_of_string : string -> char ptr\
    \n\
    \n"))
  ((name 2)
   (content
     "val view :\
    \n  read:('a -> 'b) ->\
    \n  write:('b -> 'a) ->\
    \n  'a typ -> 'b typ\
    \n\
    \n"))
  ((name 1)
   (content
     "val void      : unit typ\
    \nval char      : char typ\
    \nval schar     : int typ\
    \nval short     : int typ\
    \nval int       : int typ\
    \nval long      : long typ\
    \nval llong     : llong typ\
    \nval nativeint : nativeint typ\
    \n\
    \nval int8_t    : int typ\
    \nval int16_t   : int typ\
    \nval int32_t   : int32 typ\
    \nval int64_t   : int64 typ\
    \nval uchar     : uchar typ\
    \nval uchar     : uchar typ\
    \nval uint8_t   : uint8 typ\
    \nval uint16_t  : uint16 typ\
    \nval uint32_t  : uint32 typ\
    \nval uint64_t  : uint64 typ\
    \nval size_t    : size_t typ\
    \nval ushort    : ushort typ\
    \nval uint      : uint typ\
    \nval ulong     : ulong typ\
    \nval ullong    : ullong typ\
    \n\
    \nval float     : float typ\
    \nval double    : float typ\
    \n\
    \nval complex32 : Complex.t typ\
    \nval complex64 : Complex.t typ\
    \n\
    \n"))
  ((name "") (content  "type 'a typ\
                      \n\
                      \n"))))
