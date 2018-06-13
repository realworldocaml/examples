(Other
  "$ cat A.ml\
 \nlet v = \"hello\"\
 \n$ cat B.ml\
 \nlet w = 42\
 \n$ cat _tags\
 \n<*.cmx> and not \"X.cmx\": for-pack(X)\
 \n$ cat X.mlpack\
 \nA\
 \nB\
 \n")
