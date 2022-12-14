; Part 3:   Finds the sum of a number series: 1^2 + 2^2 + 3^2 +...+ n^2
; Author:   Joshua Francis
; Date:     10/31/2022 

.586
.MODEL FLAT
INCLUDE io.h                            ; header file for input/output
.STACK 4096

.DATA
n DWORD   ?
prompt BYTE    "Enter the value of n", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The sum of the number series is ", 0
sum     BYTE    11 DUP (?), 0

.CODE
_MainProc3 PROC
        input   prompt, string, 40      ; read ASCII characters
        atod    string                  ; convert to integer
        mov     n, eax                  ; store in memory
        mov     eax, 0                  ; initialize eax for storing the sum
        mov     ecx, 1                  ; ecx stores the counter value, i.e., 1, 2, 3,...,n

body:   cmp     ecx, n                  ; compare the values of ecx and n
        jg      exit                    ; exit if the value of ecx is greater than n
        mov     ebx, ecx                ; moves (copies) value of ecx to ebx for next step
        imul    ebx, ecx                ; multiplies the value at ecx by ebx (copy of ecx) aka ecx^2 or number^2
        add     eax, ebx                ; add the value of ebx with eax that stores the sum
        inc     ecx                     ; increment the value of ecx
        jmp body

exit:   dtoa    sum, eax                ; convert to ASCII characters
        output  resultLbl, sum          ; output label and sum
        mov     eax, 0                  ; exit with return code 0
        ret

_MainProc3 ENDP
END                                     ; end of source code