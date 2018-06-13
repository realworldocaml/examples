(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet add =\
    \n  Command.basic ~summary:\"Add [days] to the [base] date\"\
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
    \nlet diff =\
    \n  Command.basic ~summary:\"Show days between [date1] and [date2]\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> anon (\"date1\" %: date)\
    \n      +> anon (\"date2\" %: date)\
    \n    )\
    \n    (fun date1 date2 () ->\
    \n       Date.diff date1 date2\
    \n       |> printf \"%d days\\n\"\
    \n    )\
    \n\
    \nlet command =\
    \n  Command.group ~summary:\"Manipulate dates\"\
    \n    [ \"add\", add; \"diff\", diff ]\
    \n\
    \nlet () = Command.run command"))))
