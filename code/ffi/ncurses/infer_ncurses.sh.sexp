(Other
  "$ corebuild -pkg ctypes.foreign ncurses.inferred.mli\
 \nocamlfind ocamldep -package ctypes.foreign -package core -ppx 'ppx-jane -as-ppx' -modules ncurses.ml > ncurses.ml.depends\
 \n+ ocamlfind ocamldep -package ctypes.foreign -package core -ppx 'ppx-jane -as-ppx' -modules ncurses.ml > ncurses.ml.depends\
 \nFile \"ncurses.ml\", line 7, characters 4-8:\
 \nError: Attribute `part' was not used\
 \nCommand exited with code 2.\
 \n$ cp _build/ncurses.inferred.mli .\
 \ncp: cannot stat \226\128\152_build/ncurses.inferred.mli\226\128\153: No such file or directory\
 \n")
