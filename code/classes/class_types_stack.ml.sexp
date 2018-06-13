(OCaml
 (((name 2)
   (content
     "module VisibleStack : sig\
    \n  \
    \n  type 'a t = < pop: 'a option; push: 'a -> unit >\
    \n\
    \n  class ['a] stack : object\
    \n    val mutable v : 'a list\
    \n    method pop : 'a option\
    \n    method push : 'a -> unit\
    \n  end\
    \n\
    \n  val make : unit -> 'a t\
    \nend = Stack"))
  ((name 1)
   (content
     "module AbstractStack : sig\
    \n   type 'a t = < pop: 'a option; push: 'a -> unit >\
    \n\
    \n   val make : unit -> 'a t\
    \nend = Stack\
    \n\
    \n"))
  ((name "")
   (content
     "module Stack = struct\
    \n  class ['a] stack init = object\
    \n    ...    \
    \n  end\
    \n\
    \n  type 'a t = 'a stack\
    \n\
    \n  let make init = new stack init\
    \nend\
    \n\
    \n"))))
