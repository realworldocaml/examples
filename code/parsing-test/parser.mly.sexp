(OCaml
 (((name "")
   (content
     "%token <int> INT\
    \n%token <float> FLOAT\
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
    \n%start <Json.value option> prog\
    \n\
    \n%%\
    \n\
    \nprog:\
    \n  | v = value { Some v }\
    \n  | EOF       { None   } ;\
    \n\
    \nvalue:\
    \n  | LEFT_BRACE; obj = obj_fields; RIGHT_BRACE { `Assoc obj  }\
    \n  | LEFT_BRACK; vl = list_fields; RIGHT_BRACK { `List vl    }\
    \n  | s = STRING                                { `String s   }\
    \n  | i = INT                                   { `Int i      }\
    \n  | x = FLOAT                                 { `Float x    }\
    \n  | TRUE                                      { `Bool true  }\
    \n  | FALSE                                     { `Bool false }\
    \n  | NULL                                      { `Null       } ;\
    \n\
    \nobj_fields:\
    \n    obj = separated_list(COMMA, obj_field)    { obj } ;\
    \n\
    \nobj_field:\
    \n    k = STRING; COLON; v = value              { (k, v) } ;\
    \n\
    \nlist_fields:\
    \n    vl = separated_list(COMMA, value)         { vl } ;"))))
