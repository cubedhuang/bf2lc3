# bf2lc3

Converts Brainfuck code to LC-3 assembly code. Uses Deno.

## Usage

Set `NAME` in `mod.ts` to the name of the Brainfuck file you want to convert.

```bash
deno run --allow-read --allow-write mod.ts
```

Instructions will start at `x3000`. The stack starts at `x4000` and goes to `x8000`.
