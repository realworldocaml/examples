(OCaml
 (((name "")
   (content
     "type 'a t\
    \n\
    \nval empty : 'a t\
    \n\
    \n(** [enqueue q el] adds [el] to the back of [q] *)\
    \nval enqueue : 'a t -> 'a -> 'a t\
    \n\
    \n(** [dequeue q] returns None if the [q] is empty, otherwise returns\
    \n    the first element of the queue and the remainder of the queue *)\
    \nval dequeue : 'a t -> ('a * 'a t) option\
    \n\
    \n(** Folds over the queue, from front to back *)\
    \nval fold : 'a t -> init:'acc -> f:('acc -> 'a -> 'acc) -> 'acc"))))
