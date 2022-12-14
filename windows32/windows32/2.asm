; Part 2:   Calculates Surface Area Of The Box With Parameters Entered 
; Author:   Joshua Francis
; Date:     10/31/2022 

.586
.MODEL FLAT

INCLUDE io.h                                   ; header file for input/output

.STACK 4096

.DATA
length1      DWORD   ?
width1       DWORD   ?
height1      DWORD   ?

prompt1         BYTE    "Length of box?", 0
prompt2         BYTE    "Width of box?", 0
prompt3         BYTE    "Height of box?", 0
string1         BYTE    40 DUP (?)
resultLbl       BYTE    "The box surface area is", 0
sum             BYTE    11 DUP (?), 0

.CODE
_MainProc2 PROC

        input  prompt1, string1, 40           ; get length
        atod  string1                         ; convert to integer
        mov  length1, eax                     ; store in memory

        input  prompt2, string1, 40           ; repeat for width
        atod  string1
        mov  width1, eax

        input  prompt3, string1, 40           ; repeat for height
        atod  string1
        mov  height1, eax

        mov  eax, length1                     ; moves length to eax
        mul  width1                           ; length*width
        mov  ebx, eax                         ; moves length*width to ebx

        mov  eax, length1                     ; moves length to eax
        mul  height1                          ; length*height
        mov  ecx, eax                         ; moves length*height to ecx

        mov  eax, width1                      ; moves width to eax
        mul  height1                          ; width*height
        mov  edx, eax                         ; moves width*height to edx

        mov  eax, ebx                         ; moves length*width to eax
        add  eax, ecx                         ; adds length*height to length*width
        add  eax, edx                         ; adds width*height to length*height + length*width

        imul  eax, 2                          ; Surface Area = 2*(length*width + length*height + width*height)

        dtoa  sum, eax                        ; convert to ASCII characters
        output  resultLbl, sum                ; output label and sum

        mov  eax, 0                           ; exit with return code 0
        ret

_MainProc2 ENDP
END                                           ; end of source cod