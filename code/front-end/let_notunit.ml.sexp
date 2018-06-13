(OCaml
 (((name "")
   (content
     "let (_:some_type) = <expr>\
    \nlet () = ignore (<expr> : some_type)\
    \n)(* if the expression returns a unit Deferred.t *)\
    \nlet () = don't_wait_for (<expr>"))))
