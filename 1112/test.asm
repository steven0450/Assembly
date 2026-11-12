INCLUDE Irvine32.inc

.data
    prompt    BYTE "5개의 숫자를 입력하세요 (Enter로 구분):", 0dh, 0ah, 0
    msgOutput BYTE "입력된 숫자들:", 0dh, 0ah, 0
    msgAvg    BYTE "평균: ", 0
    space     BYTE " ", 0
    numbers   SDWORD 5 DUP(?)    ; 5개의 숫자를 저장할 배열
    sum       SDWORD 0           ; 합계를 저장할 변수
    average   SDWORD 0           ; 평균을 저장할 변수

.code
main PROC
    ; 1. 안내 메시지 출력
    mov edx, OFFSET prompt
    call WriteString

    ; 2. 5개의 숫자를 입력받고 배열에 저장하며 합계 누적
    mov ecx, 5                 ; 반복 횟수 5번
    mov esi, OFFSET numbers    ; 배열 시작 주소
    xor ebx, ebx               ; EBX를 합계 누적용으로 사용 (0으로 초기화)

InputLoop:
    call ReadInt               ; 정수 입력 (결과 EAX)
    mov [esi], eax             ; 배열에 저장
    add ebx, eax               ; sum += 입력값
    add esi, TYPE SDWORD       ; 다음 주소로 이동 (4바이트)
    loop InputLoop

    ; 3. 평균 계산 (총합 / 5)
    mov eax, ebx               ; 총합을 EAX에 로드
    cdq                        ; EAX를 EDX:EAX로 부호 확장 (signed division 준비)
    mov ecx, 5
    idiv ecx                   ; EAX = 총합 / 5 (몫이 EAX에 저장됨)
    mov average, eax           ; 평균 저장

    ; 4. 입력된 숫자들 출력
    call Crlf
    mov edx, OFFSET msgOutput
    call WriteString

    mov ecx, 5
    mov esi, OFFSET numbers

OutputLoop:
    mov eax, [esi]
    call WriteInt
    mov edx, OFFSET space
    call WriteString
    add esi, TYPE SDWORD
    loop OutputLoop

    ; 5. 평균 출력
    call Crlf
    mov edx, OFFSET msgAvg
    call WriteString
    mov eax, average
    call WriteInt
    call Crlf

    exit
main ENDP
END main
