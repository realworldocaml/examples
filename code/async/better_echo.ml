open Core
open Async

let run ~uppercase ~port =
  let host_and_port =
    Tcp.Server.create
      ~on_handler_error:`Raise
      (Tcp.Where_to_listen.of_port port)
      (fun _addr r w ->
         Pipe.transfer (Reader.pipe r) (Writer.pipe w)
           ~f:(if uppercase then String.uppercase else Fn.id))
  in
  ignore (host_and_port : (Socket.Address.Inet.t, int) Tcp.Server.t Deferred.t);
  Deferred.never ()

let () =
  let open Command.Let_syntax in
  Command.async
    ~summary:"Start an echo server"
    [%map_open
      let uppercase = flag "-uppercase" no_arg
          ~doc:" Convert to uppercase before echoing back"
      and port = flag "-port" (optional_with_default 8765 int)
          ~doc:" Port to listen on (default 8765)" in
      (fun () -> run ~uppercase ~port)
    ]
  |> Command.run
