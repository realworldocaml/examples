(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Core_bench\
    \n\
    \nlet simple_computation () =\
    \n  List.range 0 10\
    \n  |> List.fold ~init:0 ~f:(fun sum x -> sum + x * x)\
    \n  |> ignore\
    \n\
    \nlet simple_with_handler () =\
    \n  try simple_computation () with Exit -> ()\
    \n\
    \nlet end_with_exn () =\
    \n  try\
    \n    simple_computation ();\
    \n    raise Exit\
    \n  with Exit -> ()\
    \n\
    \nlet end_with_exn_notrace () =\
    \n  try\
    \n    simple_computation ();\
    \n    Exn.raise_without_backtrace Exit\
    \n  with Exit -> ()\
    \n\
    \nlet () =\
    \n  [ Bench.Test.create ~name:\"simple computation\"\
    \n      (fun () -> simple_computation ());\
    \n    Bench.Test.create ~name:\"simple computation w/handler\"\
    \n      (fun () -> simple_with_handler ());\
    \n    Bench.Test.create ~name:\"end with exn\"\
    \n      (fun () -> end_with_exn ());\
    \n    Bench.Test.create ~name:\"end with exn notrace\"\
    \n      (fun () -> end_with_exn_notrace ());\
    \n  ]\
    \n  |> Bench.make_command\
    \n  |> Command.run"))))
