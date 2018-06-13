(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Async\
    \n\
    \nlet run ~uppercase ~port =\
    \n  let host_and_port =\
    \n    Tcp.Server.create\
    \n      ~on_handler_error:`Raise\
    \n      (Tcp.on_port port)\
    \n      (fun _addr r w ->\
    \n        Pipe.transfer (Reader.pipe r) (Writer.pipe w)\
    \n           ~f:(if uppercase then String.uppercase else Fn.id))\
    \n  in\
    \n  ignore (host_and_port : (Socket.Address.Inet.t, int) Tcp.Server.t Deferred.t);\
    \n  Deferred.never ()\
    \n\
    \nlet () =\
    \n  Command.async\
    \n    ~summary:\"Start an echo server\"\
    \n    Command.Spec.(\
    \n      empty\
    \n      +> flag \"-uppercase\" no_arg\
    \n        ~doc:\" Convert to uppercase before echoing back\"\
    \n      +> flag \"-port\" (optional_with_default 8765 int)\
    \n        ~doc:\" Port to listen on (default 8765)\"\
    \n    )\
    \n    (fun uppercase port () -> run ~uppercase ~port)\
    \n  |> Command.run"))))
