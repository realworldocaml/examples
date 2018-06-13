(Other
  "#include <stdio.h>\
 \n#include <caml/alloc.h>\
 \n#include <caml/mlvalues.h>\
 \n#include <caml/memory.h>\
 \n#include <caml/callback.h>\
 \n\
 \nint \
 \nmain (int argc, char **argv)\
 \n{\
 \n  printf(\"Before calling OCaml\\n\");\
 \n  fflush(stdout);\
 \n  caml_startup (argv);\
 \n  printf(\"After calling OCaml\\n\");\
 \n  return 0;\
 \n}\
 \n")
