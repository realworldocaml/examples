(Other
  "$ jbuilder build echo.exe\
 \n    ocamldep echo.depends.ocamldep-output\
 \n      ocamlc echo.{cmi,cmo,cmt}\
 \n    ocamlopt echo.{cmx,o}\
 \n    ocamlopt echo.exe\
 \n$ ./_build/default/echo.exe &\
 \n$ sleep 1\
 \n$ echo \"This is an echo server\" | nc 127.0.0.1 8765\
 \nThis is an echo server\
 \n$ echo \"It repeats whatever I write\" | nc 127.0.0.1 8765\
 \nIt repeats whatever I write\
 \n$ killall -9 echo.exe\
 \n")
