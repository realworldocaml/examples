(Other
  "/* A function that accepts an int, and returns a function\
 \n   pointer that accepts a second int and returns an int. */\
 \ntypedef int (function_t)(int);\
 \nfunction_t *curried_C(int);\
 \n\
 \n/* supply both arguments */\
 \ncurried_C(3)(4);\
 \n\
 \n/* supply one argument at a time */\
 \nfunction_t *f = curried_C(3); f(4);\
 \n")
