(Other
  "type scope = [\
 \n    User <json name=\"user\">\
 \n  | Public_repo <json name=\"public_repo\">\
 \n  | Repo <json name=\"repo\">\
 \n  | Repo_status <json name=\"repo_status\">\
 \n  | Delete_repo <json name=\"delete_repo\">\
 \n  | Gist <json name=\"gist\">\
 \n]\
 \n\
 \ntype app = {\
 \n  name: string;\
 \n  url: string;\
 \n}  <ocaml field_prefix=\"app_\">\
 \n\
 \ntype authorization_request = {\
 \n  scopes: scope list;\
 \n  note: string;\
 \n} <ocaml field_prefix=\"auth_req_\">\
 \n\
 \ntype authorization_response = {\
 \n  scopes: scope list;\
 \n  token: string;\
 \n  app: app;\
 \n  url: string;\
 \n  id: int;\
 \n  ?note: string option;\
 \n  ?note_url: string option;\
 \n}\
 \n")
