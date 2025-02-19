# bf2lc3

Converts Brainfuck code to LC-3 assembly code. Uses Deno. (I am unfortunately a webpilled typescripthead.)

## Usage

```bash
deno run -A mod.ts fib.bf fib.asm
```

Instructions will start at `x3000`. The stack starts at `x4000` and goes to `x8000`.
