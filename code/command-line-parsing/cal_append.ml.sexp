(OCaml
 (((name 1)
   (content
     "let () =\
    \n  let common =\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> flag \"-d\" (optional_with_default false bool) ~doc:\" Debug mode\"\
    \n      +> flag \"-v\" (optional_with_default false bool) ~doc:\" Verbose output\"\
    \n    )\
    \n  in\
    \n  List.map ~f:(fun (name, cmd) -> (name, cmd ~common))\
    \n    [ \"add\", add; \"diff\", diff ]\
    \n  |> Command.group ~summary:\"Manipulate dates\"\
    \n  |> Command.run"))
  ((name "")
   (content
     "open Core\
    \n\
    \nlet add ~common =\
    \n  Command.basic ~summary:\"Add [days] to the [base] date\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> anon (\"base\" %: date)\
    \n      +> anon (\"days\" %: int)\
    \n      ++ common\
    \n    )\
    \n    (fun base span debug verbose () ->\
    \n       Date.add_days base span\
    \n       |> Date.to_string\
    \n       |> print_endline\
    \n    )\
    \n\
    \nlet diff ~common =\
    \n  Command.basic ~summary:\"Show days between [date2] and [date1]\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> anon (\"date1\" %: date)\
    \n      +> anon (\"date2\" %: date)\
    \n      ++ common\
    \n    )\
    \n    (fun date1 date2 debug verbose () ->\
    \n       Date.diff date1 date2\
    \n       |> printf \"%d days\\n\"\
    \n    )\
    \n\
    \n"))))
