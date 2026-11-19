# 2026. 11. 19. 수업 내용

## MASM 32비트 사칙연산 및 레지스터 출력 프로그램

Visual Studio 및 Irvine32 라이브러리 환경에서 동작하는 x86 어셈블리(MASM) 프로그램.  
  
사용자로부터 두 개의 정수를 입력받아 사칙연산(덧셈, 뺄셈, 곱셈, 나눗셈 몫과 나머지)을 수행하고, 연산 결과와 레지스터 상태를 화면에 출력한다.

---

### 🛠️ 개발 환경
* **Language:** MASM (Microsoft Macro Assembler)
* **Library:** Irvine32 (`Irvine32.inc`)
* **IDE:** Visual Studio (MASM 설정 완료된 환경)

---

### 📋 기능 요약
1. **정수 입력:** 사용자로부터 두 개의 32비트 부호 있는 정수(`SDWORD`)를 입력받는다.
2. **사칙연산 수행:**
   - 덧셈 (`add`)
   - 뺄셈 (`sub`)
   - 곱셈 (`imul`)
   - 나눗셈 몫 및 나머지 (`cdq`, `idiv`)
3. **결과 출력:** 각 연산 결과를 `WriteInt`를 통해 콘솔에 출력한다.
4. **레지스터 상태 출력 (`DumpRegs`):** 실행 시점의 CPU 레지스터(`EAX`, `EBX`, `ECX`, `EDX` 등) 상태를 한눈에 확인할 수 있다. (※ `AX`, `BX`, `CX`, `DX`는 32비트 확장 레지스터인 `EAX`, `EBX`, `ECX`, `EDX`의 하위 16비트 영역에 포함)

---

### 📝 소스 코드 (`main.asm`)

```assembly
INCLUDE irvine32.inc

.data
	p1	BYTE "1번째 정수 입력 : ", 0
	p2	BYTE "2번째 정수 입력 : ", 0
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
	cdq                 ; EAX를 부호 확장해서 EDX:EAX로 만듦
	idiv val2
	push edx            ; 나머지는 EDX에 저장, 출력을 위해 잠시 스택에 저장

	mov edx, OFFSET strDiv
	call WriteString
	call WriteInt       ; 몫 출력
	call CrLf

	; 나머지
	mov edx, OFFSET strMod
	call WriteString
	pop eax             ; 스택에 저장해둔거 EAX에 가져와서 출력
	call WriteInt
	call CrLf
	call CrLf

	; 레지스터 출력
	mov edx, OFFSET msgRegs
	call WriteString
	call CrLf
	
	call DumpRegs       ; 레지스터 상태 출력

	exit
main ENDP
END main
```

### 📝 실행 결과
```cmd
1번째 정수 입력 : 20
2번째 정수 입력 : 7

덧셈 결과 : +27
뻴셈 결과 : +13
곱셈 결과 : +140
나눗셈 몫 : +2
나눗셈 나머지 : +6

----- 레지스터 상태 (DumpRegs) -----

  EAX=00000006  EBX=00865000  ECX=00A910FF  EDX=00A9608D
  ESI=00A910FF  EDI=00A910FF  EBP=00B9FC48  ESP=00B9FC3C
  EIP=00A93739  EFL=00000202  CF=0  SF=0  ZF=0  OF=0  AF=0  PF=0
```

<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/05130870-d1d1-435d-94b0-32ec8829ac4b" />
