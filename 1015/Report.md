# Report

## 1. What will be the value of BX after the following instructions execute?
```asm
mov bx,0FFFFh
and bx,6Bh
```
> 006Bh

## 2. What will be the value of BX after the following instructions execute?
```asm
mov bx,91BAh
and bx,92h
```
> 0010h

## 3. What will be the value of BX after the following instructions execute?
```asm
mov bx,0649Bh
or bx,3Ah
```
> 64BFh

## 4. What will be the value of BX after the following instructions execute?
```asm
mov bx,029D6h
xor bx,8181h
```
> A857h

## 5. What will be the value of EBX after the following instructions execute?
```asm
mov ebx,0AFAF649Bh
or ebx,3A219604h
```
> BFBFEEBFh

## 6. What will be the value of RBX after the following instructions execute?
```asm
mov rbx,0AFAF649Bh
xor rbx,0FFFFFFFFh
```
> 0000000050509B64h

## 7. In the following instruction sequence, show the resulting value of AL where indicated, in binary:
```asm
mov al,01101111b
and al,00101101b ; a.
mov al,6Dh
and al,4Ah ; b.
mov al,00001111b
or al,61h ; c.
mov al,94h
xor al,37h ; d.
```
> a. 00101101b  
> b. 01001000b  
> c. 01101111b  
> d. 10100011b  

## 8. In the following instruction sequence, show the resulting value of AL where indicated, in hexadecimal:
```asm
mov al,7Ah
not al ; a.
mov al,3Dh
and al,74h ; b.
mov al,9Bh
or al,35h ; c.
mov al,72h
xor al,0DCh ; d.
```
> a. 85h
> b. 34h
> c. BFh
> d. AEh

## 9. In the following instruction sequence, show the values of the Carry, Zero, and Sign flags where indicated:
```asm
mov al,00001111b
test al,00000010b ; a. CF= ZF= SF=
mov al,00000110b
cmp al,00000101b ; b. CF= ZF= SF=
mov al,00000101b
cmp al,00000111b ; c. CF= ZF= SF=
```
> a. CF=0, ZF=0, SF=0  
> b. CF=0, ZF=0, SF=0  
> c. CF=1, ZF=0, SF=1  

## 10. Which conditional jump instruction executes a branch based on the contents of ECX?
> JECXZ

## 11. How are JA and JNBE affected by the Zero and Carry flags?
> ZF = 0이고 CF = 0일때

## 12. What will be the final value in EDX after this code executes?
 ```asm
mov edx,1
mov eax,7FFFh
cmp eax,8000h
jl L1
mov edx,0
```
> L1: 1

## 13. What will be the final value in EDX after this code executes?
```asm
mov edx,1
mov eax,7FFFh
cmp eax,8000h
jb L1
mov edx,0
```
> L1: 1

## 14. What will be the final value in EDX after this code executes?
```asm
mov edx,1
mov eax,7FFFh
cmp eax,0FFFF8000h
jl L2
mov edx,0
```
> L2: 0

## 15. (True/False): The following code will jump to the label named Target.
```asm
mov eax,-30
cmp eax,-50
jg Target
```
> True

## 16. (True/False): The following code will jump to the label named Target.
```asm
mov eax,-42
cmp eax,26
ja Target
```
> True

## 17. What will be the value of RBX after the following instructions execute?
```asm
mov rbx,0FFFFFFFFFFFFFFFFh
and rbx,80h
```
> 0000000000000080h

## 18. What will be the value of RBX after the following instructions execute?
```asm
mov rbx,0FFFFFFFFFFFFFFFFh
and rbx,808080h
```
> 0000000000808080h

## 19. What will be the value of RBX after the following instructions execute?
```asm
mov rbx,0FFFFFFFFFFFFFFFFh
and rbx,80808080h
```
> 0000000080808080h
