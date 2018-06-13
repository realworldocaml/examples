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
      (((ocaml_code "#require \"ctypes.foreign\" ;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/bytes: added to search path\
           \n/home/travis/.opam/4.04.2/lib/integers: added to search path\
           \n/home/travis/.opam/4.04.2/lib/integers/integers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/integers/integer_printers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes-top.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes-foreign-base.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes-foreign-threaded.cma: loaded"))))
       ((ocaml_code "#require \"ctypes.top\" ;;")
        (toplevel_responses
         ((Raw "/home/travis/.opam/4.04.2/lib/ctypes/ctypes-top.cma: loaded"))))
       ((ocaml_code "open Ctypes ;;") (toplevel_responses ()))
       ((ocaml_code "open PosixTypes ;;") (toplevel_responses ()))
       ((ocaml_code "open Foreign ;;") (toplevel_responses ()))
       ((ocaml_code
         "let time = foreign \"time\" (ptr time_t @-> returning time_t) ;;")
        (toplevel_responses
         ((OCaml "val time : time_t Ctypes_static.ptr -> time_t = <fun>")))))))
    ((name 1)
     (chunks
      (((ocaml_code "let cur_time = time (from_voidp time_t null) ;;")
        (toplevel_responses ((OCaml ...)))))))
    ((name 2)
     (chunks
      (((ocaml_code "let time' () = time (from_voidp time_t null) ;;")
        (toplevel_responses ((OCaml "val time' : unit -> time_t = <fun>")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "let difftime =\
         \n  foreign \"difftime\" (time_t @-> time_t @-> returning double) ;;")
        (toplevel_responses
         ((OCaml "val difftime : time_t -> time_t -> float = <fun>"))))
       ((ocaml_code
          "let t1 =\
         \n  time' () in\
         \nUnix.sleep 2;\
         \nlet t2 = time' () in\
         \ndifftime t2 t1 ;;")
        (toplevel_responses ((OCaml " ... ")))))))
    ((name 4)
     (chunks
      (((ocaml_code
         "let ctime = foreign \"ctime\" (ptr time_t @-> returning string) ;;")
        (toplevel_responses
         ((OCaml "val ctime : time_t Ctypes_static.ptr -> string = <fun>")))))))
    ((name 5)
     (chunks
      (((ocaml_code "ctime (time' ()) ;;")
        (toplevel_responses
         ((Raw
            "Characters 6-16:\
           \nError: This expression has type time_t but an expression was expected of type\
           \n         time_t Ctypes_static.ptr = (time_t, [ `C ]) pointer")))))))
    ((name 6)
     (chunks
      (((ocaml_code "let t_ptr = allocate time_t (time' ()) ;;")
        (toplevel_responses ((OCaml ...)))))))
    ((name 7)
     (chunks
      (((ocaml_code "ctime t_ptr ;;") (toplevel_responses ((OCaml ...)))))))
    ((name 8)
     (chunks
      (((ocaml_code "type timeval ;;")
        (toplevel_responses ((OCaml "type timeval"))))
       ((ocaml_code
         "let timeval : timeval structure typ = structure \"timeval\" ;;")
        (toplevel_responses
         ((OCaml "val timeval : timeval structure typ = struct timeval")))))))
    ((name 9)
     (chunks
      (((ocaml_code "let tv_sec  = field timeval \"tv_sec\" long ;;")
        (toplevel_responses
         ((OCaml
            "val tv_sec : (Signed.long, timeval structure) field =\
           \n  {Ctypes_static.ftype = long; foffset = 0; fname = \"tv_sec\"}"))))
       ((ocaml_code "let tv_usec = field timeval \"tv_usec\" long ;;")
        (toplevel_responses
         ((OCaml
            "val tv_usec : (Signed.long, timeval structure) field =\
           \n  {Ctypes_static.ftype = long; foffset = 8; fname = \"tv_usec\"}"))))
       ((ocaml_code "seal timeval ;;")
        (toplevel_responses ((OCaml "- : unit = ()")))))))
    ((name 10)
     (chunks
      (((ocaml_code "type timezone ;;")
        (toplevel_responses ((OCaml "type timezone"))))
       ((ocaml_code
         "let timezone : timezone structure typ = structure \"timezone\" ;;")
        (toplevel_responses
         ((OCaml "val timezone : timezone structure typ = struct timezone")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let gettimeofday = foreign \"gettimeofday\"\
         \n                     (ptr timeval @-> ptr timezone @-> returning_checking_errno int) ;;")
        (toplevel_responses
         ((Raw
            "Characters 97-121:\
           \nError: Unbound value returning_checking_errno")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let gettimeofday' () =\
         \n  let tv = make timeval in\
         \n  ignore(gettimeofday (addr tv) (from_voidp timezone null));\
         \n  let secs = Signed.Long.(to_int (getf tv tv_sec)) in\
         \n  let usecs = Signed.Long.(to_int (getf tv tv_usec)) in\
         \n  Pervasives.(float secs +. float usecs /. 1000000.0) ;;")
        (toplevel_responses
         ((Raw  "Characters 59-71:\
               \nError: Unbound value gettimeofday"))))
       ((ocaml_code "gettimeofday' () ;;")
        (toplevel_responses
         ((Raw  "Characters 0-13:\
               \nError: Unbound value gettimeofday'")))))))))
  (matched false)))
