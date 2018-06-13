(Other
  "$ jbuilder build search_with_configurable_server.exe\
 \n    ocamldep search_with_configurable_server.depends.ocamldep-output\
 \n      ocamlc search_with_configurable_server.{cmi,cmo,cmt}\
 \n    ocamlopt search_with_configurable_server.{cmx,o}\
 \n    ocamlopt search_with_configurable_server.exe\
 \n$ ./_build/default/search_with_configurable_server.exe -servers localhost,api.duckduckgo.com \"Concurrent Programming\" OCaml\
 \n(monitor.ml.Error (Unix.Unix_error \"Connection refused\" connect 127.0.0.1:80)\
 \n (\"Raised by primitive operation at file \\\"src/unix_syscalls.ml\\\", line 917, characters 17-76\"\
 \n  \"Called from file \\\"src/deferred1.ml\\\", line 20, characters 40-45\"\
 \n  \"Called from file \\\"src/job_queue.ml\\\", line 159, characters 6-47\"\
 \n  \"Caught by monitor Tcp.close_sock_on_error\"))\
 \n")
