(Other
  "# type t1 = { foo1:int; bar1:t2 } and t2 = { foo2:int; bar2:t1 } ;;\
 \ntype t1 = { foo1 : int; bar1 : t2; }\
 \nand t2 = { foo2 : int; bar2 : t1; }\
 \n# let rec v1 = { foo1=1; bar1=v2 } and v2 = { foo2=2; bar2=v1 } ;;\
 \n<lots of text>\
 \n# v1 == v1;;\
 \n- : bool = true\
 \n# phys_equal v1 v1;;\
 \n- : bool = true\
 \n# v1 = v1 ;;\
 \n<press ^Z and kill the process now>\
 \n")
