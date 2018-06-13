(Other
  "$ jbuilder build test_interval_nosexp.exe\
 \n    ocamldep test_interval_nosexp.depends.ocamldep-output\
 \n    ocamldep test_interval_nosexp.dependsi.ocamldep-output\
 \n      ocamlc int_interval.{cmi,cmti}\
 \n      ocamlc test_interval_nosexp.{cmi,cmo,cmt} (exit 2)\
 \n(cd _build/default && /home/travis/.opam/4.04.2/bin/ocamlc.opt -w -40 -g -bin-annot -I /home/travis/.opam/4.04.2/lib/base -I /home/travis/.opam/4.04.2/lib/base/caml -I /home/travis/.opam/4.04.2/lib/base/shadow_stdlib -I /home/travis/.opam/4.04.2/lib/bin_prot -I /home/travis/.opam/4.04.2/lib/bin_prot/shape -I /home/travis/.opam/4.04.2/lib/core -I /home/travis/.opam/4.04.2/lib/core_kernel -I /home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests -I /home/travis/.opam/4.04.2/lib/fieldslib -I /home/travis/.opam/4.04.2/lib/jane-street-headers -I /home/travis/.opam/4.04.2/lib/num -I /home/travis/.opam/4.04.2/lib/ocaml -I /home/travis/.opam/4.04.2/lib/ocaml/threads -I /home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_expect/collector -I /home/travis/.opam/4.04.2/lib/ppx_expect/common -I /home/travis/.opam/4.04.2/lib/ppx_expect/config -I /home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib -I /home/travis/.opam/4.04.2/lib/ppx_inline_test/config -I /home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib -I /home/travis/.opam/4.04.2/lib/sexplib -I /home/travis/.opam/4.04.2/lib/sexplib/0 -I /home/travis/.opam/4.04.2/lib/sexplib/unix -I /home/travis/.opam/4.04.2/lib/spawn -I /home/travis/.opam/4.04.2/lib/stdio -I /home/travis/.opam/4.04.2/lib/typerep -I /home/travis/.opam/4.04.2/lib/variantslib -no-alias-deps -I . -o test_interval_nosexp.cmo -c -impl test_interval_nosexp.ml)\
 \nFile \"test_interval_nosexp.ml\", line 13, characters 20-42:\
 \nError: Unbound value Int_interval.sexp_of_t\
 \n")
