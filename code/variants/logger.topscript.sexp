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
       ((ocaml_code "#silent false;;") (toplevel_responses ()))
       ((ocaml_code "#warnings \"-40\";;") (toplevel_responses ()))
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code "module Time_ns = Core_kernel.Time_ns;;")
        (toplevel_responses ((OCaml "module Time_ns = Core_kernel.Time_ns")))))))
    ((name 1)
     (chunks
      (((ocaml_code
          "module Log_entry = struct\
         \n  type t =\
         \n    { session_id: string;\
         \n      time: Time_ns.t;\
         \n      important: bool;\
         \n      message: string;\
         \n    }\
         \nend\
         \n;;")
        (toplevel_responses
         ((OCaml
            "module Log_entry :\
           \n  sig\
           \n    type t = {\
           \n      session_id : string;\
           \n      time : Time_ns.t;\
           \n      important : bool;\
           \n      message : string;\
           \n    }\
           \n  end")))))))
    ((name 1.5)
     (chunks
      (((ocaml_code
          "module Heartbeat = struct\
         \n  type t =\
         \n    { session_id: string;\
         \n      time: Time_ns.t;\
         \n      status_message: string;\
         \n    }\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Heartbeat :\
           \n  sig\
           \n    type t = {\
           \n      session_id : string;\
           \n      time : Time_ns.t;\
           \n      status_message : string;\
           \n    }\
           \n  end"))))
       ((ocaml_code
          "module Logon = struct\
         \n  type t =\
         \n    { session_id: string;\
         \n      time: Time_ns.t;\
         \n      user: string;\
         \n      credentials: string;\
         \n    }\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Logon :\
           \n  sig\
           \n    type t = {\
           \n      session_id : string;\
           \n      time : Time_ns.t;\
           \n      user : string;\
           \n      credentials : string;\
           \n    }\
           \n  end")))))))
    ((name 2)
     (chunks
      (((ocaml_code
          "type client_message = | Logon of Logon.t\
         \n                      | Heartbeat of Heartbeat.t\
         \n                      | Log_entry of Log_entry.t\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type client_message =\
           \n    Logon of Logon.t\
           \n  | Heartbeat of Heartbeat.t\
           \n  | Log_entry of Log_entry.t")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let messages_for_user user messages =\
         \n  let (user_messages,_) =\
         \n    List.fold messages ~init:([],String.Set.empty)\
         \n      ~f:(fun ((messages,user_sessions) as acc) message ->\
         \n        match message with\
         \n        | Logon m ->\
         \n          if m.user = user then\
         \n            (message::messages, Set.add user_sessions m.session_id)\
         \n          else acc\
         \n        | Heartbeat _ | Log_entry _ ->\
         \n          let session_id = match message with\
         \n            | Logon     m -> m.session_id\
         \n            | Heartbeat m -> m.session_id\
         \n            | Log_entry m -> m.session_id\
         \n          in\
         \n          if Set.mem user_sessions session_id then\
         \n            (message::messages,user_sessions)\
         \n          else acc\
         \n      )\
         \n  in\
         \n  List.rev user_messages\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val messages_for_user : string -> client_message list -> client_message list =\
           \n  <fun>")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "module Log_entry = struct\
         \n  type t = { important: bool;\
         \n             message: string;\
         \n           }\
         \nend;;")
        (toplevel_responses
         ((OCaml
           "module Log_entry : sig type t = { important : bool; message : string; } end"))))
       ((ocaml_code
          "module Heartbeat = struct\
         \n  type t = { status_message: string; }\
         \nend;;")
        (toplevel_responses
         ((OCaml
           "module Heartbeat : sig type t = { status_message : string; } end"))))
       ((ocaml_code
          "module Logon = struct\
         \n  type t = { user: string;\
         \n             credentials: string;\
         \n           }\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "module Logon : sig type t = { user : string; credentials : string; } end")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "type details =\
         \n  | Logon of Logon.t\
         \n  | Heartbeat of Heartbeat.t\
         \n  | Log_entry of Log_entry.t\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type details =\
           \n    Logon of Logon.t\
           \n  | Heartbeat of Heartbeat.t\
           \n  | Log_entry of Log_entry.t")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "module Common = struct\
         \n  type t = { session_id: string;\
         \n             time: Time_ns.t;\
         \n           }\
         \nend ;;")
        (toplevel_responses
         ((OCaml
           "module Common : sig type t = { session_id : string; time : Time_ns.t; } end")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "let messages_for_user user (messages : (Common.t * details) list) =\
         \n  let (user_messages,_) =\
         \n    List.fold messages ~init:([],String.Set.empty)\
         \n      ~f:(fun ((messages,user_sessions) as acc) ((common,details) as message) ->\
         \n        match details with\
         \n        | Logon m ->\
         \n          if m.user = user then\
         \n            (message::messages, Set.add user_sessions common.session_id)\
         \n          else acc\
         \n        | Heartbeat _ | Log_entry _ ->\
         \n          if Set.mem user_sessions common.session_id then\
         \n            (message::messages, user_sessions)\
         \n          else acc\
         \n      )\
         \n  in\
         \n  List.rev user_messages\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val messages_for_user :\
           \n  string -> (Common.t * details) list -> (Common.t * details) list = <fun>")))))))
    ((name 7.9)
     (chunks
      (((ocaml_code "type server_state;;")
        (toplevel_responses ((OCaml "type server_state"))))
       ((ocaml_code
         "let handle_log_entry (_:server_state) ((_:Common.t),_) = ();;")
        (toplevel_responses
         ((OCaml
           "val handle_log_entry : server_state -> Common.t * 'a -> unit = <fun>"))))
       ((ocaml_code "let handle_logon _ (_,_) = ();;")
        (toplevel_responses
         ((OCaml "val handle_logon : 'a -> 'b * 'c -> unit = <fun>"))))
       ((ocaml_code "let handle_heartbeat _ (_,_) = ();;")
        (toplevel_responses
         ((OCaml "val handle_heartbeat : 'a -> 'b * 'c -> unit = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let handle_message server_state (common,details) =\
         \n  match details with\
         \n  | Log_entry m -> handle_log_entry server_state (common,m)\
         \n  | Logon     m -> handle_logon     server_state (common,m)\
         \n  | Heartbeat m -> handle_heartbeat server_state (common,m)\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val handle_message : server_state -> Common.t * details -> unit = <fun>")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "type details =\
         \n  | Logon     of { user: string; credentials: string; }\
         \n  | Heartbeat of { status_message: string; }\
         \n  | Log_entry of { important: bool; message: string; }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type details =\
           \n    Logon of { user : string; credentials : string; }\
           \n  | Heartbeat of { status_message : string; }\
           \n  | Log_entry of { important : bool; message : string; }")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "let messages_for_user user (messages : (Common.t * details) list) =\
         \n  let (user_messages,_) =\
         \n    List.fold messages ~init:([],String.Set.empty)\
         \n      ~f:(fun ((messages,user_sessions) as acc) ((common,details) as message) ->\
         \n        match details with\
         \n        | Logon m ->\
         \n          if m.user = user then\
         \n            (message::messages, Set.add user_sessions common.session_id)\
         \n          else acc\
         \n        | Heartbeat _ | Log_entry _ ->\
         \n          if Set.mem user_sessions common.session_id then\
         \n            (message::messages, user_sessions)\
         \n          else acc\
         \n      )\
         \n  in\
         \n  List.rev user_messages\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val messages_for_user :\
           \n  string -> (Common.t * details) list -> (Common.t * details) list = <fun>")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let get_logon_contents = function\
         \n  | Logon m -> Some m\
         \n  | _ -> None\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 54-55:\
           \nError: This form is not allowed as the type of the inlined record could escape.")))))))))
  (matched true)))
