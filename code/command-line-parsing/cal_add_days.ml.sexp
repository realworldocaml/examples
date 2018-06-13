(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet add =\
    \n  Command.basic\
    \n    ~summary:\"Add [days] to the [base] date and print day\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> anon (\"base\" %: date)\
    \n      +> anon (\"days\" %: int)\
    \n    )\
    \n    (fun base span () ->\
    \n       Date.add_days base span\
    \n       |> Date.to_string\
    \n       |> print_endline\
    \n    )\
    \n\
    \nlet () = Command.run add"))))
