const IN = Deno.args[0];
const OUT = Deno.args[1];

const input = await Deno.readTextFile(IN);

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

type ArithmeticInstruction = {
	type: "+" | "-";
	count: number;
};

type PointerInstruction = {
	type: ">" | "<";
	count: number;
};

type IOInstruction = {
	type: "." | ",";
};

type LoopInstruction = {
	type: "[" | "]";
};

type Instruction =
	| ArithmeticInstruction
	| PointerInstruction
	| IOInstruction
	| LoopInstruction;

const instructions: Instruction[] = [];

for (let i = 0; i < input.length; i++) {
	const char = input[i];
	if (char === "+" || char === "-") {
		let count = 1;
		while (input[i + 1] === char && count < 15) {
			count++;
			i++;
		}
		instructions.push({ type: char, count });
	} else if (char === ">" || char === "<") {
		let count = 1;
		while (input[i + 1] === char) {
			count++;
			i++;
		}
		instructions.push({ type: char, count });
	} else {
		instructions.push({ type: char } as Instruction);
	}
}

for (const instruction of instructions) {
	if (instruction.type === "+") {
		output.push("LDR R0, R1, #0");
		output.push(`ADD R0, R0, #${instruction.count}`);
		output.push("STR R0, R1, #0");
	} else if (instruction.type === "-") {
		output.push("LDR R0, R1, #0");
		output.push(`ADD R0, R0, #-${instruction.count}`);
		output.push("STR R0, R1, #0");
	} else if (instruction.type === ">") {
		output.push(`ADD R1, R1, #${instruction.count}`);
	} else if (instruction.type === "<") {
		output.push(`ADD R1, R1, #-${instruction.count}`);
	} else if (instruction.type === ".") {
		output.push("LDR R0, R1, #0");
		output.push("OUT");
	} else if (instruction.type === ",") {
		output.push("IN");
		output.push("STR R0, R1, #0");
	} else if (instruction.type === "[") {
		const label = labelId++;
		stack.push(label);
		output.push(`LDR R0, R1, #0`);

		// output.push(`BRZ END${label}`);
		// use JSR instead of BRZ to extend range
		output.push(`BRNP START${label}`);
		output.push(`JSR END${label}`);

		output.push(`START${label}`);
	} else if (instruction.type === "]") {
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

await Deno.writeTextFile(OUT, output.concat(end).join("\n"));
