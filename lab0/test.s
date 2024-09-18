.file "test.c"
.option nopic
.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
.attribute unaligned_access, 0
.attribute stack_align, 16

.section .rodata.str1.8, "aMS", @progbits, 1
.align 3
.LC0:
.string "%d %d %d %d"
.LC1:
.string "Squared Euclidean distance is: %d\n"

.section .text.startup, "ax", @progbits
.align 1
.globl main
.type main, @function
main:
    # Allocate stack space
    addi sp, sp, -16
    sd ra, 8(sp)      # Save ra (return address) at 8(sp)

    # Load address of format string into a0
    lui a0, %hi(.LC0)
    addi a0, a0, %lo(.LC0)

    # Load addresses of variables into a1, a2, a3, a4
    lui a1, %hi(x1)
    addi a1, a1, %lo(x1)
    lui a2, %hi(y1)
    addi a2, a2, %lo(y1)
    lui a3, %hi(x2)
    addi a3, a3, %lo(x2)
    lui a4, %hi(y2)
    addi a4, a4, %lo(y2)

    # Call __isoc99_scanf with format string and variable addresses
    call __isoc99_scanf

    # Load coordinates from memory into temporary registers
    lw t0, 0(a1)      # Load x1 into t0
    lw t1, 0(a2)      # Load y1 into t1
    lw t2, 0(a3)      # Load x2 into t2
    lw t3, 0(a4)      # Load y2 into t3

    # Compute (x2 - x1) and (y2 - y1)
    sub t4, t2, t0    # t4 = x2 - x1
    sub t5, t3, t1    # t5 = y2 - y1

    # Compute (x2 - x1)^2 and (y2 - y1)^2
    mul t6, t4, t4    # t6 = (x2 - x1)^2
    mul t0, t5, t5    # t0 AS t7 = (y2 - y1)^2

    # Compute the sum of squares
    add a1, t6, t0    # a1 = (x2 - x1)^2 + (y2 - y1)^2

    # Print the result
    lui a0, %hi(.LC1)
    addi a0, a0, %lo(.LC1)
    call printf

    # Restore stack and return
    ld ra, 8(sp)      # Restore ra
    li a0, 0
    addi sp, sp, 16   # Deallocate stack space
    jr ra
.size main, .-main

.globl x1
.globl y1
.globl x2
.globl y2
.section .sbss, "aw", @nobits
.align 2
.type x1, @object
.size x1, 4
x1:
.zero 4
.type y1, @object
.size y1, 4
y1:
.zero 4
.type x2, @object
.size x2, 4
x2:
.zero 4
.type y2, @object
.size y2, 4
y2:
.zero 4
.ident "GCC: () 12.2.0"
.section .note.GNU-stack, "", @progbit
