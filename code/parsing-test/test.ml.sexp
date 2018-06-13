(OCaml
 (((name 1)
   (content
     "let rec parse_and_print lexbuf =\
    \n  match parse_with_error lexbuf with\
    \n  | Some value ->\
    \n    printf \"%a\\n\" Json.output_value value;\
    \n    parse_and_print lexbuf\
    \n  | None -> ()\
    \n\
    \nlet loop filename () =\
    \n  let inx = In_channel.create filename in\
    \n  let lexbuf = Lexing.from_channel inx in\
    \n  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };\
    \n  parse_and_print lexbuf;\
    \n  In_channel.close inx\
    \n\
    \nlet () =\
    \n  Command.basic ~summary:\"Parse and display JSON\"\
    \n    Command.Spec.(empty +> anon (\"filename\" %: file))\
    \n    loop\
    \n  |> Command.run"))
  ((name "")
   (content
     "open Core\
    \nopen Lexer\
    \nopen Lexing\
    \n\
    \nlet print_position outx lexbuf =\
    \n  let pos = lexbuf.lex_curr_p in\
    \n  fprintf outx \"%s:%d:%d\" pos.pos_fname\
    \n    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)\
    \n\
    \nlet parse_with_error lexbuf =\
    \n  try Parser.prog Lexer.read lexbuf with\
    \n  | SyntaxError msg ->\
    \n    fprintf stderr \"%a: %s\\n\" print_position lexbuf msg;\
    \n    None\
    \n  | Parser.Error ->\
    \n    fprintf stderr \"%a: syntax error\\n\" print_position lexbuf;\
    \n    exit (-1)\
    \n"))))
