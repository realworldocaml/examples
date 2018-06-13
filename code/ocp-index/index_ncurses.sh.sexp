(Other
  "$ (cd ../ffi/ncurses && corebuild -pkg ctypes.foreign -tag bin_annot ncurses.cmi)\
 \nocamlfind ocamldep -package ctypes.foreign -package core -ppx 'ppx-jane -as-ppx' -modules ncurses.mli > ncurses.mli.depends\
 \nocamlfind ocamlc -c -w A-4-33-40-41-42-43-34-44 -strict-sequence -g -bin-annot -short-paths -thread -package ctypes.foreign -package core -ppx 'ppx-jane -as-ppx' -o ncurses.cmi ncurses.mli\
 \n$ ocp-index complete -I ../ffi Ncur\
 \nNcurses module\
 \n$ ocp-index complete -I ../ffi Ncurses.a\
 \nNcurses.addstr val string -> unit\
 \n$ ocp-index complete -I ../ffi Ncurses.\
 \nNcurses.window val window Ctypes.typ\
 \nNcurses.initscr val unit -> window\
 \nNcurses.endwin val unit -> unit\
 \nNcurses.refresh val unit -> unit\
 \nNcurses.wrefresh val window -> unit\
 \nNcurses.newwin val int -> int -> int -> int -> window\
 \nNcurses.mvwaddch val window -> int -> int -> char -> unit\
 \nNcurses.addstr val string -> unit\
 \nNcurses.mvwaddstr val window -> int -> int -> string -> unit\
 \nNcurses.box val window -> char -> char -> unit\
 \nNcurses.cbreak val unit -> int\
 \n")
