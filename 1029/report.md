# 7. Report

## 1. In the following code sequence, show the value of AL after each shift or rotate instruction has executed:
```asm
mov al,0D4h
shr al,1 ; a.
mov al,0D4h
sar al,1 ; b.
mov al,0D4h
sar al,4 ; c.
mov al,0D4h
rol al,1 ; d.
```

> a. 6Ah / b. EAh / c. FDh / d. A9h

## 2. In the following code sequence, show the value of AL after each shift or rotate instruction has executed:
```asm
mov al,0D4h
ror al,3 ; a.
mov al,0D4h
rol al,7 ; b.
stc
mov al,0D4h
rcl al,1 ; c.
stc
mov al,0D4h
rcr al,3 ; d.
```

> a. 9Ah / b. EA (6Ah) / c. A9h / d. FAh

## 3. What will be the contents of AX and DX after the following operation?
```asm
mov dx,0
mov ax,222h
mov cx,100h
mul cx
```

> AX = 2200h  
> DX = 0022h

## 4. What will be the contents of AX after the following operation?
```asm
mov ax,63h
mov bl,10h
div bl
```

> AX = 0306h

## 5. What will be the contents of EAX and EDX after the following operation?
```asm
mov eax,123400h
mov edx,0
mov ebx,10h
div ebx
DIV
IDIV
IMUL
MUL
RCL
RCR
ROL
ROR
SAL
SAR
SBB
SHL
SHLD
SHR
SHRD
```

> EAX = 00012340h  
> EDX = 00000000h

## 6. What will be the contents of AX and DX after the following operation?
```asm 
mov ax,4000h
mov dx,500h
mov bx,10h
div bx
```

> Divide Overflow 오류 발생

## 7. What will be the contents of BX after the following instructions execute?
```asm
mov bx,5
stc
mov ax,60h
adc bx,ax
```

> BX = 0066h

## 8. Describe the output when the following code executes in 64-bit mode:
```asm
.data
dividend_hi QWORD 00000108h
dividend_lo QWORD 33300020h
divisor QWORD 00000100h
.code
mov rdx,dividend_hi
mov rax,dividend_lo
div divisor
```

> RAX = 0000000108333000h  
> RDX = 0000000000000020h

## 9. The following program is supposed to subtract val2 from val1. Find and correct all logic errors (CLC clears the Carry flag):
```asm
.data
val1 QWORD 20403004362047A1h
val2 QWORD 055210304A2630B2h
result QWORD 0
.code
mov cx,8 ; loop counter
mov esi,val1 ; set index to start
mov edi,val2
clc ; clear Carry flag
top:
mov al,BYTE PTR[esi] ; get first number
sbb al,BYTE PTR[edi] ; subtract second
mov BYTE PTR[esi],al ; store the result
dec esi
dec edi
loop top
```

## 10. What will be the hexadecimal contents of RAX after the following instructions execute in 64-bit mode?
```asm
.data
multiplicand QWORD 0001020304050000h
.code
imul rax,multiplicand, 4
```

> RAX = 0004080C10140000h
