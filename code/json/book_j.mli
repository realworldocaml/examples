(* Auto-generated from "book.atd" *)


type author = Book_t.author = { name: string; affiliation: string }

type book = Book_t.book = {
  title: string;
  tags: string list;
  pages: int;
  authors: author list;
  is_online: bool option;
  is_translated: bool option
}

val write_author :
  Bi_outbuf.t -> author -> unit
  (** Output a JSON value of type {!author}. *)

val string_of_author :
  ?len:int -> author -> string
  (** Serialize a value of type {!author}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_author :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> author
  (** Input JSON data of type {!author}. *)

val author_of_string :
  string -> author
  (** Deserialize JSON data of type {!author}. *)

val write_book :
  Bi_outbuf.t -> book -> unit
  (** Output a JSON value of type {!book}. *)

val string_of_book :
  ?len:int -> book -> string
  (** Serialize a value of type {!book}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_book :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> book
  (** Input JSON data of type {!book}. *)

val book_of_string :
  string -> book
  (** Deserialize JSON data of type {!book}. *)

