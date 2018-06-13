(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#use \"topfind\";;")
        (toplevel_responses
         ((OCaml "- : unit = ()")
          (Raw
            "Findlib has been successfully loaded. Additional directives:\
           \n  #require \"package\";;      to load a package\
           \n  #list;;                   to list the available packages\
           \n  #camlp4o;;                to load camlp4 (standard syntax)\
           \n  #camlp4r;;                to load camlp4 (revised syntax)\
           \n  #predicates \"p,q,...\";;   to set these predicates\
           \n  Topfind.reset();;         to force that packages will be reloaded\
           \n  #thread;;                 to enable threads\
           \n")
          (OCaml "- : unit = ()"))))
       ((ocaml_code "#thread;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ocaml/threads: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ocaml/threads/threads.cma: loaded"))))
       ((ocaml_code "#camlp4o;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ocaml/dynlink.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ocaml/camlp4: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ocaml/camlp4/camlp4o.cma: loaded\
           \nCannot find file /home/travis/.opam/4.04.2/lib/ocaml/camlp4/camlp4o.cma."))))
       ((ocaml_code "#require \"core\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/base/caml: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/caml/caml.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/base/shadow_stdlib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/shadow_stdlib/shadow_stdlib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib/0: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/base.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/fieldslib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/fieldslib/fieldslib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib/ppx_compare_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/variantslib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/variantslib/variantslib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/shape: added to search path\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/shape/bin_shape_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/bin_prot: added to search path\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/bin_prot.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib/ppx_hash_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/config: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/config/inline_test_config.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib/ppx_inline_test_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests/base_for_tests.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/jane-street-headers: added to search path\
           \n/home/travis/.opam/4.04.2/lib/jane-street-headers/jane_street_headers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ocaml/nums.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/num-top: added to search path\
           \n/home/travis/.opam/4.04.2/lib/num-top/num_top.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/num: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib/ppx_assert_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib/ppx_bench_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/common: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/common/expect_test_common.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/config: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/config/expect_test_config.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/collector: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/collector/expect_test_collector.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/stdio: added to search path\
           \n/home/travis/.opam/4.04.2/lib/stdio/stdio.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/typerep: added to search path\
           \n/home/travis/.opam/4.04.2/lib/typerep/typerep_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_kernel: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/core_kernel.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib/unix: added to search path\
           \n/home/travis/.opam/4.04.2/lib/sexplib/unix/sexplib_unix.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/spawn: added to search path\
           \n/home/travis/.opam/4.04.2/lib/spawn/spawn.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core/core.cma: loaded"))))
       ((ocaml_code "#require \"ppx_jane\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ppx_jane: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_jane/./ppx.exe --as-ppx: activated"))))
       ((ocaml_code "#install_printer Core.Sexp.pp_hum;;")
        (toplevel_responses ()))
       ((ocaml_code "#install_printer Core.Error.pp;;")
        (toplevel_responses ()))
       ((ocaml_code "open Core_kernel;;") (toplevel_responses ())))))
    ((name 0.5)
     (chunks
      (((ocaml_code
          "module type Query_handler = sig\
         \n\
         \n  (** Configuration for a query handler.  Note that this can be\
         \n      converted to and from an s-expression *)\
         \n  type config [@@deriving sexp]\
         \n\
         \n  (** The name of the query-handling service *)\
         \n  val name : string\
         \n\
         \n  (** The state of the query handler *)\
         \n  type t\
         \n\
         \n  (** Creates a new query handler from a config *)\
         \n  val create : config -> t\
         \n\
         \n  (** Evaluate a given query, where both input and output are\
         \n      s-expressions *)\
         \n  val eval : t -> Sexp.t -> Sexp.t Or_error.t\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module type Query_handler =\
           \n  sig\
           \n    type config\
           \n    val config_of_sexp : Sexp.t -> config\
           \n    val sexp_of_config : config -> Sexp.t\
           \n    val name : string\
           \n    type t\
           \n    val create : config -> t\
           \n    val eval : t -> Sexp.t -> Sexp.t Or_error.t\
           \n  end")))))))
    ((name 1)
     (chunks
      (((ocaml_code "module type M = sig type t [@@deriving sexp] end;;")
        (toplevel_responses
         ((OCaml
            "module type M =\
           \n  sig type t val t_of_sexp : Sexp.t -> t val sexp_of_t : t -> Sexp.t end")))))))
    ((name 2)
     (chunks
      (((ocaml_code "type u = { a: int; b: float } [@@deriving sexp];;")
        (toplevel_responses
         ((OCaml
            "type u = { a : int; b : float; }\
           \nval u_of_sexp : Sexp.t -> u = <fun>\
           \nval sexp_of_u : u -> Sexp.t = <fun>"))))
       ((ocaml_code "sexp_of_u {a=3;b=7.};;")
        (toplevel_responses ((OCaml "- : Sexp.t = ((a 3) (b 7))"))))
       ((ocaml_code "u_of_sexp (Sexp.of_string \"((a 43) (b 3.4))\");;")
        (toplevel_responses ((OCaml "- : u = {a = 43; b = 3.4}")))))))
    ((name 3)
     (chunks
      (((ocaml_code
          "module Unique = struct\
         \n  type config = int [@@deriving sexp]\
         \n  type t = { mutable next_id: int }\
         \n\
         \n  let name = \"unique\"\
         \n  let create start_at = { next_id = start_at }\
         \n\
         \n  let eval t sexp =\
         \n    match Or_error.try_with (fun () -> unit_of_sexp sexp) with\
         \n    | Error _ as err -> err\
         \n    | Ok () ->\
         \n      let response = Ok (Int.sexp_of_t t.next_id) in\
         \n      t.next_id <- t.next_id + 1;\
         \n      response\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module Unique :\
           \n  sig\
           \n    type config = int\
           \n    val config_of_sexp : Sexp.t -> config\
           \n    val sexp_of_config : config -> Sexp.t\
           \n    type t = { mutable next_id : config; }\
           \n    val name : string\
           \n    val create : config -> t\
           \n    val eval : t -> Sexp.t -> (Sexp.t, Error.t) result\
           \n  end")))))))
    ((name 4)
     (chunks
      (((ocaml_code "let unique = Unique.create 0;;")
        (toplevel_responses
         ((OCaml "val unique : Unique.t = {Unique.next_id = 0}"))))
       ((ocaml_code "Unique.eval unique Sexp.unit;;")
        (toplevel_responses ((OCaml "- : (Sexp.t, Error.t) result = Ok 0"))))
       ((ocaml_code "Unique.eval unique Sexp.unit;;")
        (toplevel_responses ((OCaml "- : (Sexp.t, Error.t) result = Ok 1")))))))
    ((name 5)
     (chunks
      (((ocaml_code
          "module List_dir = struct\
         \n  type config = string [@@deriving sexp]\
         \n  type t = { cwd: string }\
         \n\
         \n  (** [is_abs p] Returns true if [p] is an absolute path  *)\
         \n  let is_abs p =\
         \n    String.length p > 0 && p.[0] = '/'\
         \n\
         \n  let name = \"ls\"\
         \n  let create cwd = { cwd }\
         \n\
         \n  let eval t sexp =\
         \n    match Or_error.try_with (fun () -> string_of_sexp sexp) with\
         \n    | Error _ as err -> err\
         \n    | Ok dir ->\
         \n      let dir =\
         \n        if is_abs dir then dir\
         \n        else Filename.concat t.cwd dir\
         \n      in\
         \n      Ok (Array.sexp_of_t String.sexp_of_t (Sys.readdir dir))\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module List_dir :\
           \n  sig\
           \n    type config = string\
           \n    val config_of_sexp : Sexp.t -> config\
           \n    val sexp_of_config : config -> Sexp.t\
           \n    type t = { cwd : config; }\
           \n    val is_abs : config -> bool\
           \n    val name : config\
           \n    val create : config -> t\
           \n    val eval : t -> Sexp.t -> (Sexp.t, Error.t) result\
           \n  end")))))))
    ((name 6)
     (chunks
      (((ocaml_code "let list_dir = List_dir.create \"/var\";;")
        (toplevel_responses
         ((OCaml "val list_dir : List_dir.t = {List_dir.cwd = \"/var\"}"))))
       ((ocaml_code "List_dir.eval list_dir (sexp_of_string \".\");;")
        (toplevel_responses
         ((OCaml
            "- : (Sexp.t, Error.t) result =\
           \nOk (backups cache lib local lock log mail opt run spool tmp crash)"))))
       ((ocaml_code "List_dir.eval list_dir (sexp_of_string \"yp\");;")
        (toplevel_responses
         ((Raw
           "Exception: Sys_error \"/var/yp: No such file or directory\".")))))))
    ((name 7)
     (chunks
      (((ocaml_code
          "module type Query_handler_instance = sig\
         \n  module Query_handler : Query_handler\
         \n  val this : Query_handler.t\
         \nend;;")
        (toplevel_responses
         ((OCaml
            "module type Query_handler_instance =\
           \n  sig module Query_handler : Query_handler val this : Query_handler.t end")))))))
    ((name 8)
     (chunks
      (((ocaml_code
          "let unique_instance =\
         \n  (module struct\
         \n    module Query_handler = Unique\
         \n    let this = Unique.create 0\
         \n  end : Query_handler_instance);;")
        (toplevel_responses
         ((OCaml
           "val unique_instance : (module Query_handler_instance) = <module>")))))))
    ((name 9)
     (chunks
      (((ocaml_code
          "let build_instance\
         \n      (type a)\
         \n      (module Q : Query_handler with type config = a)\
         \n      config\
         \n  =\
         \n  (module struct\
         \n    module Query_handler = Q\
         \n    let this = Q.create config\
         \n  end : Query_handler_instance)\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val build_instance :\
           \n  (module Query_handler with type config = 'a) ->\
           \n  'a -> (module Query_handler_instance) = <fun>")))))))
    ((name 10)
     (chunks
      (((ocaml_code
         "let unique_instance = build_instance (module Unique) 0;;")
        (toplevel_responses
         ((OCaml
           "val unique_instance : (module Query_handler_instance) = <module>"))))
       ((ocaml_code
         "let list_dir_instance = build_instance (module List_dir)  \"/var\";;")
        (toplevel_responses
         ((OCaml
           "val list_dir_instance : (module Query_handler_instance) = <module>")))))))
    ((name 11)
     (chunks
      (((ocaml_code
          "let build_dispatch_table handlers =\
         \n  let table = String.Table.create () in\
         \n  List.iter handlers\
         \n    ~f:(fun ((module I : Query_handler_instance) as instance) ->\
         \n      Hashtbl.set table ~key:I.Query_handler.name ~data:instance);\
         \n  table\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val build_dispatch_table :\
           \n  (module Query_handler_instance) list ->\
           \n  (module Query_handler_instance) String.Table.t = <fun>")))))))
    ((name 12)
     (chunks
      (((ocaml_code
          "let dispatch dispatch_table name_and_query =\
         \n  match name_and_query with\
         \n  | Sexp.List [Sexp.Atom name; query] ->\
         \n    begin match Hashtbl.find dispatch_table name with\
         \n    | None ->\
         \n      Or_error.error \"Could not find matching handler\"\
         \n        name String.sexp_of_t\
         \n    | Some (module I : Query_handler_instance) ->\
         \n      I.Query_handler.eval I.this query\
         \n    end\
         \n  | _ ->\
         \n    Or_error.error_string \"malformed query\"\
         \n;;")
        (toplevel_responses
         ((OCaml
            "val dispatch :\
           \n  (string, (module Query_handler_instance)) Hashtbl.t ->\
           \n  Sexp.t -> Sexp.t Or_error.t = <fun>")))))))
    ((name 13)
     (chunks
      (((ocaml_code
          "let rec cli dispatch_table =\
         \n  printf \">>> %!\";\
         \n  let result =\
         \n    match In_channel.input_line stdin with\
         \n    | None -> `Stop\
         \n    | Some line ->\
         \n      match Or_error.try_with (fun () -> Sexp.of_string line) with\
         \n      | Error e -> `Continue (Error.to_string_hum e)\
         \n      | Ok (Sexp.Atom \"quit\") -> `Stop\
         \n      | Ok query ->\
         \n        begin match dispatch dispatch_table query with\
         \n        | Error e -> `Continue (Error.to_string_hum e)\
         \n        | Ok s    -> `Continue (Sexp.to_string_hum s)\
         \n        end;\
         \n  in\
         \n  match result with\
         \n  | `Stop -> ()\
         \n  | `Continue msg ->\
         \n    printf \"%s\\n%!\" msg;\
         \n    cli dispatch_table\
         \n;;")
        (toplevel_responses
         ((Raw
            "Characters 95-100:\
           \nWarning 3: deprecated: Core_kernel.stdin\
           \n[since 2016-04] Use [In_channel.stdin]")
          (OCaml
           "val cli : (string, (module Query_handler_instance)) Hashtbl.t -> unit = <fun>")))))))
    ((name 14)
     (chunks
      (((ocaml_code
          "type query_handler_instance = { name : string\
         \n                              ; eval : Sexp.t -> Sexp.t Or_error.t\
         \n                              };;")
        (toplevel_responses
         ((OCaml
            "type query_handler_instance = {\
           \n  name : string;\
           \n  eval : Sexp.t -> Sexp.t Or_error.t;\
           \n}"))))
       ((ocaml_code
          "type query_handler = Sexp.t -> query_handler_instance\
         \n;;")
        (toplevel_responses
         ((OCaml "type query_handler = Sexp.t -> query_handler_instance")))))))
    ((name 15)
     (chunks
      (((ocaml_code
          "let unique_handler config_sexp =\
         \n  let config = Unique.config_of_sexp config_sexp in\
         \n  let unique = Unique.create config in\
         \n  { name = Unique.name\
         \n  ; eval = (fun config -> Unique.eval unique config)\
         \n  }\
         \n;;")
        (toplevel_responses
         ((OCaml
           "val unique_handler : Sexp.t -> query_handler_instance = <fun>")))))))))
  (matched false)))
