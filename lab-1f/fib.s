	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push { r4, r5, r6, r7, r8, lr}

    cmp r0,#0                   @n<=0, f(n)=0
    ble .L3

    @invariants ,m(current Fibonacci) start as 1
    mov r5,#1                   @r5 = F(m)
    mov r6,#1                   @r6 = F(m+1)

    clz r4,r0                   @count leading zero of r0
                                @really surprised this operation exists
    rsbs r4,r4,#30              @(start looking second digit ,skip m=0)
    blt exit                    @when r0 = 1 ,skip
loop:    
    @doubling Fibonacci here
    rsb r7,r5,r6,LSL #1     @r7 = r6<<1-r5
    mul r7,r5,r7            @r7 = r5*r7 = r5*(2*r6-r5) = F(2m)

    mul r8,r5,r5            @r8 = r5^2
    mla r8,r6,r6,r8         @r8 = r6^2 + r5^2 = F(2m+1)

    @update a,b : m*=2
    mov r5,r7
    mov r6,r8

    @advance one conditionally
    lsr r7,r0,r4
    tst r7,#1
    beq no_adv
    add r7,r5,r6
    mov r5,r6               @r7 = F(m+1)
    mov r6,r7               @r8 = F(m+2) ,m++
no_adv:
    cbz r4,exit
    sub r4,r4,#1
    b loop

exit:
    mov r0,r5
	pop { r4, r5, r6, r7, r8, pc}
.L3:
	mov r0, #0			            @ R0 = 0
	pop { r4, r5, r6, r7, r8, pc}

	.size fibonacci, .-fibonacci
	.end
