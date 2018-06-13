(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet add_days base span () =\
    \n  Date.add_days base span\
    \n  |> Date.to_string\
    \n  |> print_endline\
    \n\
    \nlet add =\
    \n  Command.basic\
    \n    ~summary:\"Add [days] to the [base] date and print day\"\
    \n    Command.Spec.(\
    \n      step\
    \n        (fun m base days ->\
    \n           match days with\
    \n           | Some days ->\
    \n             m base days\
    \n           | None ->\
    \n             print_endline \"enter days: \";\
    \n             Int.of_string In_channel.(input_line_exn stdin)\
    \n             |> m base\
    \n        )\
    \n      +> anon (\"base\" %: date)\
    \n      +> anon (maybe (\"days\" %: int))\
    \n    )\
    \n    add_days\
    \n\
    \nlet () = Command.run add"))))
