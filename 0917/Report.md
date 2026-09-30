# Report

### 1. Provide examples of three different instruction mnemonics.
> MOV, ADD, SUB

### 2. What is a calling convention, and how is it used in assembly language declarations?
> 함수 호출 시 매개변수 전달 순서 및 스택 정리 주체를 정의한 규칙, .MODEL 지시자 뒤에 지정하여 사용

### 3. How do you reserve space for the stack in a program?
> .STACK 지시자로 원하는 바이트 크기 지정해서 공간 확보

### 4. Explain why the term assembler language is not quite correct.
> 어셈블러 = 기계어를 생성하는 번역 프로그램. 언어 이름은 어셈블리 언어이므로, 프로그램 이름을 언어 이름으로 쓰는건 잘못됨.

### 5. Explain the difference between big endian and little endian. Also, look up the origins of this term on the Web.
> 차이점 : 빅 에디안은 최상위 바이트를 낮은 주소에, 리틀 에디안은 최하위 바이트를 낮은 주소에 저장.
>
> 유래 : 소설 <걸리버 여행기>에서 계란의 뾰족한 끝과 뭉툭한 끝 중 어느 쪽을 깨야되는지 싸운 전쟁에서 착안.

### 6. Why might you use a symbolic constant rather than an integer literal in your code?
> 가독성을 높이고, 값 변경 시 한 곳만 수정하여 유지보수를 용이하게 만들기 위해

### 7. How is a source file different from a listing file?
> 소스 파일 = 텍스트 파일
>
> 리스팅 파일 = 어셈블러가 생성한 소스 코드, 기계어, 오프셋 주소 등이 포함된 상세 파일

### 8. How are data labels and code labels different?
> 데이터 레이블 = 영역의 변수 이름 (콜론이 붙지 않음)
>
> 코드 레이블 = 영역의 실행 위치 (콜론 붙음)

### 9. (True/False): An identifier cannot begin with a numeric digit.
> True

### 10. (True/False): A hexadecimal literal may be written as 0x3A.
> False

### 11. (True/False): Assembly language directives execute at runtime.
> False

### 12. (True/False): Assembly language directives can be written in any combination of uppercase and lowercase letters.
> True

### 13. Name the four basic parts of an assembly language instruction.
> 레이블, 명령어 연상 기호, 피연산자, 주석

### 14. (True/False): MOV is an example of an instruction mnemonic.
> True

### 15. (True/False): A code label is followed by a colon (:), but a data label does not end with a colon.
> True

### 16. Show an example of a block comment.
> COMMENT ! 이 부분은 블록 주석입니다. !

### 17. Why is it not a good idea to use numeric addresses when writing instructions that access variables?
> 데이터 위치가 바뀌면 이상한 위치를 참조하게 되고, 가독성 떨어짐

### 18. What type of argument must be passed to the ExitProcess procedure?
> 32비트 부호 없는 정수 (DWORD) 형식의 반환 코드(Exit code)

### 19. Which directive ends a procedure?
> ENDP

### 20. In 32-bit mode, what is the purpose of the identifier in the END directive?
> 프로그램 시작점을 지정하는 역활

### 21. What is the purpose of the PROTO directive?
> 프로시저의 시그니처를 미리 선언하여 안전하게 호출하도록 도움주는 역활

### 22. (True/False): An Object file is produced by the Linker.
> False

### 23. (True/False): A Listing file is produced by the Assembler.
> True

### 24. (True/False): A link library is added to a program just before producing an Executable file.
> True

### 25. Which data directive creates a 32-bit signed integer variable?
> DWORD

### 26. Which data directive creates a 16-bit signed integer variable?
> WORD

### 27. Which data directive creates a 64-bit unsigned integer variable?
> QWORD

### 28. Which data directive creates an 8-bit signed integer variable?
> SBYTE

### 29. Which data directive creates a 10-byte packed BCD variable
> TBYTE
