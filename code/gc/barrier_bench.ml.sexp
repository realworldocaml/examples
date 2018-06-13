(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Core_bench\
    \n\
    \ntype t1 = { mutable iters1: int; mutable count1: float }\
    \ntype t2 = { iters2: int; count2: float }\
    \n\
    \nlet rec test_mutable t1 =\
    \n  match t1.iters1 with\
    \n  |0 -> ()\
    \n  |_ ->\
    \n    t1.iters1 <- t1.iters1 - 1;\
    \n    t1.count1 <- t1.count1 +. 1.0;\
    \n    test_mutable t1\
    \n\
    \nlet rec test_immutable t2 =\
    \n  match t2.iters2 with\
    \n  |0 -> ()\
    \n  |n ->\
    \n    let iters2 = n - 1 in\
    \n    let count2 = t2.count2 +. 1.0 in\
    \n    test_immutable { iters2; count2 }\
    \n\
    \nlet () =\
    \n  let iters = 1000000 in\
    \n  let tests = [\
    \n    Bench.Test.create ~name:\"mutable\" \
    \n      (fun () -> test_mutable { iters1=iters; count1=0.0 });\
    \n    Bench.Test.create ~name:\"immutable\"\
    \n      (fun () -> test_immutable { iters2=iters; count2=0.0 })\
    \n  ] in\
    \n  Bench.make_command tests |> Command.run"))))
