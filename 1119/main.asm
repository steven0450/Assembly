INCLUDE irvine32.inc

.data
	p1		BYTE "1번째 정수 입력 : ", 0
	p2		BYTE "2번째 정수 입력 : ", 0
	strAdd	BYTE "덧셈 결과 : ", 0
	strSub	BYTE "뻴셈 결과 : ", 0
	strMul	BYTE "곱셈 결과 : ", 0
	strDiv	BYTE "나눗셈 몫 : ", 0
	strMod	BYTE "나눗셈 나머지 : ", 0
	msgRegs	BYTE "----- 레지스터 상태 (DumpRegs) -----", 0

	val1	SDWORD ?
	val2	SDWORD ?

.code
main PROC
	; 1번째 숫자 입력
	mov edx, OFFSET p1
	call WriteString
	call ReadInt
	mov val1, eax

	; 2번째 숫자 입력
	mov edx, OFFSET p2
	call WriteString
	call ReadInt
	mov val2, eax

	call CrLf

	; 덧셈
	mov eax, val1
	add eax, val2
	mov edx, OFFSET strAdd
	call WriteString
	call WriteInt
	call CrLf

	; 뻴셈
	mov eax, val1
	sub eax, val2
	mov edx, OFFSET strSub
	call WriteString
	call WriteInt
	call CrLf

	; 곱
	mov eax, val1
	imul val2
	mov edx, OFFSET strMul
	call WriteString
	call WriteInt
	call CrLf

	; 나눗셈
	mov eax, val1
	cdq; EAX를 부호 확장해서 EDX:EAX로 만듦
	idiv val2
	push edx; 나머지는 EDX에 저장, 출력을 위해 잠시 스택에 저장

	mov edx, OFFSET strDiv
	call WriteString
	call WriteInt; 몫 출력
	call CrLf

	; 나머지
	mov edx, OFFSET strMod
	call WriteString
	pop eax; 스택에 저장해둔거 EAX에 가져와서 출력
	call WriteInt
	call CrLf
	call CrLf

	;레지스터 출력
	mov edx, OFFSET msgRegs
	call WriteString
	call CrLf

	call DumpRegs

	exit
main ENDP
END main

