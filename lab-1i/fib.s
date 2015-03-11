	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

	@ r3(n1), r4(n2), r5(sum), r6(i)
	mov r3, #-1		@ r3 == n1  
	mov r4, #1		@ r4 == n2
	mov r5, #0		@ r5 == sum
	mov r6, #0		@ r6 == i
.loop:
	add r5, r3, r4		@ sum = n1 + n2
	mov r3, r4		@ n1 = n2
	mov r4, r5		@ n2 = sum
	add r6, r6, #1		@ i = i + 1
	
	CMP r0, r6 		@ x-i>0 means i < x
	it ge			@ if i <= x
	bge .loop		@ next cycle

	mov r0, r5		@ r0 is the return value
	pop {r3, r4, r5, r6, pc}	@ EPILOG

	.size fibonacci, .-fibonacci
	.end
