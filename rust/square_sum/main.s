	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZN3std2rt10lang_start17hd40f88a028dd7fd8E
	.globl	__ZN3std2rt10lang_start17hd40f88a028dd7fd8E
	.p2align	4, 0x90
__ZN3std2rt10lang_start17hd40f88a028dd7fd8E:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdx, %rax
	movq	%rsi, %rcx
	movq	%rdi, -8(%rbp)
	leaq	l_vtable.0(%rip), %rsi
	leaq	-8(%rbp), %rdi
	movq	%rcx, %rdx
	movq	%rax, %rcx
	callq	__ZN3std2rt19lang_start_internal17h4670cba317351a13E
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
__ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hd7079b073431078eE:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	*(%rdi)
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
__ZN4core3ops8function6FnOnce9call_once17hffbb19a3b632ba89E:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	*%rdi
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
__ZN4core3ptr13drop_in_place17hbf07a279d447c38bE:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
__ZN4main4main17hba75c185e3039e42E:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	leaq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	$120, -8(%rbp)
	movq	__ZN4core3fmt3num54_$LT$impl$u20$core..fmt..Display$u20$for$u20$isize$GT$3fmt17h3e5d1710035c52ecE@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
	leaq	l_byte_str.8(%rip), %rax
	movq	%rax, -72(%rbp)
	movq	$2, -64(%rbp)
	leaq	l_byte_str.9(%rip), %rax
	movq	%rax, -56(%rbp)
	movq	$1, -48(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	$1, -32(%rbp)
	leaq	-72(%rbp), %rdi
	callq	__ZN3std2io5stdio6_print17h2431df6816325414E
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.p2align	4, 0x90
_main:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rsi, %rax
	movslq	%edi, %rdx
	leaq	__ZN4main4main17hba75c185e3039e42E(%rip), %rcx
	movq	%rcx, -8(%rbp)
	leaq	l_vtable.0(%rip), %rsi
	leaq	-8(%rbp), %rdi
	movq	%rax, %rcx
	callq	__ZN3std2rt19lang_start_internal17h4670cba317351a13E
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__DATA,__const
	.p2align	3
l_vtable.0:
	.quad	__ZN4core3ptr13drop_in_place17hbf07a279d447c38bE
	.quad	8
	.quad	8
	.quad	__ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hd7079b073431078eE
	.quad	__ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hd7079b073431078eE
	.quad	__ZN4core3ops8function6FnOnce9call_once17hffbb19a3b632ba89E

	.section	__TEXT,__const
l_byte_str.6:
	.byte	0

l_byte_str.7:
	.byte	10

	.section	__DATA,__const
	.p2align	3
l_byte_str.8:
	.quad	l_byte_str.6
	.space	8
	.quad	l_byte_str.7
	.asciz	"\001\000\000\000\000\000\000"

	.section	__TEXT,__const
	.p2align	3
l_byte_str.9:
	.asciz	"\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\003\000\000\000\000\000\000"


.subsections_via_symbols
