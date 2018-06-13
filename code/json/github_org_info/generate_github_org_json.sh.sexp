(Other
  "$ atdgen -j github_org.atd\
 \n$ cat github_org_j.mli\
 \n(* Auto-generated from \"github_org.atd\" *)\
 \n              [@@@ocaml.warning \"-27-32-35-39\"]\
 \n\
 \ntype org = Github_org_t.org = {\
 \n  login: string;\
 \n  id: int;\
 \n  url: string;\
 \n  name: string option;\
 \n  blog: string option;\
 \n  email: string option;\
 \n  public_repos: int\
 \n}\
 \n\
 \nval write_org :\
 \n  Bi_outbuf.t -> org -> unit\
 \n  (** Output a JSON value of type {!org}. *)\
 \n\
 \nval string_of_org :\
 \n  ?len:int -> org -> string\
 \n  (** Serialize a value of type {!org}\
 \n      into a JSON string.\
 \n      @param len specifies the initial length\
 \n                 of the buffer used internally.\
 \n                 Default: 1024. *)\
 \n\
 \nval read_org :\
 \n  Yojson.Safe.lexer_state -> Lexing.lexbuf -> org\
 \n  (** Input JSON data of type {!org}. *)\
 \n\
 \nval org_of_string :\
 \n  string -> org\
 \n  (** Deserialize JSON data of type {!org}. *)\
 \n\
 \n")
