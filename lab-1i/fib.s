	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push { r4, r5, r6, lr}

    cmp r0,#0                   @n<=0, f(n)=0
    ble .L3
    cmp r0,#1                   @n=1, f(n)=1
    beq .L4

    mov r4,#1                   @Fn-2
    mov r5,#1                   @Fn-1
    mov r6,#1                   @Fn
loop:
    subs r0,r0,#1
    beq exi
    add r6,r5,r4
    mov r4,r5
    mov r5,r6
    b loop
exi:
    mov r0,r6
	pop { r4, r5, r6, pc}		@EPILOG

.L3:
	mov r0, #0			        @ R0 = 0
.L4:
	pop { r4, r5, r6, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
