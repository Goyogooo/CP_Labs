	.file	"test1.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%lf %lf %lf %lf"
	.align	3
.LC1:
	.string	"%lf\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	addi	a4,s0,-56
	addi	a3,s0,-48
	addi	a2,s0,-40
	addi	a5,s0,-32
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	__isoc99_scanf
	fld	fa4,-48(s0)
	fld	fa5,-32(s0)
	fsub.d	fa4,fa4,fa5
	fld	fa3,-48(s0)
	fld	fa5,-32(s0)
	fsub.d	fa5,fa3,fa5
	fmul.d	fa4,fa4,fa5
	fld	fa3,-56(s0)
	fld	fa5,-40(s0)
	fsub.d	fa3,fa3,fa5
	fld	fa2,-56(s0)
	fld	fa5,-40(s0)
	fsub.d	fa5,fa2,fa5
	fmul.d	fa5,fa3,fa5
	fadd.d	fa5,fa4,fa5
	fsd	fa5,-24(s0)
	ld	a1,-24(s0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: () 12.2.0"
	.section	.note.GNU-stack,"",@progbits
