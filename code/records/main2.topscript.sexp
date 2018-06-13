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
       ((ocaml_code "open Core;;") (toplevel_responses ())))))
    ((name 17)
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
         \nmodule Heartbeat = struct\
         \n  type t =\
         \n    { session_id: string;\
         \n      time: Time_ns.t;\
         \n      status_message: string;\
         \n    }\
         \nend\
         \nmodule Logon = struct\
         \n  type t =\
         \n    { session_id: string;\
         \n      time: Time_ns.t;\
         \n      user: string;\
         \n      credentials: string;\
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
           \n  end\
           \nmodule Heartbeat :\
           \n  sig\
           \n    type t = {\
           \n      session_id : string;\
           \n      time : Time_ns.t;\
           \n      status_message : string;\
           \n    }\
           \n  end\
           \nmodule Logon :\
           \n  sig\
           \n    type t = {\
           \n      session_id : string;\
           \n      time : Time_ns.t;\
           \n      user : string;\
           \n      credentials : string;\
           \n    }\
           \n  end")))))))
    ((name 18)
     (chunks
      (((ocaml_code
          "let create_log_entry ~session_id ~important message =\
         \n  { Log_entry.time = Time_ns.now (); \
         \n    Log_entry.session_id; \
         \n    Log_entry.important; \
         \n    Log_entry.message\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create_log_entry :\
           \n  session_id:string -> important:bool -> string -> Log_entry.t = <fun>")))))))
    ((name 19)
     (chunks
      (((ocaml_code
          "let create_log_entry ~session_id ~important message =\
         \n  { Log_entry.\
         \n    time = Time_ns.now (); session_id; important; message }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create_log_entry :\
           \n  session_id:string -> important:bool -> string -> Log_entry.t = <fun>")))))))
    ((name 19.1)
     (chunks
      (((ocaml_code
          "let create_log_entry ~session_id ~important message : Log_entry.t =\
         \n  { time = Time_ns.now (); session_id; important; message }\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 70-127:\
           \nWarning 40: this record of type Log_entry.t contains fields that are \
           \nnot visible in the current scope: time session_id important message.\
           \nThey will not be selected if the type becomes unknown.")
          (OCaml
            "val create_log_entry :\
           \n  session_id:string -> important:bool -> string -> Log_entry.t = <fun>")))))))
    ((name 19.2)
     (chunks
      (((ocaml_code "#warnings \"-40\";;") (toplevel_responses ()))
       ((ocaml_code
          "let create_log_entry ~session_id ~important message : Log_entry.t =\
         \n  { time = Time_ns.now (); session_id; important; message }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create_log_entry :\
           \n  session_id:string -> important:bool -> string -> Log_entry.t = <fun>")))))))
    ((name 20)
     (chunks
      (((ocaml_code
          "let message_to_string { Log_entry.important; message; _ } =\
         \n  if important then String.uppercase message else message\
         \n;;")
        (toplevel_responses
         ((OCaml "val message_to_string : Log_entry.t -> string = <fun>")))))))
    ((name 21)
     (chunks
      (((ocaml_code "let is_important t = t.Log_entry.important;;")
        (toplevel_responses
         ((OCaml "val is_important : Log_entry.t -> bool = <fun>")))))))
    ((name 21.1)
     (chunks
      (((ocaml_code
          "let create_log_entry ~session_id ~important message : Log_entry.t =\
         \n  { time = Time_ns.now (); session_id; important; message }\
         \nlet message_to_string ({ important; message; _ } : Log_entry.t) =\
         \n  if important then String.uppercase message else message\
         \nlet is_important (t:Log_entry.t) = t.important ;;")
        (toplevel_responses
         ((OCaml
            "val create_log_entry :\
           \n  session_id:string -> important:bool -> string -> Log_entry.t = <fun>\
           \nval message_to_string : Log_entry.t -> string = <fun>\
           \nval is_important : Log_entry.t -> bool = <fun>")))))))
    ((name 22)
     (chunks
      (((ocaml_code
          "type client_info =\
         \n  { addr: Unix.Inet_addr.t;\
         \n    port: int;\
         \n    user: string;\
         \n    credentials: string;\
         \n    last_heartbeat_time: Time_ns.t;\
         \n  };;")
        (toplevel_responses
         ((OCaml
            "type client_info = {\
           \n  addr : Unix.inet_addr;\
           \n  port : int;\
           \n  user : string;\
           \n  credentials : string;\
           \n  last_heartbeat_time : Time_ns.t;\
           \n}"))))
       ((ocaml_code
          "let register_heartbeat t hb =\
         \n  { addr = t.addr;\
         \n    port = t.port;\
         \n    user = t.user;\
         \n    credentials = t.credentials;\
         \n    last_heartbeat_time = hb.Heartbeat.time;\
         \n  };;")
        (toplevel_responses
         ((OCaml
           "val register_heartbeat : client_info -> Heartbeat.t -> client_info = <fun>")))))))
    ((name 23)
     (chunks
      (((ocaml_code
          "let register_heartbeat t hb =\
         \n  { t with last_heartbeat_time = hb.Heartbeat.time };;")
        (toplevel_responses
         ((OCaml
           "val register_heartbeat : client_info -> Heartbeat.t -> client_info = <fun>")))))))
    ((name 24)
     (chunks
      (((ocaml_code
          "type client_info =\
         \n  { addr: Unix.Inet_addr.t;\
         \n    port: int;\
         \n    user: string;\
         \n    credentials: string;\
         \n    last_heartbeat_time: Time_ns.t;\
         \n    last_heartbeat_status: string;\
         \n  };;")
        (toplevel_responses
         ((OCaml
            "type client_info = {\
           \n  addr : Unix.inet_addr;\
           \n  port : int;\
           \n  user : string;\
           \n  credentials : string;\
           \n  last_heartbeat_time : Time_ns.t;\
           \n  last_heartbeat_status : string;\
           \n}")))))))
    ((name 25)
     (chunks
      (((ocaml_code
          "let register_heartbeat t hb =\
         \n  { t with last_heartbeat_time   = hb.Heartbeat.time;\
         \n           last_heartbeat_status = hb.Heartbeat.status_message;\
         \n  };;")
        (toplevel_responses
         ((OCaml
           "val register_heartbeat : client_info -> Heartbeat.t -> client_info = <fun>")))))))
    ((name 26)
     (chunks
      (((ocaml_code
          "type client_info =\
         \n  { addr: Unix.Inet_addr.t;\
         \n    port: int;\
         \n    user: string;\
         \n    credentials: string;\
         \n    mutable last_heartbeat_time: Time_ns.t;\
         \n    mutable last_heartbeat_status: string;\
         \n  };;")
        (toplevel_responses
         ((OCaml
            "type client_info = {\
           \n  addr : Unix.inet_addr;\
           \n  port : int;\
           \n  user : string;\
           \n  credentials : string;\
           \n  mutable last_heartbeat_time : Time_ns.t;\
           \n  mutable last_heartbeat_status : string;\
           \n}")))))))
    ((name 27)
     (chunks
      (((ocaml_code
          "let register_heartbeat t hb =\
         \n  t.last_heartbeat_time   <- hb.Heartbeat.time;\
         \n  t.last_heartbeat_status <- hb.Heartbeat.status_message\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val register_heartbeat : client_info -> Heartbeat.t -> unit = <fun>")))))))
    ((name 28)
     (chunks
      (((ocaml_code
          "let get_users logons =\
         \n  List.dedup (List.map logons ~f:(fun x -> x.Logon.user));;")
        (toplevel_responses
         ((OCaml "val get_users : Logon.t list -> string list = <fun>")))))))
    ((name 29)
     (chunks
      (((ocaml_code
          "module Logon = struct\
         \n  type t =\
         \n    { session_id: string;\
         \n      time: Time_ns.t;\
         \n      user: string;\
         \n     credentials: string;\
         \n    }\
         \n  [@@deriving fields]\
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
           \n    val credentials : t -> string\
           \n    val user : t -> string\
           \n    val time : t -> Time_ns.t\
           \n    val session_id : t -> string\
           \n    module Fields :\
           \n      sig\
           \n        val names : string list\
           \n        val credentials :\
           \n          ([< `Read | `Set_and_create ], t, string) Field.t_with_perm\
           \n        val user :\
           \n          ([< `Read | `Set_and_create ], t, string) Field.t_with_perm\
           \n        val time :\
           \n          ([< `Read | `Set_and_create ], t, Time_ns.t) Field.t_with_perm\
           \n...\
           \n      end\
           \n  end")))))))
    ((name 30)
     (chunks
      (((ocaml_code
         "let get_users logons = List.dedup (List.map logons ~f:Logon.user);;")
        (toplevel_responses
         ((OCaml "val get_users : Logon.t list -> string list = <fun>")))))))
    ((name 31)
     (chunks
      (((ocaml_code "Field.get Logon.Fields.user;;")
        (toplevel_responses ((OCaml "- : Logon.t -> string = <fun>")))))))
    ((name 32)
     (chunks
      (((ocaml_code "Field.get;;")
        (toplevel_responses
         ((OCaml "- : ('b, 'r, 'a) Field.t_with_perm -> 'r -> 'a = <fun>")))))))
    ((name 33)
     (chunks
      (((ocaml_code
          "let show_field field to_string record =\
         \n  let name = Field.name field in\
         \n  let field_string = to_string (Field.get field record) in\
         \n  name ^ \": \" ^ field_string\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val show_field :\
           \n  ('a, 'b, 'c) Field.t_with_perm -> ('c -> string) -> 'b -> string = <fun>")))))))
    ((name 34)
     (chunks
      (((ocaml_code
          "let logon = { Logon.\
         \n              session_id = \"26685\";\
         \n              time = Time_ns.of_string \"2017-07-21 10:11:45 EST\";\
         \n              user = \"yminsky\";\
         \n              credentials = \"Xy2d9W\"; }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val logon : Logon.t =\
           \n  {Logon.session_id = \"26685\"; time = 2017-07-21 15:11:45.000000Z;\
           \n   user = \"yminsky\"; credentials = \"Xy2d9W\"}"))))
       ((ocaml_code "show_field Logon.Fields.user Fn.id logon;;")
        (toplevel_responses ((OCaml "- : string = \"user: yminsky\""))))
       ((ocaml_code "show_field Logon.Fields.time Time_ns.to_string logon;;")
        (toplevel_responses ((OCaml ...)))))))
    ((name 35)
     (chunks
      (((ocaml_code "Logon.Fields.iter;;")
        (toplevel_responses
         ((OCaml
            "- : session_id:(([< `Read | `Set_and_create ], Logon.t, string)\
           \n                Field.t_with_perm -> unit) ->\
           \n    time:(([< `Read | `Set_and_create ], Logon.t, Time_ns.t)\
           \n          Field.t_with_perm -> unit) ->\
           \n    user:(([< `Read | `Set_and_create ], Logon.t, string) Field.t_with_perm ->\
           \n          unit) ->\
           \n    credentials:(([< `Read | `Set_and_create ], Logon.t, string)\
           \n                 Field.t_with_perm -> unit) ->\
           \n    unit\
           \n= <fun>")))))))
    ((name 36)
     (chunks
      (((ocaml_code
          "let print_logon logon =\
         \n  let print to_string field =\
         \n    printf \"%s\\n\" (show_field field to_string logon)\
         \n  in\
         \n  Logon.Fields.iter\
         \n    ~session_id:(print Fn.id)\
         \n    ~time:(print Time_ns.to_string)\
         \n    ~user:(print Fn.id)\
         \n    ~credentials:(print Fn.id)\
         \n;;")
        (toplevel_responses
         ((OCaml "val print_logon : Logon.t -> unit = <fun>"))))
       ((ocaml_code "print_logon logon;;")
        (toplevel_responses
         ((Raw
            "session_id: 26685\
           \n...\
           \nuser: yminsky\
           \ncredentials: Xy2d9W")
          (OCaml "- : unit = ()")))))))))
  (matched false)))
