(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet add_days ~base_date ~num_days () =\
    \n  Date.add_days base_date num_days\
    \n  |> Date.to_string\
    \n  |> print_endline\
    \n\
    \nlet add =\
    \n  Command.basic\
    \n    ~summary:\"Add [days] to the [base] date and print day\"\
    \n    Command.Spec.( \
    \n      step (fun m base days -> m ~base_date:base ~num_days:days)\
    \n      +> anon (\"base\" %: date)\
    \n      +> anon (\"days\" %: int)\
    \n    )\
    \n    add_days\
    \n\
    \nlet () = Command.run add"))))
