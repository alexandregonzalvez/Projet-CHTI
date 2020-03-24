	thumb
	AREA code_somme, code, READONLY
	export somme
	extern TabSin
	extern TabCos

somme proc
	ldr r2, =TabSin
	ldr r3, =TabCos
	mov r1, #2
	mul r4, r0, r1
	
	ldr r5, [r2, r4]
	ldr r6, [r3, r4]
	
	mul r4, r5, r5
	mul r5, r6, r6
	
	add r0, r4, r5
	
	bx lr
	endp
	end