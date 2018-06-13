(Other
  "$ jbuilder build terminal_color.exe\
 \n    ocamldep terminal_color.depends.ocamldep-output\
 \n    ocamldep terminal_color.dependsi.ocamldep-output\
 \n      ocamlc terminal_color.{cmi,cmti}\
 \n    ocamlopt terminal_color.{cmx,o} (exit 2)\
 \n(cd _build/default && /home/travis/.opam/4.04.2/bin/ocamlopt.opt -w -40 -g -I /home/travis/.opam/4.04.2/lib/base -I /home/travis/.opam/4.04.2/lib/base/caml -I /home/travis/.opam/4.04.2/lib/base/shadow_stdlib -I /home/travis/.opam/4.04.2/lib/bin_prot -I /home/travis/.opam/4.04.2/lib/bin_prot/shape -I /home/travis/.opam/4.04.2/lib/core -I /home/travis/.opam/4.04.2/lib/core_kernel -I /home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests -I /home/travis/.opam/4.04.2/lib/fieldslib -I /home/travis/.opam/4.04.2/lib/jane-street-headers -I /home/travis/.opam/4.04.2/lib/num -I /home/travis/.opam/4.04.2/lib/ocaml -I /home/travis/.opam/4.04.2/lib/ocaml/threads -I /home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_expect/collector -I /home/travis/.opam/4.04.2/lib/ppx_expect/common -I /home/travis/.opam/4.04.2/lib/ppx_expect/config -I /home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_inline_test/config -I /home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib -I /home/travis/.opam/4.04.2/lib/sexplib -I /home/travis/.opam/4.04.2/lib/sexplib/0 -I /home/travis/.opam/4.04.2/lib/sexplib/unix -I /home/travis/.opam/4.04.2/lib/spawn -I /home/travis/.opam/4.04.2/lib/stdio -I /home/travis/.opam/4.04.2/lib/typerep -I /home/travis/.opam/4.04.2/lib/variantslib -no-alias-deps -I . -o terminal_color.cmx -c -impl terminal_color.ml)\
 \nFile \"terminal_color.ml\", line 30, characters 4-11:\
 \nError: This pattern matches values of type [? `Grey of 'a ]\
 \n       but a pattern was expected which matches values of type extended_color\
 \n       The second variant type does not allow tag(s) `Grey\
 \n")
