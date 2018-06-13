(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Async\
    \n\
    \nlet attach_finalizer n v =\
    \n  match Heap_block.create v with\
    \n  | None -> printf \"%20s: FAIL\\n%!\" n\
    \n  | Some hb ->\
    \n    let final _ = printf \"%20s: OK\\n%!\" n in\
    \n    Gc.add_finalizer hb final\
    \n\
    \ntype t = { foo: bool }\
    \n\
    \nlet main () =\
    \n  let alloced_float = Unix.gettimeofday () in\
    \n  let alloced_bool = alloced_float > 0.0 in\
    \n  let alloced_string = String.create 4 in\
    \n  attach_finalizer \"immediate int\" 1;\
    \n  attach_finalizer \"immediate float\" 1.0;\
    \n  attach_finalizer \"immediate variant\" (`Foo \"hello\");\
    \n  attach_finalizer \"immediate string\" \"hello world\";\
    \n  attach_finalizer \"immediate record\" { foo=false };\
    \n  attach_finalizer \"allocated bool\" alloced_bool;\
    \n  attach_finalizer \"allocated variant\" (`Foo alloced_bool);\
    \n  attach_finalizer \"allocated string\" alloced_string;\
    \n  attach_finalizer \"allocated record\" { foo=alloced_bool };\
    \n  Gc.compact ();\
    \n  return ()\
    \n\
    \nlet () =\
    \n  Command.async ~summary:\"Testing finalizers\"\
    \n    Command.Spec.empty main\
    \n  |> Command.run"))))
