(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Core_bench\
    \n\
    \nlet polymorphic_compare () =\
    \n  let cmp a b = if a > b then a else b in\
    \n  for i = 0 to 1000 do\
    \n    ignore(cmp 0 i)\
    \n  done\
    \n\
    \nlet monomorphic_compare () =\
    \n  let cmp (a:int) (b:int) =\
    \n    if a > b then a else b in\
    \n  for i = 0 to 1000 do\
    \n    ignore(cmp 0 i)\
    \n  done\
    \n\
    \nlet tests =\
    \n  [ \"Polymorphic comparison\", polymorphic_compare;\
    \n    \"Monomorphic comparison\", monomorphic_compare ]\
    \n\
    \nlet () =\
    \n  List.map tests ~f:(fun (name,test) -> Bench.Test.create ~name test)\
    \n  |> Bench.make_command\
    \n  |> Command.run"))))
