(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \n\
    \n(* Include the interface of the list module from Core *)\
    \ninclude (module type of List)\
    \n\
    \n(* Signature of function we're adding *)\
    \nval intersperse : 'a list -> 'a -> 'a list"))))
