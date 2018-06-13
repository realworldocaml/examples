(Other
  "$ atdgen -t github.atd\
 \n$ atdgen -j github.atd\
 \n$ ocamlfind ocamlc -package atd -i github_t.mli\
 \ntype scope =\
 \n    [ `Delete_repo | `Gist | `Public_repo | `Repo | `Repo_status | `User ]\
 \ntype app = { app_name : string; app_url : string; }\
 \ntype authorization_response = {\
 \n  scopes : scope list;\
 \n  token : string;\
 \n  app : app;\
 \n  url : string;\
 \n  id : int;\
 \n  note : string option;\
 \n  note_url : string option;\
 \n}\
 \ntype authorization_request = {\
 \n  auth_req_scopes : scope list;\
 \n  auth_req_note : string;\
 \n}\
 \n")
