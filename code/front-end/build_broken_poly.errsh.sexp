(Other
  "$ ocamlc -c broken_poly.ml\
 \nFile \"broken_poly.ml\", line 9, characters 10-154:\
 \nError: This expression has type\
 \n         [> `Add of\
 \n              ([< `Add of 'a * 'a\
 \n                | `Mul of 'a * 'a\
 \n                | `Num of int\
 \n                | `Sub of 'a * 'a\
 \n                > `Num ]\
 \n               as 'a) *\
 \n              [> `Sub of 'a * [> `Mul of [> `Nu of int ] * [> `Num of int ] ] ] ]\
 \n       but an expression was expected of type\
 \n         [< `Add of 'a * 'a | `Mul of 'a * 'a | `Num of int | `Sub of 'a * 'a\
 \n          > `Num ]\
 \n         as 'a\
 \n       The second variant type does not allow tag(s) `Nu\
 \n")
