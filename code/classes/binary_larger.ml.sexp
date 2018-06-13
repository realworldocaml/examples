(OCaml
 (((name "")
   (content
     "class square w = object(self) \
    \n  method width = w\
    \n  method area = Float.of_int (self#width * self#width)\
    \n  method larger other = self#area > other#area\
    \nend"))))
