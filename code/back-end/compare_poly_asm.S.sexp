(Other
  "_camlCompare_poly__cmp_1008:\
 \n        .cfi_startproc\
 \n        subq    $24, %rsp\
 \n        .cfi_adjust_cfa_offset  24\
 \n.L101:\
 \n        movq    %rax, 8(%rsp)\
 \n        movq    %rbx, 0(%rsp)\
 \n        movq    %rax, %rdi\
 \n        movq    %rbx, %rsi\
 \n        leaq    _caml_greaterthan(%rip), %rax\
 \n        call    _caml_c_call\
 \n.L102:\
 \n        leaq    _caml_young_ptr(%rip), %r11\
 \n        movq    (%r11), %r15\
 \n        cmpq    $1, %rax\
 \n        je      .L100\
 \n        movq    8(%rsp), %rax\
 \n        addq    $24, %rsp\
 \n        .cfi_adjust_cfa_offset  -24\
 \n        ret\
 \n        .cfi_adjust_cfa_offset  24\
 \n        .align  2\
 \n.L100:\
 \n        movq    0(%rsp), %rax\
 \n        addq    $24, %rsp\
 \n        .cfi_adjust_cfa_offset  -24\
 \n        ret\
 \n        .cfi_adjust_cfa_offset  24\
 \n        .cfi_endproc\
 \n")
