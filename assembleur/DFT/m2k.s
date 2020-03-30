	thumb
	AREA code_m2k, code, READONLY	
	export m2k
	extern somme_partie_reelle
	extern somme_partie_imaginaire
		
m2k proc
	mov r4, #0
	mov r5, #0
	mov r3, r0
	b somme_partie_reelle
	smlal r4, r5, r0, r0
	mov r0, r3
	b somme_partie_imaginaire
	umlal r4, r5, r0, r0 
	mov r0, r5
	bx lr
	endp
	end
	