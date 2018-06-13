	.file ""
	.data
	.globl	camlCompare_mono__data_begin
camlCompare_mono__data_begin:
	.text
	.globl	camlCompare_mono__code_begin
camlCompare_mono__code_begin:
	.data
	.quad	1792
	.globl	camlCompare_mono
camlCompare_mono:
	.quad	1
	.data
	.globl	camlCompare_mono__gc_roots
camlCompare_mono__gc_roots:
	.quad	camlCompare_mono
	.quad	0
	.text
	.align	16
	.globl	camlCompare_mono__cmp_1199
camlCompare_mono__cmp_1199:
	.cfi_startproc
.L101:
	cmpq	%rbx, %rax
	jle	.L100
	ret
	.align	4
.L100:
	movq	%rbx, %rax
	ret
	.cfi_endproc
	.type camlCompare_mono__cmp_1199,@function
	.size camlCompare_mono__cmp_1199,. - camlCompare_mono__cmp_1199
	.data
	.quad	4087
camlCompare_mono__1:
	.quad	caml_curry2
	.quad	5
	.quad	camlCompare_mono__cmp_1199
	.text
	.align	16
	.globl	camlCompare_mono__entry
camlCompare_mono__entry:
	.cfi_startproc
.L102:
	leaq	camlCompare_mono__1(%rip), %rax
	movq	%rax, camlCompare_mono(%rip)
	movq	$1, %rax
	ret
	.cfi_endproc
	.type camlCompare_mono__entry,@function
	.size camlCompare_mono__entry,. - camlCompare_mono__entry
	.data
	.text
	.globl	camlCompare_mono__code_end
camlCompare_mono__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.globl	camlCompare_mono__data_end
camlCompare_mono__data_end:
	.long	0
	.globl	camlCompare_mono__frametable
camlCompare_mono__frametable:
	.quad	0
	.section .note.GNU-stack,"",%progbits
