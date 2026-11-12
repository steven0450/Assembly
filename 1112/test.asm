INCLUDE Irvine32.inc

.data
	prompt BYTE "5개의 숫자를 입력해주세요.", 0dh, 0ah, 0
	msgOutput BYTE "입력된 숫자들 : ", 0dh, 0ah, 0
	space BYTE " ", 0
	numbers SDWORD 5 DUP(?);

.code
main PROC
	;
	mov edx, OFFSET prompt
	call WriteString

	;
	mov ecx, 5;
	mov esi, OFFSET numbers;

InputLoop:
	call ReadInt;
	mov [esi], eax;
	add esi, TYPE SDWORD;
	loop InputLoop;

	;
	call Crlf;
	mov edx, OFFSET msgOutput
	call WriteString

	;
	mov ecx, 5;
	mov esi, OFFSET numbers;

OutputLoop:
	mov eax, [esi];
	call WriteInt;
	mov edx, OFFSET space;
	call WriteString
	add esi, TYPE SDWORD;
	loop OutputLoop;

	call Crlf;
	exit;

main ENDP
END main