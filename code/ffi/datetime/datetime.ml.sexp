(OCaml
 (((name "")
   (content
     "open Core\
    \nopen Ctypes\
    \nopen PosixTypes\
    \nopen Foreign\
    \n\
    \nlet time     = foreign \"time\" (ptr time_t @-> returning time_t)\
    \nlet difftime = foreign \"difftime\" (time_t @-> time_t @-> returning double)\
    \nlet ctime    = foreign \"ctime\" (ptr time_t @-> returning string)\
    \n\
    \ntype timeval\
    \nlet timeval : timeval structure typ = structure \"timeval\"\
    \nlet tv_sec   = field timeval \"tv_sec\" long\
    \nlet tv_usec  = field timeval \"tv_usec\" long\
    \nlet ()       = seal timeval\
    \n\
    \ntype timezone\
    \nlet timezone : timezone structure typ = structure \"timezone\"\
    \n\
    \nlet gettimeofday = foreign \"gettimeofday\" ~check_errno:true\
    \n    (ptr timeval @-> ptr timezone @-> returning int)\
    \n\
    \nlet time' () = time (from_voidp time_t null)\
    \n\
    \nlet gettimeofday' () =\
    \n  let tv = make timeval in\
    \n  ignore(gettimeofday (addr tv) (from_voidp timezone null));\
    \n  let secs = Signed.Long.(to_int (getf tv tv_sec)) in\
    \n  let usecs = Signed.Long.(to_int (getf tv tv_usec)) in\
    \n  Pervasives.(float secs +. float usecs /. 1_000_000.)\
    \n\
    \nlet float_time () = printf \"%f%!\\n\" (gettimeofday' ())\
    \n\
    \nlet ascii_time () =\
    \n  let t_ptr = allocate time_t (time' ()) in\
    \n  printf \"%s%!\" (ctime t_ptr)\
    \n\
    \nlet () =\
    \n  let open Command in\
    \n  basic ~summary:\"Display the current time in various formats\"\
    \n    Spec.(empty +> flag \"-a\" no_arg ~doc:\" Human-readable output format\")\
    \n    (fun human -> if human then ascii_time else float_time)\
    \n  |> Command.run"))))
