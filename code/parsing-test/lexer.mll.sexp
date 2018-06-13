(OCaml
 (((name 5)
   (content
     "and read_string buf =\
    \n  parse\
    \n  | '\"'       { STRING (Buffer.contents buf) }\
    \n  | '\\\\' '/'  { Buffer.add_char buf '/'; read_string buf lexbuf }\
    \n  | '\\\\' '\\\\' { Buffer.add_char buf '\\\\'; read_string buf lexbuf }\
    \n  | '\\\\' 'b'  { Buffer.add_char buf '\\b'; read_string buf lexbuf }\
    \n  | '\\\\' 'f'  { Buffer.add_char buf '\\012'; read_string buf lexbuf }\
    \n  | '\\\\' 'n'  { Buffer.add_char buf '\\n'; read_string buf lexbuf }\
    \n  | '\\\\' 'r'  { Buffer.add_char buf '\\r'; read_string buf lexbuf }\
    \n  | '\\\\' 't'  { Buffer.add_char buf '\\t'; read_string buf lexbuf }\
    \n  | [^ '\"' '\\\\']+\
    \n    { Buffer.add_string buf (Lexing.lexeme lexbuf);\
    \n      read_string buf lexbuf\
    \n    }\
    \n  | _ { raise (SyntaxError (\"Illegal string character: \" ^ Lexing.lexeme lexbuf)) }\
    \n  | eof { raise (SyntaxError (\"String is not terminated\")) }"))
  ((name 4)
   (content
     "rule read =\
    \n  parse\
    \n  | white    { read lexbuf }\
    \n  | newline  { next_line lexbuf; read lexbuf }\
    \n  | int      { INT (int_of_string (Lexing.lexeme lexbuf)) }\
    \n  | float    { FLOAT (float_of_string (Lexing.lexeme lexbuf)) }\
    \n  | \"true\"   { TRUE }\
    \n  | \"false\"  { FALSE }\
    \n  | \"null\"   { NULL }\
    \n  | '\"'      { read_string (Buffer.create 17) lexbuf }\
    \n  | '{'      { LEFT_BRACE }\
    \n  | '}'      { RIGHT_BRACE }\
    \n  | '['      { LEFT_BRACK }\
    \n  | ']'      { RIGHT_BRACK }\
    \n  | ':'      { COLON }\
    \n  | ','      { COMMA }\
    \n  | _ { raise (SyntaxError (\"Unexpected char: \" ^ Lexing.lexeme lexbuf)) }\
    \n  | eof      { EOF }\
    \n\
    \n"))
  ((name 3)
   (content
     "let white = [' ' '\\t']+\
    \nlet newline = '\\r' | '\\n' | \"\\r\\n\"\
    \nlet id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*\
    \n\
    \n"))
  ((name 2)
   (content
     "let digit = ['0'-'9']\
    \nlet frac = '.' digit*\
    \nlet exp = ['e' 'E'] ['-' '+']? digit+\
    \nlet float = digit* frac? exp?\
    \n\
    \n"))
  ((name 1) (content  "let int = '-'? ['0'-'9'] ['0'-'9']*\
                     \n\
                     \n"))
  ((name "")
   (content
     "{\
    \nopen Lexing\
    \nopen Parser\
    \n\
    \nexception SyntaxError of string\
    \n\
    \nlet next_line lexbuf =\
    \n  let pos = lexbuf.lex_curr_p in\
    \n  lexbuf.lex_curr_p <-\
    \n    { pos with pos_bol = lexbuf.lex_curr_pos;\
    \n               pos_lnum = pos.pos_lnum + 1\
    \n    }\
    \n}\
    \n\
    \n"))))
