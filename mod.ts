const NAME = "fib";

const input = await Deno.readTextFile(`${NAME}.bf`);

const stack: number[] = [];
let labelId = 0;

/**
 * R0: Current cell
 * R1: Pointer to memory
 */

const output = [
	".orig x3000",
	"",
	"AND R0, R0, #0",
	"LD R1, MEMORY",
	"BR START_ZERO",
	"MEMORY .fill x4000",
	"MEMORY_SIZE .fill x4000",
	"START_ZERO",
	`LD R2, MEMORY_SIZE
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
`
];

for (const char of input) {
	if (char === "+") {
		output.push("LDR R0, R1, #0");
		output.push("ADD R0, R0, #1");
		output.push("STR R0, R1, #0");
	} else if (char === "-") {
		output.push("LDR R0, R1, #0");
		output.push("ADD R0, R0, #-1");
		output.push("STR R0, R1, #0");
	} else if (char === ">") {
		output.push("ADD R1, R1, #1");
	} else if (char === "<") {
		output.push("ADD R1, R1, #-1");
	} else if (char === ".") {
		output.push("LDR R0, R1, #0");
		output.push("OUT");
	} else if (char === ",") {
		output.push("IN");
		output.push("STR R0, R1, #0");
	} else if (char === "[") {
		const label = labelId++;
		stack.push(label);
		output.push(`LDR R0, R1, #0`);

		// output.push(`BRZ END${label}`);
		// use JSR instead of BRZ to extend range
		output.push(`BRNP START${label}`);
		output.push(`JSR END${label}`);

		output.push(`START${label}`);
	} else if (char === "]") {
		const label = stack.pop();
		if (label === undefined) {
			throw new Error("Unmatched ]");
		}
		output.push(`LDR R0, R1, #0`);

		// output.push(`BRNP START${label}`);
		// use JSR instead of BRZ to extend range
		output.push(`BRZ END${label}`);
		output.push(`JSR START${label}`);

		output.push(`END${label}`);
	}
}

if (stack.length > 0) {
	throw new Error("Unmatched [");
}

const end = ["", "HALT", "", ".end", "", ".orig x4000", ".blkw x4000", ".end"];

await Deno.writeTextFile(`${NAME}.asm`, output.concat(end).join("\n"));
