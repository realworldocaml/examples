(OCaml
 (((name "")
   (content
     "val string_of_authorization_request :\
    \n  ?len:int -> authorization_request -> string\
    \n  (** Serialize a value of type {!authorization_request}\
    \n      into a JSON string.\
    \n      @param len specifies the initial length\
    \n                 of the buffer used internally.\
    \n                 Default: 1024. *)\
    \n\
    \nval string_of_authorization_response :\
    \n  ?len:int -> authorization_response -> string\
    \n  (** Serialize a value of type {!authorization_response}\
    \n      into a JSON string.\
    \n      @param len specifies the initial length\
    \n                 of the buffer used internally.\
    \n                 Default: 1024. *)"))))
