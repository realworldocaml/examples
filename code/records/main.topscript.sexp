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
    ((name 0.5)
     (chunks
      (((ocaml_code "open Core_kernel;;") (toplevel_responses ()))
       ((ocaml_code "module Time_ns = Core_kernel.Time_ns;;")
        (toplevel_responses ((OCaml "module Time_ns = Core_kernel.Time_ns"))))
       ((ocaml_code
          "type service_info =\
         \n  { service_name : string;\
         \n    port         : int;\
         \n    protocol     : string;\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
           "type service_info = { service_name : string; port : int; protocol : string; }")))))))
    ((name 1)
     (chunks
      (((ocaml_code "#require \"re.posix\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/re: added to search path\
           \n/home/travis/.opam/4.04.2/lib/re/re.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/re/posix: added to search path\
           \n/home/travis/.opam/4.04.2/lib/re/posix/re_posix.cma: loaded"))))
       ((ocaml_code
          "let service_info_of_string line =\
         \n  let matches = \
         \n    Re.exec (Re_posix.compile_pat \"([a-zA-Z]+)[ \\t]+([0-9]+)/([a-zA-Z]+)\") line\
         \n  in\
         \n  { service_name = Re.get matches 1;\
         \n    port = Int.of_string (Re.get matches 2);\
         \n    protocol = Re.get matches 3;\
         \n  }\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 64-84:\
           \nWarning 3: deprecated: module Re_posix\
           \nUse Re.Posix")
          (OCaml
           "val service_info_of_string : string -> service_info = <fun>")))))))
    ((name 1.1)
     (chunks
      (((ocaml_code
          "let ssh = service_info_of_string\
         \n            \"ssh 22/udp # SSH Remote Login Protocol\";;")
        (toplevel_responses
         ((OCaml
           "val ssh : service_info = {service_name = \"ssh\"; port = 22; protocol = \"udp\"}")))))))
    ((name 2)
     (chunks
      (((ocaml_code "ssh.port;;")
        (toplevel_responses ((OCaml "- : int = 22")))))))
    ((name 3)
     (chunks
      (((ocaml_code "type 'a with_line_num = { item: 'a; line_num: int };;")
        (toplevel_responses
         ((OCaml "type 'a with_line_num = { item : 'a; line_num : int; }")))))))
    ((name 4)
     (chunks
      (((ocaml_code
          "let parse_lines parse file_contents =\
         \n  let lines = String.split ~on:'\\n' file_contents in\
         \n  List.mapi lines ~f:(fun line_num line ->\
         \n    { item = parse line;\
         \n      line_num = line_num + 1;\
         \n    })\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val parse_lines : (string -> 'a) -> string -> 'a with_line_num list = <fun>")))))))
    ((name 4.1)
     (chunks
      (((ocaml_code
          "parse_lines service_info_of_string\
         \n  {|rtmp              1/ddp     # Routing Table Maintenance Protocol\
         \n    tcpmux            1/udp     # TCP Port Service Multiplexer\
         \n    tcpmux            1/tcp     # TCP Port Service Multiplexer\
         \n  |}\
         \n;;")
        (toplevel_responses ((Raw "Exception: Not_found.")))))))
    ((name 4.2)
     (chunks
      (((ocaml_code "parse_lines Int.of_string \"1\\n10\\n100\\n1000\";;")
        (toplevel_responses
         ((OCaml
            "- : int with_line_num list =\
           \n[{item = 1; line_num = 1}; {item = 10; line_num = 2};\
           \n {item = 100; line_num = 3}; {item = 1000; line_num = 4}]")))))))
    ((name 4.3)
     (chunks
      (((ocaml_code "let s = \"A string!\";;")
        (toplevel_responses ((OCaml "val s : string = \"A string!\"")))))))
    ((name 4.4)
     (chunks
      (((ocaml_code "let s = {|A string!|};;")
        (toplevel_responses ((OCaml "val s : string = \"A string!\"")))))))
    ((name 4.5)
     (chunks
      (((ocaml_code "let s = \"\\\"A quoted string!\\\"\";;")
        (toplevel_responses
         ((OCaml "val s : string = \"\\\"A quoted string!\\\"\""))))
       ((ocaml_code "let () = print_endline s;;")
        (toplevel_responses ((Raw "\"A quoted string!\"")))))))
    ((name 4.6)
     (chunks
      (((ocaml_code "let s = \"\\\"A quoted string!\\\"\";;")
        (toplevel_responses
         ((OCaml "val s : string = \"\\\"A quoted string!\\\"\""))))
       ((ocaml_code "let () = print_endline s;;")
        (toplevel_responses ((Raw "\"A quoted string!\"")))))))
    ((name 4.7)
     (chunks
      (((ocaml_code
          "let s = print_endline {|\
         \nIt's possible to put something\
         \nhere that spans multiple lines|};;")
        (toplevel_responses
         ((Raw
            "It's possible to put something\
           \nhere that spans multiple lines")
          (OCaml "val s : unit = ()")))))))
    ((name 4.8)
     (chunks
      (((ocaml_code
          "let s = print_endline {x|\
         \nOCaml has multiple kinds of quotations,\
         \nincluding \", and {| and |}\
         \n|x};;")
        (toplevel_responses
         ((Raw
            "OCaml has multiple kinds of quotations,\
           \nincluding \", and {| and |}\
           \n")
          (OCaml "val s : unit = ()")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "let service_info_to_string { service_name = name; port = port; protocol = prot  } =\
         \n  sprintf \"%s %i/%s\" name port prot\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val service_info_to_string : service_info -> string = <fun>"))))
       ((ocaml_code "service_info_to_string ssh;;")
        (toplevel_responses ((OCaml "- : string = \"ssh 22/udp\"")))))))
    ((name 6)
     (chunks
      (((ocaml_code
          "type service_info =\
         \n  { service_name : string;\
         \n    port         : int;\
         \n    protocol     : string;\
         \n    comment      : string option;\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type service_info = {\
           \n  service_name : string;\
           \n  port : int;\
           \n  protocol : string;\
           \n  comment : string option;\
           \n}")))))))
    ((name 7)
     (chunks
      (((ocaml_code "#warnings \"+9\";;") (toplevel_responses ()))
       ((ocaml_code
          "let service_info_to_string { service_name = name; port = port; protocol = prot  } =\
         \n  sprintf \"%s %i/%s\" name port prot\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 27-81:\
           \nWarning 9: the following labels are not bound in this record pattern:\
           \ncomment\
           \nEither bind these labels explicitly or add '; _' to the pattern.")
          (OCaml
           "val service_info_to_string : service_info -> string = <fun>")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let host_info_to_string { service_name = name; port = port; protocol = prot; _ } =\
         \n  sprintf \"%s %i/%s\" name port prot\
         \n;;")
        (toplevel_responses
         ((OCaml "val host_info_to_string : service_info -> string = <fun>")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let service_info_to_string { service_name; port; protocol; comment } =\
         \n  let base = sprintf \"%s %i/%s\" service_name port protocol in\
         \n  match comment with\
         \n  | None -> base\
         \n  | Some text -> base ^ \" #\" ^ text\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val service_info_to_string : service_info -> string = <fun>")))))))
    ((name 10)
     (chunks
      (((ocaml_code
          "let service_info_of_string line =\
         \n  (* first, split off any comment *)\
         \n  let (line,comment) =\
         \n    match String.rsplit2 line ~on:'#' with\
         \n    | None -> (line,None)\
         \n    | Some (ordinary,comment) -> (ordinary, Some comment)\
         \n  in\
         \n  (* now, use a regular expression to break up the service definition *)\
         \n  let matches = \
         \n    Re.exec (Re_posix.compile_pat \"([a-zA-Z]+)[ \\t]+([0-9]+)/([a-zA-Z]+)\") line\
         \n  in\
         \n  let service_name = Re.get matches 1 in\
         \n  let port = Int.of_string (Re.get matches 2) in\
         \n  let protocol = Re.get matches 3 in\
         \n  { service_name; port; protocol; comment }\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 329-349:\
           \nWarning 3: deprecated: module Re_posix\
           \nUse Re.Posix")
          (OCaml
           "val service_info_of_string : string -> service_info = <fun>")))))))
    ((name 10.1)
     (chunks
      (((ocaml_code "service_info_of_string \"ssh 22/tcp # some comment\";;")
        (toplevel_responses
         ((OCaml
            "- : service_info =\
           \n{service_name = \"ssh\"; port = 22; protocol = \"tcp\";\
           \n comment = Some \" some comment\"}"))))
       ((ocaml_code "service_info_of_string \"ssh 22/tcp\";;")
        (toplevel_responses
         ((OCaml
            "- : service_info =\
           \n{service_name = \"ssh\"; port = 22; protocol = \"tcp\"; comment = None}")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let create_service_info ~service_name ~port ~protocol ~comment =\
         \n  { service_name; port; protocol; comment }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create_service_info :\
           \n  service_name:string ->\
           \n  port:int -> protocol:string -> comment:string option -> service_info =\
           \n  <fun>")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let create_service_info\
         \n      ~service_name:service_name ~port:port\
         \n      ~protocol:protocol ~comment:comment =\
         \n  { service_name = service_name;\
         \n    port = port; \
         \n    protocol = protocol; \
         \n    comment = comment;\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val create_service_info :\
           \n  service_name:string ->\
           \n  port:int -> protocol:string -> comment:string option -> service_info =\
           \n  <fun>")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "type log_entry =\
         \n  { session_id: string;\
         \n    time: Time_ns.t;\
         \n    important: bool;\
         \n    message: string;\
         \n  }\
         \ntype heartbeat =\
         \n  { session_id: string;\
         \n    time: Time_ns.t;\
         \n    status_message: string;\
         \n  }\
         \ntype logon =\
         \n  { session_id: string;\
         \n    time: Time_ns.t;\
         \n    user: string;\
         \n    credentials: string;\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
            "type log_entry = {\
           \n  session_id : string;\
           \n  time : Time_ns.t;\
           \n  important : bool;\
           \n  message : string;\
           \n}\
           \ntype heartbeat = {\
           \n  session_id : string;\
           \n  time : Time_ns.t;\
           \n  status_message : string;\
           \n}\
           \ntype logon = {\
           \n  session_id : string;\
           \n  time : Time_ns.t;\
           \n  user : string;\
           \n  credentials : string;\
           \n}")))))))
    ((name 14)
     (chunks
      (((ocaml_code "let get_session_id t = t.session_id;;")
        (toplevel_responses
         ((OCaml "val get_session_id : logon -> string = <fun>")))))))
    ((name 15)
     (chunks
      (((ocaml_code
         "let get_heartbeat_session_id (t:heartbeat) = t.session_id;;")
        (toplevel_responses
         ((OCaml
           "val get_heartbeat_session_id : heartbeat -> string = <fun>")))))))
    ((name 16)
     (chunks
      (((ocaml_code
         "let status_and_session t = (t.status_message, t.session_id);;")
        (toplevel_responses
         ((OCaml
           "val status_and_session : heartbeat -> string * string = <fun>"))))
       ((ocaml_code
         "let session_and_status t = (t.session_id, t.status_message);;")
        (toplevel_responses
         ((Raw
            "Characters 44-58:\
           \nError: This expression has type logon\
           \n       The field status_message does not belong to type logon"))))
       ((ocaml_code
         "let session_and_status (t:heartbeat) = (t.session_id, t.status_message);;")
        (toplevel_responses
         ((OCaml
           "val session_and_status : heartbeat -> string * string = <fun>")))))))))
  (matched false)))
