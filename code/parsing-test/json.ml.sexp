(OCaml
 (((name "")
   (content
     "type value = [\
    \n  | `Assoc of (string * value) list\
    \n  | `Bool of bool\
    \n  | `Float of float\
    \n  | `Int of int\
    \n  | `List of value list\
    \n  | `Null\
    \n  | `String of string\
    \n]\
    \n\
    \n(* part 1 *)\
    \nopen Core\
    \nopen Out_channel\
    \n\
    \nlet rec output_value outc = function\
    \n  | `Assoc obj  -> print_assoc outc obj\
    \n  | `List l     -> print_list outc l\
    \n  | `String s   -> printf \"\\\"%s\\\"\" s\
    \n  | `Int i      -> printf \"%d\" i\
    \n  | `Float x    -> printf \"%f\" x\
    \n  | `Bool true  -> output_string outc \"true\"\
    \n  | `Bool false -> output_string outc \"false\"\
    \n  | `Null       -> output_string outc \"null\"\
    \n\
    \nand print_assoc outc obj =\
    \n  output_string outc \"{ \";\
    \n  let sep = ref \"\" in\
    \n  List.iter ~f:(fun (key, value) ->\
    \n      printf \"%s\\\"%s\\\": %a\" !sep key output_value value;\
    \n      sep := \",\\n  \") obj;\
    \n  output_string outc \" }\"\
    \n\
    \nand print_list outc arr =\
    \n  output_string outc \"[\";\
    \n  List.iteri ~f:(fun i v ->\
    \n      if i > 0 then\
    \n        output_string outc \", \";\
    \n      output_value outc v) arr;\
    \n  output_string outc \"]\""))))
