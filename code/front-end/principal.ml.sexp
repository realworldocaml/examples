(OCaml
 (((name "")
   (content
     "type s = { foo: int; bar: unit }\
    \ntype t = { foo: int }\
    \n\
    \nlet f (x:s) =\
    \n  x.bar;\
    \n  x.foo"))))
