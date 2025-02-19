.orig x3000

AND R0, R0, #0
LD R1, MEMORY
BR START_ZERO
MEMORY .fill x4000
MEMORY_SIZE .fill x4000
START_ZERO
LD R2, MEMORY_SIZE
ADD R2, R1, R2 ; memory end
NOT R2, R2
ADD R2, R2, #1 ; negative memory end
ADD R3, R1, #-1 ; current cell
ZERO
ADD R3, R3, #1 ; increment current cell
STR R0, R3, #0 ; set current cell to 0
ADD R4, R2, R3 ; cell - memory end
; while (cell < memory end) == while (cell - memory end < 0)
BRN ZERO

ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #8
STR R0, R1, #0
LDR R0, R1, #0
BRNP START0
JSR END0
START0
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #9
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END0
JSR START0
END0
ADD R1, R1, #-1
LDR R0, R1, #0
OUT
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #4
STR R0, R1, #0
LDR R0, R1, #0
BRNP START1
JSR END1
START1
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #7
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END1
JSR START1
END1
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #7
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #3
STR R0, R1, #0
LDR R0, R1, #0
OUT
ADD R1, R1, #2
LDR R0, R1, #0
ADD R0, R0, #6
STR R0, R1, #0
LDR R0, R1, #0
BRNP START2
JSR END2
START2
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #7
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END2
JSR START2
END2
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #-12
STR R0, R1, #0
LDR R0, R1, #0
OUT
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #6
STR R0, R1, #0
LDR R0, R1, #0
BRNP START3
JSR END3
START3
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #9
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END3
JSR START3
END3
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
LDR R0, R1, #0
OUT
ADD R1, R1, #-1
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #3
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #-6
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #-8
STR R0, R1, #0
LDR R0, R1, #0
OUT
ADD R1, R1, #3
LDR R0, R1, #0
ADD R0, R0, #4
STR R0, R1, #0
LDR R0, R1, #0
BRNP START4
JSR END4
START4
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #8
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END4
JSR START4
END4
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
LDR R0, R1, #0
OUT

HALT

.end

.orig x4000
.blkw x4000
.end