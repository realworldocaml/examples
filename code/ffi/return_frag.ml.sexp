(OCaml
 (((name 3) (content "val curried : int -> (int -> int)"))
  ((name 2) (content  "val curried : int -> int -> int\
                     \n\
                     \n"))
  ((name 1)
   (content
     "(* incorrect types *)\
    \nval time: ptr time_t @-> time_t\
    \nval difftime: time_t @-> time_t @-> double\
    \n\
    \n"))
  ((name "")
   (content
     "(* correct types *)\
    \nval time: ptr time_t @-> returning time_t\
    \nval difftime: time_t @-> time_t @-> returning double\
    \n\
    \n"))))
