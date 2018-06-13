(OCaml
 (((name 2)
   (content
     "(* Call [run], and then start the scheduler *)\
    \nlet () =\
    \n  run ();\
    \n  never_returns (Scheduler.go ())"))
  ((name 1)
   (content
     "(** Starts a TCP server, which listens on the specified port, invoking\
    \n    copy_blocks every time a client connects. *)\
    \nlet run () =\
    \n  let host_and_port =\
    \n    Tcp.Server.create\
    \n      ~on_handler_error:`Raise\
    \n      (Tcp.on_port 8765)\
    \n      (fun _addr r w ->\
    \n         let buffer = String.create (16 * 1024) in\
    \n         copy_blocks buffer r w)\
    \n  in\
    \n  ignore (host_and_port : (Socket.Address.Inet.t, int) Tcp.Server.t Deferred.t)\
    \n\
    \n"))
  ((name "")
   (content
     "open Core\
    \nopen Async\
    \n\
    \n(* Copy data from the reader to the writer, using the provided buffer\
    \n   as scratch space *)\
    \nlet rec copy_blocks buffer r w =\
    \n  Reader.read r buffer\
    \n  >>= function\
    \n  | `Eof -> return ()\
    \n  | `Ok bytes_read ->\
    \n    Writer.write w buffer ~len:bytes_read;\
    \n    Writer.flushed w\
    \n    >>= fun () ->\
    \n    copy_blocks buffer r w\
    \n\
    \n"))))
