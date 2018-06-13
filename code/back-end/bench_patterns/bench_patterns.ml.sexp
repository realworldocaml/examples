(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Core_bench\
    \n\
    \ntype t = | Alice | Bob\
    \ntype s = | A | B | C | D | E\
    \n\
    \nlet polymorphic_pattern () =\
    \n  let test v =\
    \n    match v with\
    \n    | `Alice   -> 100\
    \n    | `Bob     -> 101\
    \n    | `Charlie -> 102\
    \n    | `David   -> 103\
    \n    | `Eve     -> 104\
    \n  in\
    \n  List.iter ~f:(fun v -> ignore(test v))\
    \n    [`Alice; `Bob; `Charlie; `David]\
    \n\
    \nlet monomorphic_pattern_small () =\
    \n  let test v =\
    \n    match v with\
    \n    | Alice   -> 100\
    \n    | Bob     -> 101 in\
    \n  List.iter ~f:(fun v -> ignore(test v))\
    \n    [ Alice; Bob ]\
    \n\
    \nlet monomorphic_pattern_large () =\
    \n  let test v =\
    \n    match v with\
    \n    | A       -> 100\
    \n    | B       -> 101\
    \n    | C       -> 102\
    \n    | D       -> 103\
    \n    | E       -> 104\
    \n  in\
    \n  List.iter ~f:(fun v -> ignore(test v))\
    \n    [ A; B; C; D ]\
    \n\
    \nlet tests = [\
    \n  \"Polymorphic pattern\", polymorphic_pattern;\
    \n  \"Monomorphic larger pattern\", monomorphic_pattern_large;\
    \n  \"Monomorphic small pattern\", monomorphic_pattern_small;\
    \n]\
    \n\
    \nlet () =\
    \n  List.map tests ~f:(fun (name,test) -> Bench.Test.create ~name test)\
    \n  |> Bench.make_command\
    \n  |> Command.run"))))
