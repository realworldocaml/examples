(OCaml
 (((name 1)
   (content
     "let () =\
    \n  let loader = Loader.create [(module Unique); (module List_dir)] in\
    \n  let loader_instance =\
    \n    (module struct\
    \n       module Query_handler = Loader\
    \n       let this = loader\
    \n     end : Query_handler_instance)\
    \n  in\
    \n  Hashtbl.set loader.Loader.active\
    \n    ~key:Loader.name ~data:loader_instance;\
    \n  cli loader.Loader.active"))
  ((name "") (content  "open Core_kernel\
                      \nopen Query_handler_core\
                      \n"))))
