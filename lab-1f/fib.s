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



exi:
    mov r0,r6
	pop { r4, r5, r6, pc}		@EPILOG

.L3:
	mov r0, #0			        @ R0 = 0
.L4:
	pop { r4, r5, r6, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
