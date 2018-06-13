(OCaml_toplevel
 ((parts
   (((name "")
     (chunks
      (((ocaml_code "#use \"topfind\";;")
        (toplevel_responses
         ((OCaml "- : unit = ()")
          (Raw
            "Findlib has been successfully loaded. Additional directives:\
           \n  #require \"package\";;      to load a package\
           \n  #list;;                   to list the available packages\
           \n  #camlp4o;;                to load camlp4 (standard syntax)\
           \n  #camlp4r;;                to load camlp4 (revised syntax)\
           \n  #predicates \"p,q,...\";;   to set these predicates\
           \n  Topfind.reset();;         to force that packages will be reloaded\
           \n  #thread;;                 to enable threads\
           \n")
          (OCaml "- : unit = ()"))))
       ((ocaml_code "#thread;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ocaml/threads: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ocaml/threads/threads.cma: loaded"))))
       ((ocaml_code "#camlp4o;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ocaml/dynlink.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ocaml/camlp4: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ocaml/camlp4/camlp4o.cma: loaded\
           \nCannot find file /home/travis/.opam/4.04.2/lib/ocaml/camlp4/camlp4o.cma."))))
       ((ocaml_code "#require \"core\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/base/caml: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/caml/caml.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/base/shadow_stdlib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/shadow_stdlib/shadow_stdlib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib/0: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base: added to search path\
           \n/home/travis/.opam/4.04.2/lib/base/base.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/fieldslib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/fieldslib/fieldslib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_compare/runtime-lib/ppx_compare_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/variantslib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/variantslib/variantslib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/shape: added to search path\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/shape/bin_shape_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/bin_prot: added to search path\
           \n/home/travis/.opam/4.04.2/lib/bin_prot/bin_prot.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_hash/runtime-lib/ppx_hash_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/config: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/config/inline_test_config.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_inline_test/runtime-lib/ppx_inline_test_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/base_for_tests/base_for_tests.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/jane-street-headers: added to search path\
           \n/home/travis/.opam/4.04.2/lib/jane-street-headers/jane_street_headers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ocaml/nums.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/num-top: added to search path\
           \n/home/travis/.opam/4.04.2/lib/num-top/num_top.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/num: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_assert/runtime-lib/ppx_assert_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_bench/runtime-lib/ppx_bench_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/common: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/common/expect_test_common.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/config: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/config/expect_test_config.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/collector: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_expect/collector/expect_test_collector.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/stdio: added to search path\
           \n/home/travis/.opam/4.04.2/lib/stdio/stdio.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/typerep: added to search path\
           \n/home/travis/.opam/4.04.2/lib/typerep/typerep_lib.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core_kernel: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core_kernel/core_kernel.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/sexplib/unix: added to search path\
           \n/home/travis/.opam/4.04.2/lib/sexplib/unix/sexplib_unix.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/spawn: added to search path\
           \n/home/travis/.opam/4.04.2/lib/spawn/spawn.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/core: added to search path\
           \n/home/travis/.opam/4.04.2/lib/core/core.cma: loaded"))))
       ((ocaml_code "#require \"ppx_jane\";;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/ppx_jane: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ppx_jane/./ppx.exe --as-ppx: activated"))))
       ((ocaml_code "#require \"ctypes.foreign\" ;;")
        (toplevel_responses
         ((Raw
            "/home/travis/.opam/4.04.2/lib/bytes: added to search path\
           \n/home/travis/.opam/4.04.2/lib/integers: added to search path\
           \n/home/travis/.opam/4.04.2/lib/integers/integers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/integers/integer_printers.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes: added to search path\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes-top.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes-foreign-base.cma: loaded\
           \n/home/travis/.opam/4.04.2/lib/ctypes/ctypes-foreign-threaded.cma: loaded")))))))
    ((name 1)
     (chunks
      (((ocaml_code "open Ctypes ;;") (toplevel_responses ()))
       ((ocaml_code "open PosixTypes ;;") (toplevel_responses ()))
       ((ocaml_code "open Foreign ;;") (toplevel_responses ()))
       ((ocaml_code
         "let compare_t = ptr void @-> ptr void @-> returning int ;;")
        (toplevel_responses
         ((OCaml
            "val compare_t : (unit Ctypes_static.ptr -> unit Ctypes_static.ptr -> int) fn =\
           \n  int(void*, void*)"))))
       ((ocaml_code
          "let qsort = foreign \"qsort\"\
         \n              (ptr void @-> size_t @-> size_t @->\
         \n               funptr compare_t @-> returning void) ;;")
        (toplevel_responses
         ((OCaml
            "val qsort :\
           \n  unit Ctypes_static.ptr ->\
           \n  size_t ->\
           \n  size_t -> (unit Ctypes_static.ptr -> unit Ctypes_static.ptr -> int) -> unit =\
           \n  <fun>")))))))))
  (matched false)))
