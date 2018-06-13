(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \nopen Core_bench\
    \n\
    \nlet map_iter ~num_keys ~iterations =\
    \n  let rec loop i map =\
    \n    if i <= 0 then ()\
    \n    else loop (i - 1)\
    \n           (Map.change map (i mod num_keys) ~f:(fun current ->\
    \n              Some (1 + Option.value ~default:0 current)))\
    \n  in\
    \n  loop iterations Int.Map.empty\
    \n\
    \nlet table_iter ~num_keys ~iterations =\
    \n  let table = Int.Table.create ~size:num_keys () in\
    \n  let rec loop i =\
    \n    if i <= 0 then ()\
    \n    else (\
    \n      Hashtbl.change table (i mod num_keys) ~f:(fun current ->\
    \n        Some (1 + Option.value ~default:0 current));\
    \n      loop (i - 1)\
    \n    )\
    \n  in\
    \n  loop iterations\
    \n\
    \nlet tests ~num_keys ~iterations =\
    \n  let test name f = Bench.Test.create f ~name in\
    \n  [ test \"table\" (fun () -> table_iter ~num_keys ~iterations)\
    \n  ; test \"map\"   (fun () -> map_iter   ~num_keys ~iterations)\
    \n  ]\
    \n\
    \nlet () =\
    \n  tests ~num_keys:1000 ~iterations:100_000\
    \n  |> Bench.make_command\
    \n  |> Core.Command.run"))))
