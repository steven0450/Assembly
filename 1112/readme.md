# 2026. 11. 12. 수업 내용

## 5개의 숫자 입출력 프로그램

Microsoft Macro Assembler(MASM)와 **Irvine32 라이브러리**를 사용하여 사용자로부터 5개의 정수를 입력받고,
이를 배열에 저장한 뒤 다시 화면에 출력하는 32비트 어셈블리 프로그램

---

### 🛠️ 개발 환경

- **어셈블러:** MASM (ml.exe / ml64.exe)
- **라이브러리:** Irvine32
- **IDE:** Visual Studio 2026

---

### 📄 소스 코드 (`main.asm`)

```asm
INCLUDE Irvine32.inc

.data
    prompt    BYTE "5개의 숫자를 입력하세요 (Enter로 구분):", 0dh, 0ah, 0
    msgOutput BYTE "입력된 숫자들:", 0dh, 0ah, 0
    space     BYTE " ", 0
    numbers   SDWORD 5 DUP(?)    ; 32비트 부호 있는 정수 5개를 저장할 배열

.code
main PROC
    ; 1. 안내 메시지 출력
    mov edx, OFFSET prompt
    call WriteString

    ; 2. 5개의 숫자를 입력받아 배열에 저장 (Loop)
    mov ecx, 5                 ; 반복 횟수 5번
    mov esi, OFFSET numbers    ; 배열의 시작 주소를 ESI에 저장

InputLoop:
    call ReadInt               ; 사용자로부터 정수 입력 받음 (결과는 EAX)
    mov [esi], eax             ; 입력받은 값을 배열 현재 위치에 저장
    add esi, TYPE SDWORD       ; 다음 배열 요소 주소로 이동 (4바이트 증가)
    loop InputLoop             ; ECX를 1 감소시키고 0이 아니면 InputLoop로 분기

    ; 3. 출력 안내 메시지 출력
    call Crlf                  ; 줄바꿈
    mov edx, OFFSET msgOutput
    call WriteString

    ; 4. 배열에 저장된 5개의 숫자 출력 (Loop)
    mov ecx, 5                 ; 반복 횟수 5번
    mov esi, OFFSET numbers    ; 배열의 시작 주소로 초기화

OutputLoop:
    mov eax, [esi]             ; 배열에서 현재 숫자를 EAX로 로드
    call WriteInt              ; EAX의 값을 화면에 출력
    mov edx, OFFSET space      ; 숫자 사이에 공백 출력
    call WriteString
    add esi, TYPE SDWORD       ; 다음 배열 요소 주소로 이동
    loop OutputLoop            ; ECX 감소 및 반복

    call Crlf                  ; 줄바꿈
    exit                       ; 프로그램 종료
main ENDP
END main
```

---

### 📄 실행 결과
```cmd
5개의 숫자를 입력하세요 (Enter로 구분):
10
-25
100
0
55

입력된 숫자들:
10 -25 100 0 55 
Press any key to continue . . .
```

<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/8597611d-2888-41f0-b15f-9dc25b31530d" />

