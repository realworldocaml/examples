(OCaml
 (((name 6)
   (content
     "let eval t sexp =\
    \n    match Or_error.try_with (fun () -> request_of_sexp sexp) with\
    \n    | Error _ as err -> err\
    \n    | Ok resp ->\
    \n      match resp with\
    \n      | Load (name,config) -> load   t name config\
    \n      | Unload name        -> unload t name\
    \n      | Known_services ->\
    \n        Ok ([%sexp_of: string list] (Hashtbl.keys t.known))\
    \n      | Active_services ->\
    \n        Ok ([%sexp_of: string list] (Hashtbl.keys t.active))\
    \nend"))
  ((name 5)
   (content
     "type request =\
    \n    | Load of string * Sexp.t\
    \n    | Unload of string\
    \n    | Known_services\
    \n    | Active_services\
    \n  [@@deriving sexp]\
    \n\
    \n"))
  ((name 4)
   (content
     "let unload t handler_name =\
    \n    if not (Hashtbl.mem t.active handler_name) then\
    \n      Or_error.error \"Handler not active\" handler_name String.sexp_of_t\
    \n    else if handler_name = name then\
    \n      Or_error.error_string \"It's unwise to unload yourself\"\
    \n    else (\
    \n      Hashtbl.remove t.active handler_name;\
    \n      Ok Sexp.unit\
    \n    )\
    \n\
    \n"))
  ((name 3)
   (content
     "let load t handler_name config =\
    \n    if Hashtbl.mem t.active handler_name then\
    \n      Or_error.error \"Can't re-register an active handler\"\
    \n        handler_name String.sexp_of_t\
    \n    else\
    \n      match Hashtbl.find t.known handler_name with\
    \n      | None ->\
    \n        Or_error.error \"Unknown handler\" handler_name String.sexp_of_t\
    \n      | Some (module Q : Query_handler) ->\
    \n        let instance =\
    \n          (module struct\
    \n             module Query_handler = Q\
    \n             let this = Q.create (Q.config_of_sexp config)\
    \n           end : Query_handler_instance)\
    \n        in\
    \n        Hashtbl.set t.active ~key:handler_name ~data:instance;\
    \n        Ok Sexp.unit\
    \n\
    \n"))
  ((name 2)
   (content
     "let create known_list =\
    \n    let active = String.Table.create () in\
    \n    let known  = String.Table.create () in\
    \n    List.iter known_list\
    \n      ~f:(fun ((module Q : Query_handler) as q) ->\
    \n        Hashtbl.set known ~key:Q.name ~data:q);\
    \n    { known; active }\
    \n\
    \n"))
  ((name 1)
   (content
     "module Loader = struct\
    \n  type config = (module Query_handler) list sexp_opaque\
    \n  [@@deriving sexp]\
    \n\
    \n  type t = { known  : (module Query_handler)          String.Table.t\
    \n           ; active : (module Query_handler_instance) String.Table.t\
    \n           }\
    \n\
    \n  let name = \"loader\"\
    \n\
    \n"))
  ((name "")
   (content
     "open Core_kernel\
    \n\
    \nmodule type Query_handler = sig\
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
    \n  (** Create a new query handler from a config *)\
    \n  val create : config -> t\
    \n\
    \n  (** Evaluate a given query, where both input and output are\
    \n      s-expressions *)\
    \n  val eval : t -> Sexp.t -> Sexp.t Or_error.t\
    \nend\
    \n\
    \nmodule Unique = struct\
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
    \nend\
    \n\
    \nmodule List_dir = struct\
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
    \nend\
    \n\
    \nmodule type Query_handler_instance = sig\
    \n  module Query_handler : Query_handler\
    \n  val this : Query_handler.t\
    \nend\
    \n\
    \n\
    \nlet build_instance\
    \n      (type a)\
    \n      (module Q : Query_handler with type config = a)\
    \n      config\
    \n  =\
    \n  (module struct\
    \n     module Query_handler = Q\
    \n     let this = Q.create config\
    \n   end : Query_handler_instance)\
    \n\
    \nlet build_dispatch_table handlers =\
    \n  let table = String.Table.create () in\
    \n  List.iter handlers\
    \n    ~f:(fun ((module I : Query_handler_instance) as instance) ->\
    \n      Hashtbl.set table ~key:I.Query_handler.name ~data:instance);\
    \n  table\
    \n\
    \nlet dispatch dispatch_table name_and_query =\
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
    \n\
    \nlet rec cli dispatch_table =\
    \n  printf \">>> %!\";\
    \n  let result =\
    \n    match In_channel.input_line In_channel.stdin with\
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
    \n\
    \nlet unique_instance = build_instance (module Unique) 0;;\
    \nlet list_dir_instance = build_instance (module List_dir)  \"/var\";;\
    \n"))))
