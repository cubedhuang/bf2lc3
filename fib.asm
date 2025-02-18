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

LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
ADD R1, R1, #-2
LDR R0, R1, #0
BRNP START0
JSR END0
START0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #8
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-8
STR R0, R1, #0
ADD R1, R1, #1
ADD R1, R1, #10
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #2
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-2
STR R0, R1, #0
ADD R1, R1, #-10
LDR R0, R1, #0
BRZ END0
JSR START0
END0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #5
STR R0, R1, #0
LDR R0, R1, #0
BRNP START1
JSR END1
START1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRNP START2
JSR END2
START2
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #-1
LDR R0, R1, #0
BRZ END2
JSR START2
END2
ADD R1, R1, #-2
LDR R0, R1, #0
BRNP START3
JSR END3
START3
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #4
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #-5
LDR R0, R1, #0
BRZ END3
JSR START3
END3
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START4
JSR END4
START4
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #5
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #-6
LDR R0, R1, #0
BRZ END4
JSR START4
END4
ADD R1, R1, #3
LDR R0, R1, #0
BRNP START5
JSR END5
START5
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #-4
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #4
LDR R0, R1, #0
BRZ END5
JSR START5
END5
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START6
JSR END6
START6
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #-3
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #3
LDR R0, R1, #0
BRZ END6
JSR START6
END6
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START7
JSR END7
START7
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #-5
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #5
LDR R0, R1, #0
BRZ END7
JSR START7
END7
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START8
JSR END8
START8
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #-5
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #5
LDR R0, R1, #0
BRZ END8
JSR START8
END8
ADD R1, R1, #-5
LDR R0, R1, #0
BRNP START9
JSR END9
START9
ADD R1, R1, #7
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #-8
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END9
JSR START9
END9
ADD R1, R1, #8
LDR R0, R1, #0
BRNP START10
JSR END10
START10
ADD R1, R1, #-8
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #8
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END10
JSR START10
END10
ADD R1, R1, #-2
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START11
JSR END11
START11
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START12
JSR END12
START12
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
ADD R1, R1, #-1
LDR R0, R1, #0
BRNP START13
JSR END13
START13
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRNP START14
JSR END14
START14
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #2
LDR R0, R1, #0
BRZ END14
JSR START14
END14
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START15
JSR END15
START15
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
LDR R0, R1, #0
BRNP START16
JSR END16
START16
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
BRZ END16
JSR START16
END16
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #2
LDR R0, R1, #0
BRZ END15
JSR START15
END15
ADD R1, R1, #-5
LDR R0, R1, #0
BRZ END13
JSR START13
END13
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START17
JSR END17
START17
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END17
JSR START17
END17
LDR R0, R1, #0
ADD R0, R0, #8
STR R0, R1, #0
LDR R0, R1, #0
BRNP START18
JSR END18
START18
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #6
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END18
JSR START18
END18
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START19
JSR END19
START19
ADD R1, R1, #-2
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #2
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END19
JSR START19
END19
ADD R1, R1, #1
LDR R0, R1, #0
BRNP START20
JSR END20
START20
ADD R1, R1, #-2
LDR R0, R1, #0
ADD R0, R0, #1
STR R0, R1, #0
ADD R1, R1, #2
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END20
JSR START20
END20
ADD R1, R1, #-2
LDR R0, R1, #0
BRZ END12
JSR START12
END12
ADD R1, R1, #1
LDR R0, R1, #0
BRZ END11
JSR START11
END11
ADD R1, R1, #-1
LDR R0, R1, #0
BRNP START21
JSR END21
START21
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
ADD R1, R1, #2
LDR R0, R1, #0
ADD R0, R0, #8
STR R0, R1, #0
LDR R0, R1, #0
BRNP START22
JSR END22
START22
ADD R1, R1, #-1
LDR R0, R1, #0
ADD R0, R0, #6
STR R0, R1, #0
ADD R1, R1, #1
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END22
JSR START22
END22
LDR R0, R1, #0
BRZ END21
JSR START21
END21
ADD R1, R1, #-1
LDR R0, R1, #0
BRNP START23
JSR END23
START23
LDR R0, R1, #0
OUT
LDR R0, R1, #0
BRNP START24
JSR END24
START24
LDR R0, R1, #0
ADD R0, R0, #-1
STR R0, R1, #0
LDR R0, R1, #0
BRZ END24
JSR START24
END24
ADD R1, R1, #-1
LDR R0, R1, #0
BRZ END23
JSR START23
END23
ADD R1, R1, #-5
ADD R1, R1, #10
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #2
STR R0, R1, #0
LDR R0, R1, #0
OUT
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-10
STR R0, R1, #0
LDR R0, R1, #0
ADD R0, R0, #-2
STR R0, R1, #0
ADD R1, R1, #-10
LDR R0, R1, #0
BRZ END1
JSR START1
END1

HALT

.end

.orig x4000
.blkw x4000
.end