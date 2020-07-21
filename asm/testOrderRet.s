	.file	"testOrderRet.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
.LC0:
	.string	"%d"
	.section	.text._ZNSt7__cxx119to_stringEi,"axG",@progbits,_ZNSt7__cxx119to_stringEi,comdat
	.weak	_ZNSt7__cxx119to_stringEi
	.type	_ZNSt7__cxx119to_stringEi, @function
_ZNSt7__cxx119to_stringEi:
.LFB912:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %r8d
	movl	$.LC0, %ecx
	movl	$16, %edx
	movl	$vsnprintf, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE912:
	.size	_ZNSt7__cxx119to_stringEi, .-_ZNSt7__cxx119to_stringEi
	.section	.text._ZStanSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStanSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStanSt13_Ios_FmtflagsS_
	.type	_ZStanSt13_Ios_FmtflagsS_, @function
_ZStanSt13_Ios_FmtflagsS_:
.LFB1110:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	andl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1110:
	.size	_ZStanSt13_Ios_FmtflagsS_, .-_ZStanSt13_Ios_FmtflagsS_
	.section	.text._ZStorSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStorSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStorSt13_Ios_FmtflagsS_
	.type	_ZStorSt13_Ios_FmtflagsS_, @function
_ZStorSt13_Ios_FmtflagsS_:
.LFB1111:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	orl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1111:
	.size	_ZStorSt13_Ios_FmtflagsS_, .-_ZStorSt13_Ios_FmtflagsS_
	.section	.text._ZStcoSt13_Ios_Fmtflags,"axG",@progbits,_ZStcoSt13_Ios_Fmtflags,comdat
	.weak	_ZStcoSt13_Ios_Fmtflags
	.type	_ZStcoSt13_Ios_Fmtflags, @function
_ZStcoSt13_Ios_Fmtflags:
.LFB1113:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	notl	%eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1113:
	.size	_ZStcoSt13_Ios_Fmtflags, .-_ZStcoSt13_Ios_Fmtflags
	.section	.text._ZStoRRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStoRRSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStoRRSt13_Ios_FmtflagsS_
	.type	_ZStoRRSt13_Ios_FmtflagsS_, @function
_ZStoRRSt13_Ios_FmtflagsS_:
.LFB1114:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStorSt13_Ios_FmtflagsS_
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1114:
	.size	_ZStoRRSt13_Ios_FmtflagsS_, .-_ZStoRRSt13_Ios_FmtflagsS_
	.section	.text._ZStaNRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStaNRSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStaNRSt13_Ios_FmtflagsS_
	.type	_ZStaNRSt13_Ios_FmtflagsS_, @function
_ZStaNRSt13_Ios_FmtflagsS_:
.LFB1115:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStanSt13_Ios_FmtflagsS_
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1115:
	.size	_ZStaNRSt13_Ios_FmtflagsS_, .-_ZStaNRSt13_Ios_FmtflagsS_
	.section	.text._ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,"axG",@progbits,_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,comdat
	.align 2
	.weak	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.type	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, @function
_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_:
.LFB1144:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	_ZStcoSt13_Ios_Fmtflags
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStaNRSt13_Ios_FmtflagsS_
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStanSt13_Ios_FmtflagsS_
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStoRRSt13_Ios_FmtflagsS_
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1144:
	.size	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, .-_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.section	.text._ZSt3hexRSt8ios_base,"axG",@progbits,_ZSt3hexRSt8ios_base,comdat
	.weak	_ZSt3hexRSt8ios_base
	.type	_ZSt3hexRSt8ios_base, @function
_ZSt3hexRSt8ios_base:
.LFB1172:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$74, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1172:
	.size	_ZSt3hexRSt8ios_base, .-_ZSt3hexRSt8ios_base
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.globl	_ZN5xiuye17println_sepetatorE
	.data
	.type	_ZN5xiuye17println_sepetatorE, @object
	.size	_ZN5xiuye17println_sepetatorE, 1
_ZN5xiuye17println_sepetatorE:
	.byte	32
	.globl	_ZN5xiuye15print_sepetatorE
	.type	_ZN5xiuye15print_sepetatorE, @object
	.size	_ZN5xiuye15print_sepetatorE, 1
_ZN5xiuye15print_sepetatorE:
	.byte	32
	.text
	.globl	_ZN5xiuye7printlnEv
	.type	_ZN5xiuye7printlnEv, @function
_ZN5xiuye7printlnEv:
.LFB1518:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEPFRSoS_E
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1518:
	.size	_ZN5xiuye7printlnEv, .-_ZN5xiuye7printlnEv
	.globl	_ZN5xiuye4slenEPKc
	.type	_ZN5xiuye4slenEPKc, @function
_ZN5xiuye4slenEPKc:
.LFB1527:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
.L20:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	setne	%al
	testb	%al, %al
	je	.L19
	jmp	.L20
.L19:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1527:
	.size	_ZN5xiuye4slenEPKc, .-_ZN5xiuye4slenEPKc
	.globl	_ZN5xiuye4slenEPc
	.type	_ZN5xiuye4slenEPc, @function
_ZN5xiuye4slenEPc:
.LFB1528:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5xiuye4slenEPKc
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1528:
	.size	_ZN5xiuye4slenEPc, .-_ZN5xiuye4slenEPc
	.globl	_ZN5xiuye8TimeSpec5startE
	.bss
	.align 8
	.type	_ZN5xiuye8TimeSpec5startE, @object
	.size	_ZN5xiuye8TimeSpec5startE, 8
_ZN5xiuye8TimeSpec5startE:
	.zero	8
	.globl	_ZN5xiuye8TimeSpec3endE
	.align 8
	.type	_ZN5xiuye8TimeSpec3endE, @object
	.size	_ZN5xiuye8TimeSpec3endE, 8
_ZN5xiuye8TimeSpec3endE:
	.zero	8
	.text
	.align 2
	.globl	_ZN5xiuye8TimeSpec5beginEv
	.type	_ZN5xiuye8TimeSpec5beginEv, @function
_ZN5xiuye8TimeSpec5beginEv:
.LFB1529:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	clock
	movq	%rax, _ZN5xiuye8TimeSpec5startE(%rip)
	movq	_ZN5xiuye8TimeSpec5startE(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1529:
	.size	_ZN5xiuye8TimeSpec5beginEv, .-_ZN5xiuye8TimeSpec5beginEv
	.align 2
	.globl	_ZN5xiuye8TimeSpec6to_endEv
	.type	_ZN5xiuye8TimeSpec6to_endEv, @function
_ZN5xiuye8TimeSpec6to_endEv:
.LFB1530:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	clock
	movq	%rax, _ZN5xiuye8TimeSpec3endE(%rip)
	movq	_ZN5xiuye8TimeSpec3endE(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1530:
	.size	_ZN5xiuye8TimeSpec6to_endEv, .-_ZN5xiuye8TimeSpec6to_endEv
	.align 2
	.globl	_ZN5xiuye8TimeSpec5ticksEv
	.type	_ZN5xiuye8TimeSpec5ticksEv, @function
_ZN5xiuye8TimeSpec5ticksEv:
.LFB1531:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_ZN5xiuye8TimeSpec6to_endEv
	movq	_ZN5xiuye8TimeSpec3endE(%rip), %rdx
	movq	_ZN5xiuye8TimeSpec5startE(%rip), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1531:
	.size	_ZN5xiuye8TimeSpec5ticksEv, .-_ZN5xiuye8TimeSpec5ticksEv
	.align 2
	.globl	_ZN5xiuye8TimeSpec7secondsEv
	.type	_ZN5xiuye8TimeSpec7secondsEv, @function
_ZN5xiuye8TimeSpec7secondsEv:
.LFB1532:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_ZN5xiuye8TimeSpec5ticksEv
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1532:
	.size	_ZN5xiuye8TimeSpec7secondsEv, .-_ZN5xiuye8TimeSpec7secondsEv
	.section	.rodata
.LC2:
	.string	") totally costs: "
.LC3:
	.string	") to end ("
.LC4:
	.string	"From beginning ("
.LC5:
	.string	" ticks"
	.text
	.align 2
	.globl	_ZN5xiuye8TimeSpec16print_cost_ticksEv
	.type	_ZN5xiuye8TimeSpec16print_cost_ticksEv, @function
_ZN5xiuye8TimeSpec16print_cost_ticksEv:
.LFB1533:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_ZN5xiuye8TimeSpec5ticksEv
	movq	%rax, %rcx
	movq	_ZN5xiuye8TimeSpec3endE(%rip), %rdx
	movq	_ZN5xiuye8TimeSpec5startE(%rip), %rax
	subq	$8, %rsp
	pushq	$.LC5
	movq	%rcx, %r9
	movl	$.LC2, %r8d
	movq	%rdx, %rcx
	movl	$.LC3, %edx
	movq	%rax, %rsi
	movl	$.LC4, %edi
	call	_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_
	addq	$16, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1533:
	.size	_ZN5xiuye8TimeSpec16print_cost_ticksEv, .-_ZN5xiuye8TimeSpec16print_cost_ticksEv
	.section	.rodata
.LC6:
	.string	" s"
	.text
	.align 2
	.globl	_ZN5xiuye8TimeSpec18print_cost_secondsEv
	.type	_ZN5xiuye8TimeSpec18print_cost_secondsEv, @function
_ZN5xiuye8TimeSpec18print_cost_secondsEv:
.LFB1534:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_ZN5xiuye8TimeSpec7secondsEv
	movapd	%xmm0, %xmm1
	movq	_ZN5xiuye8TimeSpec3endE(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm2
	movapd	%xmm0, %xmm3
	divsd	%xmm2, %xmm3
	movq	_ZN5xiuye8TimeSpec5startE(%rip), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm2
	divsd	%xmm2, %xmm0
	movl	$.LC6, %ecx
	movapd	%xmm1, %xmm2
	movl	$.LC2, %edx
	movapd	%xmm3, %xmm1
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	call	_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1534:
	.size	_ZN5xiuye8TimeSpec18print_cost_secondsEv, .-_ZN5xiuye8TimeSpec18print_cost_secondsEv
	.section	.rodata
	.align 4
	.type	_ZN9__gnu_cxxL21__default_lock_policyE, @object
	.size	_ZN9__gnu_cxxL21__default_lock_policyE, 4
_ZN9__gnu_cxxL21__default_lock_policyE:
	.long	2
	.type	_ZStL13allocator_arg, @object
	.size	_ZStL13allocator_arg, 1
_ZStL13allocator_arg:
	.zero	1
	.type	_ZStL6ignore, @object
	.size	_ZStL6ignore, 1
_ZStL6ignore:
	.zero	1
	.type	_ZStL10defer_lock, @object
	.size	_ZStL10defer_lock, 1
_ZStL10defer_lock:
	.zero	1
	.type	_ZStL11try_to_lock, @object
	.size	_ZStL11try_to_lock, 1
_ZStL11try_to_lock:
	.zero	1
	.type	_ZStL10adopt_lock, @object
	.size	_ZStL10adopt_lock, 1
_ZStL10adopt_lock:
	.zero	1
.LC7:
	.string	"["
.LC8:
	.string	"testOrderRet.cpp"
.LC9:
	.string	":"
.LC10:
	.string	"|"
.LC11:
	.string	"test_ret"
.LC12:
	.string	"Jul 21 2020"
.LC13:
	.string	"/"
.LC14:
	.string	"23:57:59"
.LC15:
	.string	"]"
.LC16:
	.string	"prev rip data=0x"
	.text
	.globl	_Z8test_retv
	.type	_Z8test_retv, @function
_Z8test_retv:
.LFB3603:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3603
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$424, %rsp
	.cfi_offset 3, -24
	movq	$0, -424(%rbp)
#APP
# 15 "testOrderRet.cpp" 1
	movq -8(%rsp),%rax;movq %rax,-424(%rbp);
# 0 "" 2
#NO_APP
	movq	-424(%rbp), %rbx
	leaq	-160(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
.LEHB0:
	call	_ZNSt7__cxx119to_stringEi
.LEHE0:
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-17(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE1:
	leaq	-96(%rbp), %rax
	leaq	-64(%rbp), %rcx
	movl	$.LC8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB2:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE2:
	leaq	-128(%rbp), %rax
	leaq	-96(%rbp), %rcx
	movl	$.LC9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB3:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE3:
	leaq	-192(%rbp), %rax
	leaq	-160(%rbp), %rdx
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB4:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE4:
	leaq	-224(%rbp), %rax
	leaq	-192(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB5:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE5:
	leaq	-256(%rbp), %rax
	leaq	-224(%rbp), %rcx
	movl	$.LC11, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB6:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE6:
	leaq	-288(%rbp), %rax
	leaq	-256(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB7:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE7:
	leaq	-320(%rbp), %rax
	leaq	-288(%rbp), %rcx
	movl	$.LC12, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB8:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE8:
	leaq	-352(%rbp), %rax
	leaq	-320(%rbp), %rcx
	movl	$.LC13, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB9:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE9:
	leaq	-384(%rbp), %rax
	leaq	-352(%rbp), %rcx
	movl	$.LC14, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB10:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE10:
	leaq	-416(%rbp), %rax
	leaq	-384(%rbp), %rcx
	movl	$.LC15, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB11:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE11:
	leaq	-416(%rbp), %rax
	movq	%rbx, %rcx
	movl	$_ZSt3hexRSt8ios_base, %edx
	movl	$.LC16, %esi
	movq	%rax, %rdi
.LEHB12:
	call	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_
.LEHE12:
	leaq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
#APP
# 17 "testOrderRet.cpp" 1
	callq -424(%rbp)
# 0 "" 2
#NO_APP
	jmp	.L59
.L58:
	movq	%rax, %rbx
	leaq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L36
.L57:
	movq	%rax, %rbx
.L36:
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L37
.L56:
	movq	%rax, %rbx
.L37:
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L38
.L55:
	movq	%rax, %rbx
.L38:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L39
.L54:
	movq	%rax, %rbx
.L39:
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L40
.L53:
	movq	%rax, %rbx
.L40:
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L41
.L52:
	movq	%rax, %rbx
.L41:
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L42
.L51:
	movq	%rax, %rbx
.L42:
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L43
.L50:
	movq	%rax, %rbx
.L43:
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L44
.L49:
	movq	%rax, %rbx
.L44:
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L45
.L48:
	movq	%rax, %rbx
.L45:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L46
.L47:
	movq	%rax, %rbx
.L46:
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB13:
	call	_Unwind_Resume
.LEHE13:
.L59:
	addq	$424, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3603:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3603:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3603-.LLSDACSB3603
.LLSDACSB3603:
	.uleb128 .LEHB0-.LFB3603
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3603
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L47-.LFB3603
	.uleb128 0
	.uleb128 .LEHB2-.LFB3603
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L48-.LFB3603
	.uleb128 0
	.uleb128 .LEHB3-.LFB3603
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L49-.LFB3603
	.uleb128 0
	.uleb128 .LEHB4-.LFB3603
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L50-.LFB3603
	.uleb128 0
	.uleb128 .LEHB5-.LFB3603
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L51-.LFB3603
	.uleb128 0
	.uleb128 .LEHB6-.LFB3603
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L52-.LFB3603
	.uleb128 0
	.uleb128 .LEHB7-.LFB3603
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L53-.LFB3603
	.uleb128 0
	.uleb128 .LEHB8-.LFB3603
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L54-.LFB3603
	.uleb128 0
	.uleb128 .LEHB9-.LFB3603
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L55-.LFB3603
	.uleb128 0
	.uleb128 .LEHB10-.LFB3603
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L56-.LFB3603
	.uleb128 0
	.uleb128 .LEHB11-.LFB3603
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L57-.LFB3603
	.uleb128 0
	.uleb128 .LEHB12-.LFB3603
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L58-.LFB3603
	.uleb128 0
	.uleb128 .LEHB13-.LFB3603
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE3603:
	.text
	.size	_Z8test_retv, .-_Z8test_retv
	.section	.rodata
.LC17:
	.string	"main"
.LC18:
	.string	"main address:"
.LC19:
	.string	"test start..."
.LC20:
	.string	"test end..."
	.text
	.globl	main
	.type	main, @function
main:
.LFB3604:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3604
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1208, %rsp
	.cfi_offset 3, -24
	movl	$main, %ebx
	leaq	-960(%rbp), %rax
	movl	$24, %esi
	movq	%rax, %rdi
.LEHB14:
	call	_ZNSt7__cxx119to_stringEi
.LEHE14:
	leaq	-817(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-817(%rbp), %rdx
	leaq	-864(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
.LEHB15:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE15:
	leaq	-896(%rbp), %rax
	leaq	-864(%rbp), %rcx
	movl	$.LC8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB16:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE16:
	leaq	-928(%rbp), %rax
	leaq	-896(%rbp), %rcx
	movl	$.LC9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB17:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE17:
	leaq	-992(%rbp), %rax
	leaq	-960(%rbp), %rdx
	leaq	-928(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB18:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE18:
	leaq	-1024(%rbp), %rax
	leaq	-992(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB19:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE19:
	leaq	-1056(%rbp), %rax
	leaq	-1024(%rbp), %rcx
	movl	$.LC17, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB20:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE20:
	leaq	-1088(%rbp), %rax
	leaq	-1056(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB21:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE21:
	leaq	-1120(%rbp), %rax
	leaq	-1088(%rbp), %rcx
	movl	$.LC12, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB22:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE22:
	leaq	-1152(%rbp), %rax
	leaq	-1120(%rbp), %rcx
	movl	$.LC13, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB23:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE23:
	leaq	-1184(%rbp), %rax
	leaq	-1152(%rbp), %rcx
	movl	$.LC14, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB24:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE24:
	leaq	-1216(%rbp), %rax
	leaq	-1184(%rbp), %rcx
	movl	$.LC15, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB25:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE25:
	leaq	-1216(%rbp), %rax
	movq	%rbx, %rcx
	movl	$_ZSt3hexRSt8ios_base, %edx
	movl	$.LC18, %esi
	movq	%rax, %rdi
.LEHB26:
	call	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_
.LEHE26:
	leaq	-1216(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-1184(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-1152(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-1120(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-992(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-928(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-896(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-864(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-817(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-960(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-560(%rbp), %rax
	movl	$25, %esi
	movq	%rax, %rdi
.LEHB27:
	call	_ZNSt7__cxx119to_stringEi
.LEHE27:
	leaq	-417(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-417(%rbp), %rdx
	leaq	-464(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
.LEHB28:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE28:
	leaq	-496(%rbp), %rax
	leaq	-464(%rbp), %rcx
	movl	$.LC8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB29:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE29:
	leaq	-528(%rbp), %rax
	leaq	-496(%rbp), %rcx
	movl	$.LC9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB30:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE30:
	leaq	-592(%rbp), %rax
	leaq	-560(%rbp), %rdx
	leaq	-528(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB31:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE31:
	leaq	-624(%rbp), %rax
	leaq	-592(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB32:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE32:
	leaq	-656(%rbp), %rax
	leaq	-624(%rbp), %rcx
	movl	$.LC17, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB33:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE33:
	leaq	-688(%rbp), %rax
	leaq	-656(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB34:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE34:
	leaq	-720(%rbp), %rax
	leaq	-688(%rbp), %rcx
	movl	$.LC12, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB35:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE35:
	leaq	-752(%rbp), %rax
	leaq	-720(%rbp), %rcx
	movl	$.LC13, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB36:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE36:
	leaq	-784(%rbp), %rax
	leaq	-752(%rbp), %rcx
	movl	$.LC14, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB37:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE37:
	leaq	-816(%rbp), %rax
	leaq	-784(%rbp), %rcx
	movl	$.LC15, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB38:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE38:
	leaq	-816(%rbp), %rax
	movl	$.LC19, %esi
	movq	%rax, %rdi
.LEHB39:
	call	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_
.LEHE39:
	leaq	-816(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-784(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-752(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-720(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-592(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-496(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-464(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-417(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
.LEHB40:
	call	_Z8test_retv
	leaq	-160(%rbp), %rax
	movl	$27, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx119to_stringEi
.LEHE40:
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	leaq	-17(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
.LEHB41:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE41:
	leaq	-96(%rbp), %rax
	leaq	-64(%rbp), %rcx
	movl	$.LC8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB42:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE42:
	leaq	-128(%rbp), %rax
	leaq	-96(%rbp), %rcx
	movl	$.LC9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB43:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE43:
	leaq	-192(%rbp), %rax
	leaq	-160(%rbp), %rdx
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB44:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
.LEHE44:
	leaq	-224(%rbp), %rax
	leaq	-192(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB45:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE45:
	leaq	-256(%rbp), %rax
	leaq	-224(%rbp), %rcx
	movl	$.LC17, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB46:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE46:
	leaq	-288(%rbp), %rax
	leaq	-256(%rbp), %rcx
	movl	$.LC10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB47:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE47:
	leaq	-320(%rbp), %rax
	leaq	-288(%rbp), %rcx
	movl	$.LC12, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB48:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE48:
	leaq	-352(%rbp), %rax
	leaq	-320(%rbp), %rcx
	movl	$.LC13, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB49:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE49:
	leaq	-384(%rbp), %rax
	leaq	-352(%rbp), %rcx
	movl	$.LC14, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB50:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE50:
	leaq	-416(%rbp), %rax
	leaq	-384(%rbp), %rcx
	movl	$.LC15, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB51:
	call	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
.LEHE51:
	leaq	-416(%rbp), %rax
	movl	$.LC20, %esi
	movq	%rax, %rdi
.LEHB52:
	call	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_
.LEHE52:
	leaq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movl	$0, %eax
	jmp	.L134
.L109:
	movq	%rax, %rbx
	leaq	-1216(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L63
.L108:
	movq	%rax, %rbx
.L63:
	leaq	-1184(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L64
.L107:
	movq	%rax, %rbx
.L64:
	leaq	-1152(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L65
.L106:
	movq	%rax, %rbx
.L65:
	leaq	-1120(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L66
.L105:
	movq	%rax, %rbx
.L66:
	leaq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L67
.L104:
	movq	%rax, %rbx
.L67:
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L68
.L103:
	movq	%rax, %rbx
.L68:
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L69
.L102:
	movq	%rax, %rbx
.L69:
	leaq	-992(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L70
.L101:
	movq	%rax, %rbx
.L70:
	leaq	-928(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L71
.L100:
	movq	%rax, %rbx
.L71:
	leaq	-896(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L72
.L99:
	movq	%rax, %rbx
.L72:
	leaq	-864(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L73
.L98:
	movq	%rax, %rbx
.L73:
	leaq	-817(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-960(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB53:
	call	_Unwind_Resume
.L121:
	movq	%rax, %rbx
	leaq	-816(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L75
.L120:
	movq	%rax, %rbx
.L75:
	leaq	-784(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L76
.L119:
	movq	%rax, %rbx
.L76:
	leaq	-752(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L77
.L118:
	movq	%rax, %rbx
.L77:
	leaq	-720(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L78
.L117:
	movq	%rax, %rbx
.L78:
	leaq	-688(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L79
.L116:
	movq	%rax, %rbx
.L79:
	leaq	-656(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L80
.L115:
	movq	%rax, %rbx
.L80:
	leaq	-624(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L81
.L114:
	movq	%rax, %rbx
.L81:
	leaq	-592(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L82
.L113:
	movq	%rax, %rbx
.L82:
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L83
.L112:
	movq	%rax, %rbx
.L83:
	leaq	-496(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L84
.L111:
	movq	%rax, %rbx
.L84:
	leaq	-464(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L85
.L110:
	movq	%rax, %rbx
.L85:
	leaq	-417(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-560(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.L133:
	movq	%rax, %rbx
	leaq	-416(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L87
.L132:
	movq	%rax, %rbx
.L87:
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L88
.L131:
	movq	%rax, %rbx
.L88:
	leaq	-352(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L89
.L130:
	movq	%rax, %rbx
.L89:
	leaq	-320(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L90
.L129:
	movq	%rax, %rbx
.L90:
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L91
.L128:
	movq	%rax, %rbx
.L91:
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L92
.L127:
	movq	%rax, %rbx
.L92:
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L93
.L126:
	movq	%rax, %rbx
.L93:
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L94
.L125:
	movq	%rax, %rbx
.L94:
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L95
.L124:
	movq	%rax, %rbx
.L95:
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L96
.L123:
	movq	%rax, %rbx
.L96:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	jmp	.L97
.L122:
	movq	%rax, %rbx
.L97:
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
	call	_Unwind_Resume
.LEHE53:
.L134:
	addq	$1208, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3604:
	.section	.gcc_except_table
.LLSDA3604:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3604-.LLSDACSB3604
.LLSDACSB3604:
	.uleb128 .LEHB14-.LFB3604
	.uleb128 .LEHE14-.LEHB14
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB15-.LFB3604
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L98-.LFB3604
	.uleb128 0
	.uleb128 .LEHB16-.LFB3604
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L99-.LFB3604
	.uleb128 0
	.uleb128 .LEHB17-.LFB3604
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L100-.LFB3604
	.uleb128 0
	.uleb128 .LEHB18-.LFB3604
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L101-.LFB3604
	.uleb128 0
	.uleb128 .LEHB19-.LFB3604
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L102-.LFB3604
	.uleb128 0
	.uleb128 .LEHB20-.LFB3604
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L103-.LFB3604
	.uleb128 0
	.uleb128 .LEHB21-.LFB3604
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L104-.LFB3604
	.uleb128 0
	.uleb128 .LEHB22-.LFB3604
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L105-.LFB3604
	.uleb128 0
	.uleb128 .LEHB23-.LFB3604
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L106-.LFB3604
	.uleb128 0
	.uleb128 .LEHB24-.LFB3604
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L107-.LFB3604
	.uleb128 0
	.uleb128 .LEHB25-.LFB3604
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L108-.LFB3604
	.uleb128 0
	.uleb128 .LEHB26-.LFB3604
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L109-.LFB3604
	.uleb128 0
	.uleb128 .LEHB27-.LFB3604
	.uleb128 .LEHE27-.LEHB27
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB28-.LFB3604
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L110-.LFB3604
	.uleb128 0
	.uleb128 .LEHB29-.LFB3604
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L111-.LFB3604
	.uleb128 0
	.uleb128 .LEHB30-.LFB3604
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L112-.LFB3604
	.uleb128 0
	.uleb128 .LEHB31-.LFB3604
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L113-.LFB3604
	.uleb128 0
	.uleb128 .LEHB32-.LFB3604
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L114-.LFB3604
	.uleb128 0
	.uleb128 .LEHB33-.LFB3604
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L115-.LFB3604
	.uleb128 0
	.uleb128 .LEHB34-.LFB3604
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L116-.LFB3604
	.uleb128 0
	.uleb128 .LEHB35-.LFB3604
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L117-.LFB3604
	.uleb128 0
	.uleb128 .LEHB36-.LFB3604
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L118-.LFB3604
	.uleb128 0
	.uleb128 .LEHB37-.LFB3604
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L119-.LFB3604
	.uleb128 0
	.uleb128 .LEHB38-.LFB3604
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L120-.LFB3604
	.uleb128 0
	.uleb128 .LEHB39-.LFB3604
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L121-.LFB3604
	.uleb128 0
	.uleb128 .LEHB40-.LFB3604
	.uleb128 .LEHE40-.LEHB40
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB41-.LFB3604
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L122-.LFB3604
	.uleb128 0
	.uleb128 .LEHB42-.LFB3604
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L123-.LFB3604
	.uleb128 0
	.uleb128 .LEHB43-.LFB3604
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L124-.LFB3604
	.uleb128 0
	.uleb128 .LEHB44-.LFB3604
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L125-.LFB3604
	.uleb128 0
	.uleb128 .LEHB45-.LFB3604
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L126-.LFB3604
	.uleb128 0
	.uleb128 .LEHB46-.LFB3604
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L127-.LFB3604
	.uleb128 0
	.uleb128 .LEHB47-.LFB3604
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L128-.LFB3604
	.uleb128 0
	.uleb128 .LEHB48-.LFB3604
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L129-.LFB3604
	.uleb128 0
	.uleb128 .LEHB49-.LFB3604
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L130-.LFB3604
	.uleb128 0
	.uleb128 .LEHB50-.LFB3604
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L131-.LFB3604
	.uleb128 0
	.uleb128 .LEHB51-.LFB3604
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L132-.LFB3604
	.uleb128 0
	.uleb128 .LEHB52-.LFB3604
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L133-.LFB3604
	.uleb128 0
	.uleb128 .LEHB53-.LFB3604
	.uleb128 .LEHE53-.LEHB53
	.uleb128 0
	.uleb128 0
.LLSDACSE3604:
	.text
	.size	main, .-main
	.section	.text._ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z,"axG",@progbits,_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z,comdat
	.weak	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z
	.type	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z, @function
_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z:
.LFB3678:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3678
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -248(%rbp)
	movq	%rsi, -256(%rbp)
	movq	%rdx, -264(%rbp)
	movq	%rcx, -272(%rbp)
	movq	%r8, -160(%rbp)
	movq	%r9, -152(%rbp)
	testb	%al, %al
	je	.L140
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm1, -128(%rbp)
	movaps	%xmm2, -112(%rbp)
	movaps	%xmm3, -96(%rbp)
	movaps	%xmm4, -80(%rbp)
	movaps	%xmm5, -64(%rbp)
	movaps	%xmm6, -48(%rbp)
	movaps	%xmm7, -32(%rbp)
.L140:
	movq	-264(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, -200(%rbp)
	movl	$32, -232(%rbp)
	movl	$48, -228(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -224(%rbp)
	leaq	-192(%rbp), %rax
	movq	%rax, -216(%rbp)
	leaq	-232(%rbp), %rcx
	movq	-272(%rbp), %rdx
	movq	-264(%rbp), %rsi
	movq	-200(%rbp), %rax
	movq	-256(%rbp), %r8
	movq	%rax, %rdi
.LEHB54:
	call	*%r8
.LEHE54:
	movl	%eax, -204(%rbp)
	leaq	-205(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcEC1Ev
	movl	-204(%rbp), %eax
	movslq	%eax, %rdx
	movq	-200(%rbp), %rax
	leaq	(%rdx,%rax), %rdi
	leaq	-205(%rbp), %rdx
	movq	-200(%rbp), %rsi
	movq	-248(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rdi, %rdx
	movq	%rax, %rdi
.LEHB55:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IPcvEET_S7_RKS3_
.LEHE55:
	leaq	-205(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	jmp	.L141
.L139:
	movq	%rax, %rbx
	leaq	-205(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB56:
	call	_Unwind_Resume
.LEHE56:
.L141:
	movq	-248(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3678:
	.section	.gcc_except_table
.LLSDA3678:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3678-.LLSDACSB3678
.LLSDACSB3678:
	.uleb128 .LEHB54-.LFB3678
	.uleb128 .LEHE54-.LEHB54
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB55-.LFB3678
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L139-.LFB3678
	.uleb128 0
	.uleb128 .LEHB56-.LFB3678
	.uleb128 .LEHE56-.LEHB56
	.uleb128 0
	.uleb128 0
.LLSDACSE3678:
	.section	.text._ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z,"axG",@progbits,_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z,comdat
	.size	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z, .-_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_mPKS8_P13__va_list_tagEmSB_z
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD5Ev,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev:
.LFB3681:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSaIcED2Ev
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3681:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_,comdat
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_, @function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_:
.LFB3837:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv
	movq	%rax, %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv
	addq	%rbx, %rax
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv
	cmpq	%rax, -24(%rbp)
	jbe	.L144
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv
	cmpq	%rax, -24(%rbp)
	ja	.L144
	movl	$1, %eax
	jmp	.L145
.L144:
	movl	$0, %eax
.L145:
	movb	%al, -25(%rbp)
	cmpb	$0, -25(%rbp)
	je	.L146
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmRKS4_
	movq	%rax, %rdi
	call	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	jmp	.L147
.L146:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendERKS4_
	movq	%rax, %rdi
	call	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
.L147:
	movq	-40(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	movq	-40(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3837:
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S9_
	.section	.text._ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_:
.LFB3843:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	16(%rbp), %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3843:
	.size	_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJlS2_lS2_lS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_:
.LFB3844:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movsd	%xmm0, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movsd	%xmm2, -48(%rbp)
	movq	%rcx, -56(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-56(%rbp), %rdx
	movsd	-48(%rbp), %xmm1
	movq	-40(%rbp), %rsi
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rcx, %rdi
	movq	%rax, %xmm0
	call	_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3844:
	.size	_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJdS2_dS2_dS2_EEEvT_DpT0_
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_,comdat
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_, @function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_:
.LFB3880:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKc
	movq	%rax, %rdi
	call	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3880:
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_PKS5_
	.section	.text._ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_
	.type	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_, @function
_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_:
.LFB3881:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3881:
	.size	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_, .-_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcPFRSt8ios_baseSA_EmEEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_
	.type	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_, @function
_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_:
.LFB3882:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3882:
	.size	_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_, .-_ZN5xiuye7printlnINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJPKcEEEvT_DpT0_
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IPcvEET_S7_RKS3_,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_:
.LFB3885:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3885
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
.LEHB57:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	%rcx, %rsi
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_
.LEHE57:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
.LEHB58:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_
.LEHE58:
	jmp	.L158
.L157:
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB59:
	call	_Unwind_Resume
.LEHE59:
.L158:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3885:
	.section	.gcc_except_table
.LLSDA3885:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3885-.LLSDACSB3885
.LLSDACSB3885:
	.uleb128 .LEHB57-.LFB3885
	.uleb128 .LEHE57-.LEHB57
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB58-.LFB3885
	.uleb128 .LEHE58-.LEHB58
	.uleb128 .L157-.LFB3885
	.uleb128 0
	.uleb128 .LEHB59-.LFB3885
	.uleb128 .LEHE59-.LEHB59
	.uleb128 0
	.uleb128 0
.LLSDACSE3885:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IPcvEET_S7_RKS3_,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IPcvEET_S7_RKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IPcvEET_S7_RKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IPcvEET_S7_RKS3_
	.section	.text._ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_,"axG",@progbits,_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_,comdat
	.weak	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	.type	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_, @function
_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_:
.LFB3988:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3988:
	.size	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_, .-_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	.section	.text._ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_:
.LFB3995:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEl
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3995:
	.size	_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIlJPKclS2_lS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_:
.LFB3996:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movsd	%xmm0, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movsd	%xmm1, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movsd	%xmm2, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEd
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-48(%rbp), %rdx
	movsd	-40(%rbp), %xmm0
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rcx, %xmm0
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3996:
	.size	_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIdJPKcdS2_dS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_:
.LFB4009:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4009:
	.size	_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJPFRSt8ios_baseS4_EmEEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIPKcJEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJEEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJEEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJEEEvT_DpT0_:
.LFB4010:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	call	_ZN5xiuye7printlnEv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4010:
	.size	_ZN5xiuye7printlnIPKcJEEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJEEEvT_DpT0_
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_:
.LFB4011:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4011:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_
	.section	.text._ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_:
.LFB4048:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4048:
	.size	_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJlS2_lS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_:
.LFB4050:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movsd	%xmm0, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-40(%rbp), %rcx
	movsd	-32(%rbp), %xmm0
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movapd	%xmm0, %xmm1
	movq	%rdx, %rdi
	movq	%rax, %xmm0
	call	_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4050:
	.size	_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJdS2_dS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_, @function
_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_:
.LFB4052:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEPFRSt8ios_baseS0_E
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnImJEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4052:
	.size	_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_, .-_ZN5xiuye7printlnIPFRSt8ios_baseS2_EJmEEEvT_DpT0_
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type:
.LFB4053:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4053:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPcEEvT_S7_St12__false_type
	.section	.text._ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_:
.LFB4088:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEl
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4088:
	.size	_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIlJPKclS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_:
.LFB4089:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movsd	%xmm1, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEd
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4089:
	.size	_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIdJPKcdS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnImJEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnImJEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnImJEEEvT_DpT0_
	.type	_ZN5xiuye7printlnImJEEEvT_DpT0_, @function
_ZN5xiuye7printlnImJEEEvT_DpT0_:
.LFB4091:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEm
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	call	_ZN5xiuye7printlnEv
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4091:
	.size	_ZN5xiuye7printlnImJEEEvT_DpT0_, .-_ZN5xiuye7printlnImJEEEvT_DpT0_
	.section	.rodata
	.align 8
.LC21:
	.string	"basic_string::_M_construct null not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag:
.LFB4092:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA4092
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_
	testb	%al, %al
	je	.L174
	movq	-48(%rbp), %rax
	cmpq	-56(%rbp), %rax
	je	.L174
	movl	$1, %eax
	jmp	.L175
.L174:
	movl	$0, %eax
.L175:
	testb	%al, %al
	je	.L176
	movl	$.LC21, %edi
.LEHB60:
	call	_ZSt19__throw_logic_errorPKc
.L176:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cmpq	$15, %rax
	jbe	.L177
	leaq	-24(%rbp), %rcx
	movq	-40(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm
.LEHE60:
.L177:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
.LEHB61:
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
.LEHE61:
	movq	%rax, %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcS5_S5_
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB62:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm
.LEHE62:
	jmp	.L182
.L180:
	movq	%rax, %rdi
	call	__cxa_begin_catch
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
.LEHB63:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	call	__cxa_rethrow
.LEHE63:
.L181:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB64:
	call	_Unwind_Resume
.LEHE64:
.L182:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4092:
	.section	.gcc_except_table
	.align 4
.LLSDA4092:
	.byte	0xff
	.byte	0x3
	.uleb128 .LLSDATT4092-.LLSDATTD4092
.LLSDATTD4092:
	.byte	0x1
	.uleb128 .LLSDACSE4092-.LLSDACSB4092
.LLSDACSB4092:
	.uleb128 .LEHB60-.LFB4092
	.uleb128 .LEHE60-.LEHB60
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB61-.LFB4092
	.uleb128 .LEHE61-.LEHB61
	.uleb128 .L180-.LFB4092
	.uleb128 0x1
	.uleb128 .LEHB62-.LFB4092
	.uleb128 .LEHE62-.LEHB62
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB63-.LFB4092
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L181-.LFB4092
	.uleb128 0
	.uleb128 .LEHB64-.LFB4092
	.uleb128 .LEHE64-.LEHB64
	.uleb128 0
	.uleb128 0
.LLSDACSE4092:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT4092:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag
	.section	.text._ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_:
.LFB4121:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4121:
	.size	_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJlS2_EEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_
	.type	_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_, @function
_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_:
.LFB4122:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movsd	%xmm0, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rdi
	movq	%rax, %xmm0
	call	_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4122:
	.size	_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_, .-_ZN5xiuye7printlnIPKcJdS2_EEEvT_DpT0_
	.section	.text._ZN9__gnu_cxx17__is_null_pointerIcEEbPT_,"axG",@progbits,_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_,comdat
	.weak	_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_
	.type	_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_, @function
_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_:
.LFB4124:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4124:
	.size	_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_, .-_ZN9__gnu_cxx17__is_null_pointerIcEEbPT_
	.section	.text._ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_,"axG",@progbits,_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_,comdat
	.weak	_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_
	.type	_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_, @function
_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_:
.LFB4125:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4125:
	.size	_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_, .-_ZSt8distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_
	.section	.text._ZN5xiuye7printlnIlJPKcEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_
	.type	_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_, @function
_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_:
.LFB4151:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEl
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4151:
	.size	_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_, .-_ZN5xiuye7printlnIlJPKcEEEvT_DpT0_
	.section	.text._ZN5xiuye7printlnIdJPKcEEEvT_DpT0_,"axG",@progbits,_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_,comdat
	.weak	_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_
	.type	_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_, @function
_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_:
.LFB4152:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEd
	movq	%rax, %rdx
	movzbl	_ZN5xiuye17println_sepetatorE(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5xiuye7printlnIPKcJEEEvT_DpT0_
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4152:
	.size	_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_, .-_ZN5xiuye7printlnIdJPKcEEEvT_DpT0_
	.section	.text._ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_,"axG",@progbits,_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_,comdat
	.weak	_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_
	.type	_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_, @function
_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_:
.LFB4153:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4153:
	.size	_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_, .-_ZSt19__iterator_categoryIPcENSt15iterator_traitsIT_E17iterator_categoryERKS2_
	.section	.text._ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag,"axG",@progbits,_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag,comdat
	.weak	_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag
	.type	_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag, @function
_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag:
.LFB4154:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4154:
	.size	_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag, .-_ZSt10__distanceIPcENSt15iterator_traitsIT_E15difference_typeES2_S2_St26random_access_iterator_tag
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB4181:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L197
	cmpl	$65535, -8(%rbp)
	jne	.L197
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L197:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4181:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I__ZN5xiuye17println_sepetatorE, @function
_GLOBAL__sub_I__ZN5xiuye17println_sepetatorE:
.LFB4182:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4182:
	.size	_GLOBAL__sub_I__ZN5xiuye17println_sepetatorE, .-_GLOBAL__sub_I__ZN5xiuye17println_sepetatorE
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN5xiuye17println_sepetatorE
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
