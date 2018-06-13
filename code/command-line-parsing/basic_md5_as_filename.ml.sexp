(OCaml
 (((name 1)
   (content
     "let command =\
    \n  Command.basic\
    \n    ~summary:\"Generate an MD5 hash of the input data\"\
    \n    ~readme:(fun () -> \"More detailed information\")\
    \n    Command.Spec.(empty +> anon (\"filename\" %: file))\
    \n    do_hash\
    \n\
    \nlet () =\
    \n  Command.run ~version:\"1.0\" ~build_info:\"RWO\" command"))
  ((name "") (content "\n"))))
