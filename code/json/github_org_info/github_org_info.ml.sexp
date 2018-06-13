(OCaml
 (((name "")
   (content
     "open Core\
    \n\
    \nlet print_org file () =\
    \n  let url = sprintf \"https://api.github.com/orgs/%s\" file in\
    \n  Core_extended.Shell.run_full \"curl\" [url]\
    \n  |> Github_org_j.org_of_string\
    \n  |> fun org ->\
    \n  let open Github_org_t in\
    \n  let name = Option.value ~default:\"???\" org.name in\
    \n  printf \"%s (%d) with %d public repos\\n\"\
    \n    name org.id org.public_repos\
    \n\
    \nlet () =\
    \n  Command.basic ~summary:\"Print Github organization information\"\
    \n    Command.Spec.(empty +> anon (\"organization\" %: string))\
    \n    print_org\
    \n  |> Command.run"))))
