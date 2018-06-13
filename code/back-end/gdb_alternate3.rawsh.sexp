(Other
  "(gdb) cont\
 \nContinuing.\
 \n \
 \nBreakpoint 1, camlAlternate_list__take_69242 () at alternate_list.ml:5\
 \n4         function\
 \n(gdb) cont\
 \nContinuing.\
 \n \
 \nBreakpoint 1, camlAlternate_list__take_69242 () at alternate_list.ml:5\
 \n4         function\
 \n(gdb) bt\
 \n#0  camlAlternate_list__take_69242 () at alternate_list.ml:4\
 \n#1  0x00000000005658e7 in camlAlternate_list__take_69242 () at alternate_list.ml:6\
 \n#2  0x00000000005658e7 in camlAlternate_list__take_69242 () at alternate_list.ml:6\
 \n#3  0x00000000005659f7 in camlAlternate_list__entry () at alternate_list.ml:14\
 \n#4  0x0000000000560029 in caml_program ()\
 \n#5  0x000000000080984a in caml_start_program ()\
 \n#6  0x00000000008099a0 in ?? ()\
 \n#7  0x0000000000000000 in ?? ()\
 \n(gdb) clear camlAlternate_list__take_69242\
 \nDeleted breakpoint 1 \
 \n(gdb) cont\
 \nContinuing.\
 \n1,3,5,7,9\
 \n[Inferior 1 (process 3546) exited normally]\
 \n")
