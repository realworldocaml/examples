(OCaml
 (((name "")
   (content
     "open Core_kernel\
    \nopen Core_bench\
    \n\
    \nlet create_maps ~num_keys ~iterations =\
    \n  let rec loop i map =\
    \n    if i <= 0 then []\
    \n    else\
    \n      let new_map =\
    \n        Map.change map (i mod num_keys) ~f:(fun current ->\
    \n          Some (1 + Option.value ~default:0 current))\
    \n      in\
    \n      new_map :: loop (i - 1) new_map\
    \n  in\
    \n  loop iterations Int.Map.empty\
    \n\
    \nlet create_tables ~num_keys ~iterations =\
    \n  let table = Int.Table.create ~size:num_keys () in\
    \n  let rec loop i =\
    \n    if i <= 0 then []\
    \n    else (\
    \n      Hashtbl.change table (i mod num_keys) ~f:(fun current ->\
    \n        Some (1 + Option.value ~default:0 current));\
    \n      let new_table = Hashtbl.copy table in\
    \n      new_table :: loop (i - 1)\
    \n    )\
    \n  in\
    \n  loop iterations\
    \n\
    \nlet tests ~num_keys ~iterations =\
    \n  let test name f = Bench.Test.create f ~name in\
    \n  [ test \"table\" (fun () -> ignore (create_tables ~num_keys ~iterations))\
    \n  ; test \"map\"   (fun () -> ignore (create_maps   ~num_keys ~iterations))\
    \n  ]\
    \n\
    \nlet () =\
    \n  tests ~num_keys:50 ~iterations:1000\
    \n  |> Bench.make_command\
    \n  |> Core.Command.run"))))
