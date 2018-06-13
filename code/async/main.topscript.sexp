(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#silent true;;") (toplevel_responses ()))
       ((ocaml_code "#use \"topfind\";;") (toplevel_responses ()))
       ((ocaml_code "#thread;;") (toplevel_responses ()))
       ((ocaml_code "#camlp4o;;") (toplevel_responses ()))
       ((ocaml_code "#require \"core\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"core.top\";;") (toplevel_responses ()))
       ((ocaml_code "#require \"ppx_jane\";;") (toplevel_responses ()))
       ((ocaml_code "#silent false;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code "open Core;;") (toplevel_responses ()))
       ((ocaml_code "In_channel.read_all;;")
        (toplevel_responses ((OCaml "- : string -> string = <fun>"))))
       ((ocaml_code
         "Out_channel.write_all \"test.txt\" ~data:\"This is only a test.\";;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "In_channel.read_all \"test.txt\";;")
        (toplevel_responses
         ((OCaml "- : string = \"This is only a test.\"")))))))
    ((name 3)
     (chunks
      (((ocaml_code "#silent true;;") (toplevel_responses ()))
       ((ocaml_code "#require \"async\";;") (toplevel_responses ()))
       ((ocaml_code "#silent false;;") (toplevel_responses ()))
       ((ocaml_code "open Async;;") (toplevel_responses ()))
       ((ocaml_code "Reader.file_contents;;")
        (toplevel_responses
         ((OCaml "- : string -> string Deferred.t = <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let contents = Reader.file_contents \"test.txt\";;")
        (toplevel_responses
         ((OCaml "val contents : string Deferred.t = <abstr>"))))
       ((ocaml_code "Deferred.peek contents;;")
        (toplevel_responses ((OCaml "- : string option = None")))))))
    ((name 5)
     (chunks
      (((ocaml_code "contents;;")
        (toplevel_responses
         ((OCaml "- : string = \"This is only a test.\"")))))))
    ((name 6)
     (chunks
      (((ocaml_code "Deferred.peek contents;;")
        (toplevel_responses
         ((OCaml "- : string option = Some \"This is only a test.\"")))))))
    ((name 7)
     (chunks
      (((ocaml_code "Deferred.bind ;;")
        (toplevel_responses
         ((OCaml
           "- : 'a Deferred.t -> f:('a -> 'b Deferred.t) -> 'b Deferred.t = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let uppercase_file filename =\
         \n  Deferred.bind (Reader.file_contents filename)\
         \n    (fun text ->\
         \n       Writer.save filename ~contents:(String.uppercase text))\
         \n;;")
        (toplevel_responses
         ((OCaml "val uppercase_file : string -> unit Deferred.t = <fun>"))))
       ((ocaml_code "uppercase_file \"test.txt\";;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "Reader.file_contents \"test.txt\";;")
        (toplevel_responses
         ((OCaml "- : string = \"THIS IS ONLY A TEST.\"")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let uppercase_file filename =\
         \n  Reader.file_contents filename\
         \n  >>= fun text ->\
         \n  Writer.save filename ~contents:(String.uppercase text)\
         \n;;")
        (toplevel_responses
         ((OCaml "val uppercase_file : string -> unit Deferred.t = <fun>")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "let count_lines filename =\
         \n  Reader.file_contents filename\
         \n  >>= fun text ->\
         \n  List.length (String.split text ~on:'\\n')\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 79-119:\
           \nError: This expression has type int but an expression was expected of type\
           \n         'a Deferred.t")))))))
    ((name 11)
     (chunks
      (((ocaml_code "return;;")
        (toplevel_responses ((OCaml "- : 'a -> 'a Deferred.t = <fun>"))))
       ((ocaml_code "let three = return 3;;")
        (toplevel_responses ((OCaml "val three : int Deferred.t = <abstr>"))))
       ((ocaml_code "three;;") (toplevel_responses ((OCaml "- : int = 3")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let count_lines filename =\
         \n  Reader.file_contents filename\
         \n  >>= fun text ->\
         \n  return (List.length (String.split text ~on:'\\n'))\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_lines : string -> int Deferred.t = <fun>")))))))
    ((name 12.1)
     (chunks
      (((ocaml_code
          "let count_lines filename =\
         \n  let%bind text = Reader.file_contents filename in\
         \n  return (List.length (String.split text ~on:'\\n'))\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_lines : string -> int Deferred.t = <fun>")))))))
    ((name 13)
     (chunks
      (((ocaml_code "Deferred.map;;")
        (toplevel_responses
         ((OCaml
           "- : 'a Deferred.t -> f:('a -> 'b) -> 'b Deferred.t = <fun>")))))))
    ((name 14)
     (chunks
      (((ocaml_code
          "let count_lines filename =\
         \n  Reader.file_contents filename\
         \n  >>| fun text ->\
         \n  List.length (String.split text ~on:'\\n')\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_lines : string -> int Deferred.t = <fun>"))))
       ((ocaml_code "count_lines \"/etc/hosts\";;")
        (toplevel_responses ((Raw "- : int = 10")))))))
    ((name 14.1)
     (chunks
      (((ocaml_code
          "let count_lines filename =\
         \n  let%map text = Reader.file_contents filename in\
         \n  List.length (String.split text ~on:'\\n')\
         \n;;")
        (toplevel_responses
         ((OCaml "val count_lines : string -> int Deferred.t = <fun>")))))))
    ((name 15)
     (chunks
      (((ocaml_code "let ivar = Ivar.create ();;")
        (toplevel_responses
         ((OCaml
            "val ivar : '_a Ivar.t =\
           \n  {Async_kernel__.Types.Ivar.cell = Async_kernel__Types.Cell.Empty}"))))
       ((ocaml_code "let def = Ivar.read ivar;;")
        (toplevel_responses ((OCaml "val def : '_a Deferred.t = <abstr>"))))
       ((ocaml_code "Deferred.peek def;;")
        (toplevel_responses ((OCaml "- : '_a option = None"))))
       ((ocaml_code "Ivar.fill ivar \"Hello\";;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "Deferred.peek def;;")
        (toplevel_responses ((OCaml "- : string option = Some \"Hello\"")))))))
    ((name 16)
     (chunks
      (((ocaml_code
          "module type Delayer_intf = sig\
         \n  type t\
         \n  val create : Time.Span.t -> t\
         \n  val schedule : t -> (unit -> 'a Deferred.t) -> 'a Deferred.t\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module type Delayer_intf =\
           \n  sig\
           \n    type t\
           \n    val create : Time.Span.t -> t\
           \n    val schedule : t -> (unit -> 'a Deferred.t) -> 'a Deferred.t\
           \n  end")))))))
    ((name 17)
     (chunks
      (((ocaml_code "upon;;")
        (toplevel_responses
         ((OCaml "- : 'a Deferred.t -> ('a -> unit) -> unit = <fun>")))))))
    ((name 18)
     (chunks
      (((ocaml_code
          "module Delayer : Delayer_intf = struct\
         \n  type t = { delay: Time.Span.t;\
         \n             jobs: (unit -> unit) Queue.t;\
         \n           }\
         \n\
         \n  let create delay =\
         \n    { delay; jobs = Queue.create () }\
         \n\
         \n  let schedule t thunk =\
         \n    let ivar = Ivar.create () in\
         \n    Queue.enqueue t.jobs (fun () ->\
         \n      upon (thunk ()) (fun x -> Ivar.fill ivar x));\
         \n    upon (after t.delay) (fun () ->\
         \n      let job = Queue.dequeue_exn t.jobs in\
         \n      job ());\
         \n    Ivar.read ivar\
         \nend;;")
        (toplevel_responses ((OCaml "module Delayer : Delayer_intf")))))))
    ((name 18.1)
     (chunks
      (((ocaml_code
          "let my_bind d ~f =\
         \n  let i = Ivar.create () in\
         \n  upon d (fun x -> upon (f x) (fun y -> Ivar.fill i y));\
         \n  Ivar.read i\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val my_bind : 'a Deferred.t -> f:('a -> 'b Deferred.t) -> 'b Deferred.t =\
           \n  <fun>")))))))
    ((name 19)
     (chunks
      (((ocaml_code "let rec loop_forever () = loop_forever ();;")
        (toplevel_responses
         ((OCaml "val loop_forever : unit -> 'a = <fun>"))))
       ((ocaml_code "let always_fail () = assert false;;")
        (toplevel_responses ((OCaml "val always_fail : unit -> 'a = <fun>")))))))
    ((name 20)
     (chunks
      (((ocaml_code
          "let do_stuff n =\
         \n  let x = 3 in\
         \n  if n > 0 then loop_forever ();\
         \n  x + n\
         \n;;")
        (toplevel_responses ((OCaml "val do_stuff : int -> int = <fun>")))))))
    ((name 21)
     (chunks
      (((ocaml_code
         "let rec loop_forever () : never_returns = loop_forever ();;")
        (toplevel_responses
         ((OCaml "val loop_forever : unit -> never_returns = <fun>")))))))
    ((name 22)
     (chunks
      (((ocaml_code
          "let do_stuff n =\
         \n  let x = 3 in\
         \n  if n > 0 then loop_forever ();\
         \n  x + n\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 48-63:\
           \nError: This expression has type never_returns = (unit, int) Base.Type_equal.t\
           \n       but an expression was expected of type unit")))))))
    ((name 23)
     (chunks
      (((ocaml_code "never_returns;;")
        (toplevel_responses ((OCaml "- : never_returns -> 'a = <fun>"))))
       ((ocaml_code
          "let do_stuff n =\
         \n  let x = 3 in\
         \n  if n > 0 then never_returns (loop_forever ());\
         \n  x + n\
         \n;;")
        (toplevel_responses ((OCaml "val do_stuff : int -> int = <fun>")))))))
    ((name 24)
     (chunks
      (((ocaml_code "let (r,w) = Pipe.create ();;")
        (toplevel_responses
         ((OCaml
            "val r : '_a Pipe.Reader.t = <abstr>\
           \nval w : '_a Pipe.Writer.t = <abstr>")))))))
    ((name 25)
     (chunks
      (((ocaml_code "let (r,w) = Pipe.create ();;")
        (toplevel_responses
         ((OCaml
            "val r : '_a Pipe.Reader.t = <abstr>\
           \nval w : '_a Pipe.Writer.t = <abstr>"))))
       ((ocaml_code "let write_complete = Pipe.write w \"Hello World!\";;")
        (toplevel_responses
         ((OCaml "val write_complete : unit Deferred.t = <abstr>"))))
       ((ocaml_code "Pipe.read r;;")
        (toplevel_responses
         ((OCaml "- : [ `Eof | `Ok of string ] = `Ok \"Hello World!\""))))
       ((ocaml_code "write_complete;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))
    ((name 26)
     (chunks
      (((ocaml_code "Pipe.transfer;;")
        (toplevel_responses
         ((OCaml
            "- : 'a Pipe.Reader.t -> 'b Pipe.Writer.t -> f:('a -> 'b) -> unit Deferred.t =\
           \n<fun>")))))))
    ((name 27)
     (chunks
      (((ocaml_code "Command.async;;")
        (toplevel_responses
         ((OCaml
            "- : ('a, unit Deferred.t) Async_extra.Command.basic_command\
           \n    Command.with_options\
           \n= <fun>")))))))
    ((name 28)
     (chunks
      (((ocaml_code "#silent true;;") (toplevel_responses ()))
       ((ocaml_code "#require \"cohttp.async\";;") (toplevel_responses ()))
       ((ocaml_code "#silent false;;") (toplevel_responses ()))
       ((ocaml_code "Cohttp_async.Client.get;;")
        (toplevel_responses
         ((OCaml
            "- : ?interrupt:unit Deferred.t ->\
           \n    ?ssl_config:Conduit_async_ssl.Ssl_config.config ->\
           \n    ?headers:Cohttp__Header.t ->\
           \n    Uri.t -> (Cohttp__Response.t * Cohttp_async__Body.t) Deferred.t\
           \n= <fun>")))))))
    ((name 29)
     (chunks
      (((ocaml_code "Deferred.all;;")
        (toplevel_responses
         ((OCaml
           "- : 'a Conduit_async.io list -> 'a list Conduit_async.io = <fun>")))))))
    ((name 30)
     (chunks
      (((ocaml_code "Deferred.all_unit;;")
        (toplevel_responses
         ((OCaml
           "- : unit Conduit_async.io list -> unit Conduit_async.io = <fun>")))))))
    ((name 31)
     (chunks
      (((ocaml_code
          "let maybe_raise =\
         \n  let should_fail = ref false in\
         \n  fun () ->\
         \n    let will_fail = !should_fail in\
         \n    should_fail := not will_fail;\
         \n    after (Time.Span.of_sec 0.5)\
         \n    >>= fun () ->\
         \n    if will_fail then raise Exit else return ()\
         \n;;")
        (toplevel_responses
         ((OCaml "val maybe_raise : unit -> unit Conduit_async.io = <fun>"))))
       ((ocaml_code "maybe_raise ();;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "maybe_raise ();;")
        (toplevel_responses
         ((Raw
           "Exception: (monitor.ml.Error Exit (\"Caught by monitor block_on_async\")).")))))))
    ((name 32)
     (chunks
      (((ocaml_code
          "let handle_error () =\
         \n  try\
         \n    maybe_raise ()\
         \n    >>| fun () -> \"success\"\
         \n  with _ -> return \"failure\"\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val handle_error : unit -> string Conduit_async.io = <fun>"))))
       ((ocaml_code "handle_error ();;")
        (toplevel_responses ((OCaml "- : string = \"success\""))))
       ((ocaml_code "handle_error ();;")
        (toplevel_responses
         ((Raw
           "Exception: (monitor.ml.Error Exit (\"Caught by monitor block_on_async\")).")))))))
    ((name 33)
     (chunks
      (((ocaml_code
          "let handle_error () =\
         \n  try_with (fun () -> maybe_raise ())\
         \n  >>| function\
         \n  | Ok ()   -> \"success\"\
         \n  | Error _ -> \"failure\"\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val handle_error : unit -> string Conduit_async.io = <fun>"))))
       ((ocaml_code "handle_error ();;")
        (toplevel_responses ((OCaml "- : string = \"success\""))))
       ((ocaml_code "handle_error ();;")
        (toplevel_responses ((OCaml "- : string = \"failure\"")))))))
    ((name 34)
     (chunks
      (((ocaml_code
          "let blow_up () =\
         \n  let monitor = Monitor.create ~name:\"blow up monitor\" () in\
         \n  within' ~monitor maybe_raise\
         \n;;")
        (toplevel_responses
         ((OCaml "val blow_up : unit -> unit Conduit_async.io = <fun>"))))
       ((ocaml_code "blow_up ();;")
        (toplevel_responses ((OCaml "- : unit = ()"))))
       ((ocaml_code "blow_up ();;")
        (toplevel_responses
         ((Raw
           "Exception: (monitor.ml.Error Exit (\"Caught by monitor blow up monitor\")).")))))))
    ((name 35)
     (chunks
      (((ocaml_code
          "let swallow_error () =\
         \n  let monitor = Monitor.create () in\
         \n  Stream.iter (Monitor.detach_and_get_error_stream monitor)\
         \n    ~f:(fun _exn -> printf \"an error happened\\n\");\
         \n  within' ~monitor (fun () ->\
         \n    after (Time.Span.of_sec 0.25)\
         \n    >>= fun () -> failwith \"Kaboom!\")\
         \n;;")
        (toplevel_responses
         ((OCaml "val swallow_error : unit -> 'a Conduit_async.io = <fun>")))))))
    ((name 35.5)
     (chunks
      (((ocaml_code
          "Deferred.any [ after (Time.Span.of_sec 0.5) \
         \n             ; swallow_error () ]\
         \n;;")
        (toplevel_responses
         ((Raw "an error happened") (OCaml "- : unit = ()")))))))
    ((name 36)
     (chunks
      (((ocaml_code "exception Ignore_me;;")
        (toplevel_responses ((OCaml "exception Ignore_me"))))
       ((ocaml_code
          "let swallow_some_errors exn_to_raise =\
         \n  let child_monitor  = Monitor.create  () in\
         \n  let parent_monitor = Monitor.current () in\
         \n  Stream.iter\
         \n    (Monitor.detach_and_get_error_stream child_monitor)\
         \n    ~f:(fun error ->\
         \n      match Monitor.extract_exn error with\
         \n      | Ignore_me -> printf \"ignoring exn\\n\"\
         \n      | _ -> Monitor.send_exn parent_monitor error);\
         \n  within' ~monitor:child_monitor (fun () ->\
         \n    after (Time.Span.of_sec 0.25)\
         \n    >>= fun () -> raise exn_to_raise)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val swallow_some_errors : exn -> 'a Conduit_async.io = <fun>")))))))
    ((name 37)
     (chunks
      (((ocaml_code
          "Deferred.any [ after (Time.Span.of_sec 0.5)\
         \n             ; swallow_some_errors Not_found ]\
         \n;;")
        (toplevel_responses
         ((Raw
           "Exception: (monitor.ml.Error Not_found (\"Caught by monitor (id 61)\")).")))))))
    ((name 38)
     (chunks
      (((ocaml_code
          "Deferred.any [ after (Time.Span.of_sec 0.5)\
         \n             ; swallow_some_errors Ignore_me ]\
         \n;;")
        (toplevel_responses ((Raw "ignoring exn") (OCaml "- : unit = ()")))))))
    ((name 39)
     (chunks
      (((ocaml_code
          "let string_and_float = Deferred.both\
         \n                         (after (sec 0.5)  >>| fun () -> \"A\")\
         \n                         (after (sec 0.25) >>| fun () -> 32.33);;")
        (toplevel_responses
         ((OCaml
           "val string_and_float : (string * float) Conduit_async.io = <abstr>"))))
       ((ocaml_code "string_and_float;;")
        (toplevel_responses ((OCaml "- : string * float = (\"A\", 32.33)")))))))
    ((name 40)
     (chunks
      (((ocaml_code
          "Deferred.any [ (after (sec 0.5) >>| fun () -> \"half a second\")\
         \n             ; (after (sec 10.) >>| fun () -> \"ten seconds\") ] ;;")
        (toplevel_responses ((OCaml "- : string = \"half a second\"")))))))
    ((name 41)
     (chunks
      (((ocaml_code "choice;;")
        (toplevel_responses
         ((OCaml
           "- : 'a Conduit_async.io -> ('a -> 'b) -> 'b Deferred.choice = <fun>"))))
       ((ocaml_code "choose;;")
        (toplevel_responses
         ((OCaml
           "- : 'a Deferred.choice list -> 'a Conduit_async.io = <fun>")))))))
    ((name 42)
     (chunks
      (((ocaml_code "let def = In_thread.run (fun () -> List.range 1 10);;")
        (toplevel_responses
         ((OCaml "val def : int list Conduit_async.io = <abstr>"))))
       ((ocaml_code "def;;")
        (toplevel_responses
         ((OCaml "- : int list = [1; 2; 3; 4; 5; 6; 7; 8; 9]")))))))
    ((name 43)
     (chunks
      (((ocaml_code
          "let log_delays thunk =\
         \n  let start = Time.now () in\
         \n  let print_time () =\
         \n    let diff = Time.diff (Time.now ()) start in\
         \n    printf \"%s, \" (Time.Span.to_string diff)\
         \n  in\
         \n  let d = thunk () in\
         \n  Clock.every (sec 0.1) ~stop:d print_time;\
         \n  d >>= fun () ->\
         \n  print_time ();\
         \n  printf \"\\n\";\
         \n  Writer.flushed (force Writer.stdout);\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val log_delays : (unit -> unit Conduit_async.io) -> unit Conduit_async.io =\
           \n  <fun>")))))))
    ((name 44)
     (chunks
      (((ocaml_code "log_delays (fun () -> after (sec 0.5));;")
        (toplevel_responses
         ((Raw
           "0.038147ms, 101.254ms, 201.826ms, 305.019ms, 410.269ms, 501.83ms, ")
          (OCaml "- : unit = ()")))))))
    ((name 45)
     (chunks
      (((ocaml_code
          "let busy_loop () =\
         \n  let x = ref None in\
         \n  for i = 1 to 100_000_000 do x := Some i done\
         \n;;")
        (toplevel_responses ((OCaml "val busy_loop : unit -> unit = <fun>"))))
       ((ocaml_code "log_delays (fun () -> return (busy_loop ()));;")
        (toplevel_responses ((Raw "2.12909s, ") (OCaml "- : unit = ()")))))))
    ((name 46)
     (chunks
      (((ocaml_code "log_delays (fun () -> In_thread.run busy_loop);;")
        (toplevel_responses
         ((Raw
           "0.0460148ms, 312.767ms, 415.486ms, 521.813ms, 631.633ms, 792.659ms, 896.126ms, 1.00168s, 1.10679s, 1.21284s, 1.31803s, 1.42162s, 1.52478s, 1.63463s, 1.7379s, 1.84361s, 1.95302s, 2.13509s, ")
          (OCaml "- : unit = ()")))))))
    ((name 47)
     (chunks
      (((ocaml_code
          "let noalloc_busy_loop () =\
         \n  for i = 0 to 100_000_000 do () done\
         \n;;")
        (toplevel_responses
         ((OCaml "val noalloc_busy_loop : unit -> unit = <fun>"))))
       ((ocaml_code
         "log_delays (fun () -> In_thread.run noalloc_busy_loop);;")
        (toplevel_responses
         ((Raw
           "0.0400543ms, 130.686ms, 239.836ms, 340.546ms, 443.258ms, 605.56ms, 710.801ms, 870.451ms, 980.326ms, 1.03697s, ")
          (OCaml "- : unit = ()")))))))))
  (matched true)))
