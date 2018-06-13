(Other
  "$ jbuilder build hello.exe\
 \n    ocamldep hello.depends.ocamldep-output\
 \n      ocamlc hello.{cmi,cmo,cmt} (exit 2)\
 \n(cd _build/default && /home/travis/.opam/4.04.2/bin/ocamlc.opt -w -40 -cclib -lncurses -g -bin-annot -I /home/travis/.opam/4.04.2/lib/bytes -I /home/travis/.opam/4.04.2/lib/ctypes -I /home/travis/.opam/4.04.2/lib/integers -I /home/travis/.opam/4.04.2/lib/ocaml -I /home/travis/.opam/4.04.2/lib/ocaml/threads -no-alias-deps -I . -o hello.cmo -c -impl hello.ml)\
 \nFile \"hello.ml\", line 1, characters 5-12:\
 \nError: Unbound module Ncurses\
 \n")
