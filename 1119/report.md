# 10. Report
## Short Answer

### 1. What is the purpose of the STRUCT directive?
> 서로 다른 자료형을 가질 수 있는 하나 이상의 필드를 포함하는 사용자 정의 구조체 템플릿을 정의하기 위해

### 2. Assume that the following structure has been defined:
```asm
RentalInvoice STRUCT
invoiceNum BYTE 5 DUP(' ')
dailyPrice WORD ?
daysRented WORD ?
RentalInvoice ENDS
```
State whether or not each of the following declarations is valid:  
> a. rentals RentalInvoice <> 유효  
> b. RentalInvoice rentals <>  유효x
> c. march RentalInvoice <'12345',10,0> 유효  
> d. RentalInvoice <,10,0> 유효x  
> e. current RentalInvoice <,15,0,0> 유효x  

### 3. (True/False): A macro cannot contain data definitions.
> false

### 4. What is the purpose of the LOCAL directive?
> 매크로가 여러 번 호출될 때 레이블 중복 정의 오류가 발생하지 않도록

### 5. Which directive displays a message on the console during the assembly step?
> echo

### 6. Which directive marks the end of a conditional block of statements?
> ENDIF

### 7. List all the relational operators that can be used in constant boolean expressions.
> EQ, NE, LT, LE, GT, GE

### 8. What is the purpose of the & operator in a macro definition?
> 문자열 리터럴 내부나 인접한 텍스트·식별자 속에서 매개변수 치환이 일어나도록

### 9. What is the purpose of the ! operator in a macro definition?
> 바로 뒤에 오는 문자를 전처리기 연산자가 아닌 일반 문자 그대로 처리하게 하도록

### 10. What is the purpose of the % operator in a macro definition?
> 상수 표현식을 계산하거나 텍스트 매크로를 확장하여 그 결과값을 치환

## Algorithm Workbench
### 1. Create a structure named SampleStruct containing two fields: field1, a single 16-bit WORD, and field2, an array of 20 32-bit DWORDs. The initial values of the fields may be left undefined.
```asm
SampleStruct STRUCT
  field1 WORD ?
  field2 DWORD 20 DUP(?)
SampleStruct ENDS
```

### 2. Write a statement that retrieves the wHour field of a SYSTEMTIME structure.
```asm
movzx eax, sysTime.wHour
```
### 3. Using the following Triangle structure, declare a structure variable and initialize its vertices to (0,0), (5, 0), and (7,6):
```asm
Triangle STRUCT
Vertex1 COORD <>
Vertex2 COORD <>
Vertex3 COORD <>
Triangle ENDS
```

답
```asm
tri Triangle < <0,0>, <5,0>, <7,6> >
```

### 4. Declare an array of Triangle structures. Write a loop that initializes Vertex1 of each triangle to random coordinates in the range (0...10, 0...10).
```asm
NUM_TRI EQU 10
triList Triangle NUM_TRI DUP(<>)
...
mov ecx, NUM_TRI
mov esi, 0
L1:
  mov eax, 11
  call RandomRange
  mov triList[esi].Vertex1.X, ax
  mov eax, 11
  call RandomRange
  mov triList[esi].Vertex1.Y, ax
  add esi, TYPE Triangle
  loop L1
```

### 5. Write a macro named mPrintChar that displays a single character on the screen. It should have two parameters: this first specifies the character to be displayed and the second specifies how many times the character should be repeated. Here is a sample call:
```asm
mPrintChar 'X',20
```

답
```asm
mPrintChar MACRO char:REQ, count:REQ
  LOCAL L1
  push ecx
  push eax
  mov ecx, count
  mov al, char
L1:
  call WriteChar
  loop L1
  pop eax
  pop ecx
ENDM
```

### 6. Write a macro named mGenRandom that generates a random integer between 0 and n  1. Let n be the only parameter.
```asm
mGenRandom MACRO n:REQ
  mov eax, n
  call RandomRange
ENDM
```

### 7. Write a macro named mPromptInteger that displays a prompt and inputs an integer from the user. Pass it a string literal and the name of a doubleword variable. Sample call:
```asm
.data
minVal DWORD ?
.code
mPromptInteger "Enter the minimum value", minVal
```

답
```asm
mPromptInteger MACRO prompt:REQ, dest:REQ
  mWrite prompt
  call Crlf
  call ReadInt
  mov dest, eax
ENDM
```

### 8. Write a macro named mWriteAt that locates the cursor and writes a string literal to the console window. Suggestion: Invoke the mGotoxy and mWrite macros from the book’s macro library.
```asm
mWriteAt MACRO col:REQ, row:REQ, text:REQ
  mGotoxy col, row
  mWrite text
ENDM
```

### 9. Show the expanded code produced by the following statement that invokes the mWriteString macro from Section 10.2.5:
```asm
mWriteStr namePrompt
```

답
```asm
push edx
  mov edx, OFFSET namePrompt
  call WriteString
  pop edx
```

### 10. Show the expanded code produced by the following statement that invokes the mReadString macro from Section 10.2.5:
```asm
mReadStr customerName
```

답
```asm
push ecx
  push edx
  mov ecx, SIZEOF customerName - 1
  mov edx, OFFSET customerName
  call ReadString
  pop edx
  pop ecx
```

### 11. Write a macro named mDumpMemx that receives a single parameter, the name of a variable. Your macro must call the mDumpMem macro from the book’s library, passing it the variable’s offset, number of units, and unit size. Demonstrate a call to the mDumpMemx macro.
```asm
mDumpMemx MACRO varName:REQ
  mDumpMem OFFSET varName, LENGTHOF varName, TYPE varName
ENDM
; 호출 예시:
mDumpMemx myArray
```

### 12. Show an example of a macro parameter having a default argument initializer.
```asm
mWriteSpace MACRO count:=<1>
  mPrintChar ' ', count
ENDM
```

### 13. Write a short example that uses the IF, ELSE, and ENDIF directives.
```asm
COUNT = 4
IF COUNT GT 5
  ECHO COUNT > 5
ELSE
  ECHO COUNT <= 5
ENDIF
```

### 14. Write a statement using the IF directive that checks the value of the constant macro parameter Z; if Z is less than zero, display a message during assembly indicating that Z is invalid.
```asm
IF Z LT 0
  ECHO Error: Z cannot be less than zero.
ENDIF
```

### 15. Write a short macro that demonstrates the use of the & operator when the macro parameter is embedded in a literal string.
```asm
mShowLabel MACRO name
  LOCAL lbl
  .data
  lbl BYTE "Value of &name: ", 0
  .code
  mov edx, OFFSET lbl
  call WriteString
ENDM
```

### 16. Assume the following mLocate macro definition:
```asm
mLocate MACRO xval,yval
  IF xval LT 0 ;; xval < 0?
    EXITM ;; if so, exit
  ENDIF

  IF yval LT 0 ;; yval < 0?
    EXITM ;; if so, exit
  ENDIF

  mov bx,0 ;; video page 0
  mov ah,2 ;; locate cursor
  mov dh,yval
  mov dl,xval
  int 10h ;; call the BIOS
ENDM
```

Show the source code generated by the preprocessor when the macro is expanded by each of
the following statements:
```asm
.data
row BYTE 15
col BYTE 60
.code
mLocate -2,20
mLocate 10,20
mLocate col,row
```
