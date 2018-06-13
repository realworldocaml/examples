(OCaml
 (((name "")
   (content
     "type 'a t\
    \ninclude (module type of Fqueue) with type 'a t := 'a t\
    \ninclude Foldable.Extension with type 'a t := 'a t"))))
