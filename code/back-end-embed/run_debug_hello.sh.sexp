(Other
  "$ ocamlopt -runtime-variant d -verbose -o hello.native hello.ml\
 \n+ as -o 'hello.o' '/tmp/camlasm9f05d4.s'\
 \n+ as -o '/tmp/camlstartupfac332.o' '/tmp/camlstartup6d986f.s'\
 \n+ gcc -o 'hello.native'   '-L/home/travis/.opam/4.04.2/lib/ocaml'  '/tmp/camlstartupfac332.o' '/home/travis/.opam/4.04.2/lib/ocaml/std_exit.o' 'hello.o' '/home/travis/.opam/4.04.2/lib/ocaml/stdlib.a' '/home/travis/.opam/4.04.2/lib/ocaml/libasmrund.a' -lm  -ldl\
 \n$ ./hello.native\
 \n### OCaml runtime: debug mode ###\
 \nInitial minor heap size: 256k words\
 \nInitial major heap size: 3840k bytes\
 \nInitial space overhead: 80%\
 \nInitial max overhead: 500%\
 \nInitial heap increment: 15%\
 \nInitial allocation policy: 0\
 \nInitial smoothing window: 1\
 \nHello OCaml World!\
 \n")
