(OCaml
 (((name "")
   (content
     "(*TODO: Check contents*)\
    \nlet concat_and_print x y =\
    \n  let v = x ^ y in\
    \n  print_endline v;\
    \n  v\
    \n\
    \nlet add_and_print x y =\
    \n  let v = x + y in\
    \n  print_endline (string_of_int v);\
    \n  v\
    \n\
    \nlet () =\
    \n  let _x = add_and_print 1 2 in\
    \n  let _y = concat_and_print \"a\" \"b\" in\
    \n  ()"))))
