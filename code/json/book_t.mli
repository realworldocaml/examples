(* Auto-generated from "book.atd" *)


type author = { name: string; affiliation: string }

type book = {
  title: string;
  tags: string list;
  pages: int;
  authors: author list;
  is_online: bool option;
  is_translated: bool option
}
