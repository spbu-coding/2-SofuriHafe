	.file	"sort.c"
	.text
	.p2align 4,,15
	.globl	_quick_sort
	.def	_quick_sort;	.scl	2;	.type	32;	.endef
_quick_sort:
LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %ebp
	jmp	L12
	.p2align 4,,10
L5:
	cmpl	24(%esp), %edx
	jge	L19
	.p2align 4,,10
L9:
	testl	%edx, %edx
	jle	L10
	addl	$1, %edx
	movl	%ebp, (%esp)
	movl	%edx, 4(%esp)
	call	_quick_sort
L10:
	movl	24(%esp), %eax
	cmpl	%eax, 68(%esp)
	jle	L1
	subl	%eax, 68(%esp)
	leal	0(%ebp,%eax,8), %ebp
L12:
	movl	68(%esp), %eax
	movl	$1, %edi
	leal	-1(%eax), %edx
	shrl	$31, %eax
	addl	68(%esp), %eax
	sarl	%eax
	movl	0(%ebp,%eax,8), %eax
	movl	%eax, 16(%esp)
	sarl	$31, %eax
	movl	%eax, 20(%esp)
	.p2align 4,,10
L2:
	leal	-1(%edi), %eax
	movl	20(%esp), %esi
	cmpl	%esi, -4(%ebp,%edi,8)
	movl	16(%esp), %ebx
	movl	%eax, 24(%esp)
	movl	-8(%ebp,%edi,8), %eax
	movl	%eax, 28(%esp)
	jl	L3
	jg	L13
	cmpl	%ebx, %eax
	jb	L3
L13:
	leal	0(,%edx,8), %eax
	leal	0(%ebp,%eax), %esi
	movl	4(%esi), %ecx
	cmpl	20(%esp), %ecx
	movl	(%esi), %ebx
	jl	L5
	jg	L14
	cmpl	16(%esp), %ebx
	jbe	L5
L14:
	leal	-8(%ebp,%eax), %eax
	.p2align 4,,10
L15:
	movl	%eax, %esi
	subl	$8, %eax
	subl	$1, %edx
	movl	12(%eax), %ecx
	cmpl	20(%esp), %ecx
	movl	8(%eax), %ebx
	jg	L15
	jl	L5
	cmpl	16(%esp), %ebx
	ja	L15
	cmpl	24(%esp), %edx
	jl	L9
L19:
	movl	28(%esp), %eax
	subl	$1, %edx
	movl	%ebx, -8(%ebp,%edi,8)
	movl	%ecx, -4(%ebp,%edi,8)
	movl	%edi, 24(%esp)
	movl	%eax, (%esi)
	sarl	$31, %eax
	cmpl	%edx, %edi
	movl	%eax, 4(%esi)
	jg	L9
L3:
	addl	$1, %edi
	jmp	L2
L1:
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE0:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
