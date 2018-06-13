(OCaml
 (((name "")
   (content
     "open Ncurses\
    \n\
    \nlet () =\
    \n  let main_window = initscr () in\
    \n  ignore(cbreak ());\
    \n  let small_window = newwin 10 10 5 5 in\
    \n  mvwaddstr main_window 1 2 \"Hello\";\
    \n  mvwaddstr small_window 2 2 \"World\";\
    \n  box small_window '\\000' '\\000';\
    \n  refresh ();\
    \n  Unix.sleep 1;\
    \n  wrefresh small_window;\
    \n  Unix.sleep 5;\
    \n  endwin ()"))))
