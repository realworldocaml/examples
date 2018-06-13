(OCaml
 (((name 1)
   (content
     "type shape = < variant : repr; area : float>\
    \nand circle = < variant : repr; area : float; radius : int >\
    \nand line = < variant : repr; area : float; length : int >\
    \nand repr =\
    \n | Circle of circle\
    \n | Line of line;;\
    \n\
    \nlet is_barbell = function\
    \n| [s1; s2; s3] ->\
    \n   (match s1#variant, s2#variant, s3#variant with\
    \n    | Circle c1, Line _, Circle c2 when c1#radius = c2#radius -> true\
    \n    | _ -> false)\
    \n| _ -> false;;"))
  ((name "") (content "\n"))))
