(OCaml
 (((name "")
   (content
     "type window\
    \nval window : window Ctypes.typ\
    \nval initscr : unit -> window\
    \nval endwin : unit -> unit\
    \nval refresh : unit -> unit\
    \nval wrefresh : window -> unit\
    \nval newwin : int -> int -> int -> int -> window\
    \nval mvwaddch : window -> int -> int -> char -> unit\
    \nval addstr : string -> unit\
    \nval mvwaddstr : window -> int -> int -> string -> unit\
    \nval box : window -> char -> char -> unit\
    \nval cbreak : unit -> int"))))
