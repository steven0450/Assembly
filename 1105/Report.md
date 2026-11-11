# Report

## 8.10.1. Short Answer
### 1. Which statements belong in a procedure’s epilogue when the procedure has stack parameters and local variables?
> mov esp, ebp, pop ebp, ret n

### 2. When a C function returns a 32-bit integer, where is the return value stored?
> EAX

### 3. How does a program using the STDCALL calling convention clean up the stack after a procedure call?
> 호출된 함수 내부에서 ret n 명령어를 사용하여 리턴 시 스택 프레임에 있는 파라미터 크기(n)만큼 스택 포인터(ESP)를 자동으로 정리한다.

### 4. How is the LEA instruction more powerful than the OFFSET operator?
> OFFSET은 컴파일/어셈블 시점의 고정된 정적 주소 상수만 얻을 수 있는 반면, LEA는 실행 시점에 간접 주소 지정 방식을 통해 동적으로 유효 주소 계산 가능

### 5. In the C++ example shown in Section 8.2.3, how much stack space is used by a variable of type int?
> 4바이트

### 6. What advantages might the C calling convention have over the STDCALL calling convention?
> C 가변 함수(예: printf, scanf 등)처럼 가변적인 개수의 파라미터)를 전달하는 함수 구현 가능

### 7. (True/False): When using the PROC directive, all parameters must be listed on the same line.
> false

### 8. (True/False): If you pass a variable containing the offset of an array of bytes to a procedurethat expects a pointer to an array of words, the assembler will flag this as an error.
> false

### 9. (True/False): If you pass an immediate value to a procedure that expects a reference parameter, you can generate a general-protection fault.
> true

## 8.10.2 Algorithm Workbench

### 1. Here is a calling sequence for a procedure named AddThree that adds three doublewords (assume that the STDCALL calling convention is used):
```asm   
push 10h
push 20h
push 30h
call AddThree
```
Draw a picture of the procedure’s stack frame immediately after EBP has been pushed on the runtime stack.

### 2. Create a procedure named AddThree that receives three integer parameters and calculates and returns their sum in the EAX register.

### 3. Declare a local variable named pArray that is a pointer to an array of doublewords.

### 4. Declare a local variable named buffer that is an array of 20 bytes.
```asm
ADDR
ENTER
INVOKE
LEA
LEAVE
LOCAL
PROC
PROTO
RET
USES
```

### 5. Declare a local variable named pwArray that points to a 16-bit unsigned integer.

### 6. Declare a local variable named myByte that holds an 8-bit signed integer.
### 7. Declare a local variable named myArray that is an array of 20 doublewords.
### 8. Create a procedure named SetColor that receives two stack parameters: forecolor and backcolor, and calls the SetTextColor procedure from the Irvine32 library.
### 9. Create a procedure named WriteColorChar that receives three stack parameters: char, forecolor, and backcolor. It displays a single character, using the color attributes specified in forecolor and backcolor.
### 10. Write a procedure named DumpMemory that encapsulates the DumpMem procedure in the Irvine32 library. Use declared parameters and the USES directive. The following is an example of how it should be called: INVOKE DumpMemory, OFFSET array, LENGTHOF array, TYPE array.
### 11. Declare a procedure named MultArray that receives two pointers to arrays of doublewords, and a third parameter indicating the number of array elements. Also, create a PROTO declaration for this procedure.
