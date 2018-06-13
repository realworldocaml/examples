(Other
  "typedef struct _win_st WINDOW;\
 \ntypedef unsigned int chtype;\
 \n\
 \nWINDOW *initscr   (void);\
 \nWINDOW *newwin    (int, int, int, int);\
 \nvoid    endwin    (void);\
 \nvoid    refresh   (void);\
 \nvoid    wrefresh  (WINDOW *);\
 \nvoid    addstr (const char *);\
 \nint     mvwaddch  (WINDOW *, int, int, const chtype);\
 \nvoid    mvwaddstr (WINDOW *, int, int, char *);\
 \nvoid    box (WINDOW *, chtype, chtype);\
 \nint     cbreak (void);\
 \n")
