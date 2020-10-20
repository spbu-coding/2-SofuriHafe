	.file	"sort.c"
	.text
	.p2align 4
	.globl	quick_sort
	.type	quick_sort, @function
quick_sort:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
.L10:
	movl	%r12d, %eax
	leal	-1(%r12), %edx
	xorl	%esi, %esi
	shrl	$31, %eax
	addl	%r12d, %eax
	sarl	%eax
	cltq
	movslq	(%rbx,%rax,8), %rdi
	movslq	%edx, %rax
	movq	(%rbx,%rax,8), %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	movq	(%rbx,%rsi,8), %r9
	movl	%esi, %r10d
	movl	%esi, %ebp
	cmpq	%rdi, %r9
	jl	.L3
	cmpq	%rcx, %rdi
	jge	.L4
	leaq	-8(%rbx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rax, %r8
	movq	(%rax), %rcx
	subq	$8, %rax
	subl	$1, %edx
	cmpq	%rdi, %rcx
	jg	.L5
.L6:
	cmpl	%esi, %edx
	jge	.L14
.L7:
	testl	%edx, %edx
	jle	.L8
	leal	1(%rdx), %esi
	movq	%rbx, %rdi
	call	quick_sort
.L8:
	cmpl	%ebp, %r12d
	jle	.L1
	subl	%ebp, %r12d
	movslq	%ebp, %rbp
	leaq	(%rbx,%rbp,8), %rbx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	%r9d, %r9
	leal	1(%r10), %ebp
	subl	$1, %edx
	movq	%rcx, (%rbx,%rsi,8)
	movq	%r9, (%r8)
	cmpl	%ebp, %edx
	jl	.L7
	movslq	%edx, %rax
	movq	(%rbx,%rax,8), %rcx
.L3:
	addq	$1, %rsi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	leaq	(%rbx,%rax,8), %r8
	jmp	.L6
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	quick_sort, .-quick_sort
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
