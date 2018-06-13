(OCaml
 (((name 2)
   (content
     "let newwin =\
    \n  foreign \"newwin\" \
    \n    (int @-> int @-> int @-> int @-> returning window)\
    \n\
    \nlet endwin =\
    \n  foreign \"endwin\" (void @-> returning void)\
    \n\
    \nlet refresh =\
    \n  foreign \"refresh\" (void @-> returning void)\
    \n\
    \nlet wrefresh =\
    \n  foreign \"wrefresh\" (window @-> returning void)\
    \n\
    \nlet addstr =\
    \n  foreign \"addstr\" (string @-> returning void)\
    \n\
    \nlet mvwaddch =\
    \n  foreign \"mvwaddch\"\
    \n    (window @-> int @-> int @-> char @-> returning void)\
    \n\
    \nlet mvwaddstr =\
    \n  foreign \"mvwaddstr\"\
    \n    (window @-> int @-> int @-> string @-> returning void)\
    \n\
    \nlet box =\
    \n  foreign \"box\" (window @-> char @-> char @-> returning void)\
    \n\
    \nlet cbreak =\
    \n  foreign \"cbreak\" (void @-> returning int)"))
  ((name 1)
   (content
     "open Foreign\
    \n\
    \nlet initscr =\
    \n  foreign \"initscr\" (void @-> returning window)\
    \n\
    \n"))
  ((name "")
   (content
     "open Ctypes\
    \n\
    \ntype window = unit ptr\
    \nlet window : window typ = ptr void\
    \n\
    \n"))))
