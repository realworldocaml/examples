(OCaml
 (((name 5)
   (content
     "array_values:\
    \n  | (* empty *) { [] }\
    \n  | vl = rev_values { List.rev vl }\
    \n  ;\
    \n\
    \nrev_values:\
    \n  | v = value { [v] }\
    \n  | vl = rev_values; COMMA; v = value\
    \n    { v :: vl }\
    \n  ;"))
  ((name 4)
   (content
     "object_fields: obj = rev_object_fields { List.rev obj };\
    \n\
    \nrev_object_fields:\
    \n  | (* empty *) { [] }\
    \n  | obj = rev_object_fields; COMMA; k = ID; COLON; v = value\
    \n    { (k, v) :: obj }\
    \n  ;\
    \n"))
  ((name 3)
   (content
     "value:\
    \n  | LEFT_BRACE; obj = object_fields; RIGHT_BRACE\
    \n    { `Assoc obj }\
    \n  | LEFT_BRACK; vl = array_values; RIGHT_BRACK\
    \n    { `List vl }\
    \n  | s = STRING\
    \n    { `String s }\
    \n  | i = INT\
    \n    { `Int i }\
    \n  | x = FLOAT\
    \n    { `Float x }\
    \n  | TRUE\
    \n    { `Bool true }\
    \n  | FALSE\
    \n    { `Bool false }\
    \n  | NULL\
    \n    { `Null }\
    \n  ;\
    \n\
    \n"))
  ((name 2)
   (content
     "prog:\
    \n  | EOF       { None }\
    \n  | v = value { Some v }\
    \n  ;\
    \n\
    \n"))
  ((name 1) (content  "%start <Json.value option> prog\
                     \n%%\
                     \n\
                     \n"))
  ((name "")
   (content
     "%token <int> INT\
    \n%token <float> FLOAT\
    \n%token <string> ID\
    \n%token <string> STRING\
    \n%token TRUE\
    \n%token FALSE\
    \n%token NULL\
    \n%token LEFT_BRACE\
    \n%token RIGHT_BRACE\
    \n%token LEFT_BRACK\
    \n%token RIGHT_BRACK\
    \n%token COLON\
    \n%token COMMA\
    \n%token EOF\
    \n\
    \n"))))
