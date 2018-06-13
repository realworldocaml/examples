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
       ((ocaml_code "open Core;;") (toplevel_responses ())))))
    ((name 1)
     (chunks
      (((ocaml_code "open Command.Spec ;;") (toplevel_responses ()))
       ((ocaml_code
          "step (fun m (base:Date.t) days ->\
         \n  match days with\
         \n  | Some days -> m base days\
         \n  | None ->\
         \n    print_endline \"enter days: \";\
         \n    m base (read_int ())) ;;")
        (toplevel_responses
         ((Raw
            "Characters 139-147:\
           \nWarning 3: deprecated: Core.read_int\
           \n[since 2016-04] Use\
           \n[Out_channel.(flush stdout); Int.of_string In_channel.(input_line_exn stdin)]")
          (OCaml
           "- : (Date.t -> int -> '_a, Date.t -> int option -> '_a) t = <abstr>")))))))))
  (matched false)))
