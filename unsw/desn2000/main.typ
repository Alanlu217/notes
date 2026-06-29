#import "@preview/cetz:0.5.2"

#[
  #set text(24pt, weight: "bold")
  #set align(center)

  DESN2000 Notes
]

#outline()
#pagebreak()

= Lecture 1
== Microprocessor
Made up of:
- Arithmetic Logic Unit (ALU)
- Registers and internal bus structure
- Control unit (CU) - can be hardwired or microprogrammed

Using the *LCP2478 ARM7TDMI* processor that implements the *ARMv4* instruction set.

TDMI:
- T: thumb (supports 32 bit and 16 bit compressed instruction set)
- D: debug (on chip debug supports, hardware breakpoints)
- M: multiplier (fast / enhanced multiplier)
- I: ICE (Embedded ICE, in-circuit emulation logic for debugging)

== Instructions
1st input always from register bank.
2nd input can be:
- Register
- Immediate operand
- A shifted register value
Result goes to a register

e.g
```asm
ADD R1, R1, #0x5              ; opcode out-reg, in1-reg, in2-immediate
ADD R1, R2, R3, LSL #3        ; opcode out-reg, in1-reg, in2-reg-3-left-shift
```

=== Data types
bit: 1b
byte: 8b
halfword: 16b
word: 32b

Each instruction is 32b.

=== Processor Modes
Has seven processor modes, 6 privileged, 1 unprivileged.

#table(
  columns: (1fr, 4fr, 1fr),
  table.header()[Mode][Description][Privileged],
  [Supervisor (SVC)],
  [Entered on reset and when a software interrupt is executed],
  [YES],

  [FIQ], [Entered when a high priority interrupt is raised], [YES],
  [IRQ], [Entered when a low priority (normal) interrupt is raised], [YES],
  [Abort], [Used to handle memory access violations], [YES],
  [Undef], [Used to handle undefined instructions], [YES],
  [System], [Privileged mode using the same registers as User mode], [YES],
  [User], [Mode under which most applications / OS taks run], [NO],
)

Each mode (except System) has its own set of banked registers so that processor can handle events like interrupts and memory access violations quickly without losing previous state.

=== Program status registers

#table(
  columns: (1fr,) * 9,
  [31], [30], [29], [28], [27:8], [7], [6], [5], [4:0],
  [N], [Z], [C], [V], [zero], [I], [F], [T], [M],
)
#table(
  columns: (1fr,) * 2,
  stroke: none,
  [
    - Conditional flag bits:
      - N: negative
      - Z: zero
      - C: carry out
      - V: overflow
    - I: disable IRQs
    - F: disable FIQs
    - T: ARM Thumb instructions (0 for ARM)
  ],
  [
    - M: Mode bits
      - 10000: User mode
      - 10001: FIQ mode
      - 10010: IRQ mode
      - 10011: Supervisor mode
      - 10111: Abort mode
      - 11011: Undefined mode
      - 11111: System mode
  ],
)

=== Pipeline
ARM7TDMI has a 3 stage pipeline architecture:
- Fetch
- Decode
- Execute

#align(center, cetz.canvas({
  import cetz.draw: *

  let box(name, anchor, cnt) = {
    rect(
      name: name + "_rect",
      (rel: (-1, -.5), to: anchor),
      (rel: (1, .5), to: anchor),
    )
    content(name + "_rect.center", cnt)
  }

  box("f1", (0, 3), [Fetch])
  box("d1", (3, 3), [Decode])
  box("e1", (6, 3), [Execute])

  box("f2", (3, 1.5), [Fetch])
  box("d2", (6, 1.5), [Decode])
  box("e2", (9, 1.5), [Execute])

  box("f3", (6, 0), [Fetch])
  box("d3", (9, 0), [Decode])
  box("e3", (12, 0), [Execute])

  line(name: "timeline", (6, 4), (6, -1), stroke: (dash: "dotted"))
  line((-1, -.8), (14, -.8), mark: (end: ">>"))
  content((rel: (0, -0.5), to: "timeline.100%"), [Time])

  content((-2, 3), [1])
  content((-2, 1.5), [2])
  content((-2, 0), [3])

  group({
    translate(x: -3, y: 1.5)
    rotate(-90deg)

    content((0, 0), angle: 90deg, [Instruction])
    line((-1, 0.4), (1, 0.4), mark: (end: ">>"))
  })
}))

=== Assembly code format
```
<label>  <instruction / directive / pseudo-instruction> [; comment]
```

/ Label: a memory address that can be used like a pointer, is mapped to a physical address by the linker
/ Instruction: an ARM instruction
/ Directive: instructions to the assembler
/ Pseudo-instruction: a fake instruction to ease programming, is converted into real instructions during assembly

=== Assembler directives
==== AREA
Defines a block of data or code in the source file.

```asm
AREA  <section_name> [, attribute]*
```
If section_name starts with a digit, it must be enclosed in bars:  `|1_test|`.
Optional attributes can be:
- `CODE` a section of code typically declared as read-only
- `DATA` a section of data, can be declared as read-write
- `READONLY` declares that a section cannot be modified
- `READWRITE` declares that a section can be modified
- `ALIGN=expr` alings the section into a $2^"expr"$-byte boundary

==== EQU
Gives meaningful names to numeric constants in the program, similar to \#define.

```asm
<name>  EQU  <expr>
```

E.g
```asm
SRAM_BASE  EQU  0x400000000
table      EQU  label+8
```

==== ENTRY
Declares an entry point to the program, which must have at least one `ENTRY`.
In projects with multiple source files, each source will have an `ENTRY` directive.

E.g
```asm
AREA  testprog, CODE, READONLY
ENTRY
```

==== DCB, DCW, DCD
Used to declare initial run-time content in the memory at byte, halfword and word level.

DCD: Define Constant Byte
DCW: Define Constant Half-Word
DCD: Define Constant Word

```asm
[label]  DCB  expr [, expr]*
```

label: memory address of the starting byte
expr: either a numeric expression that evaluates to an integer or a string.

e.g
```asm
; DCB
C_string  DCB  "C_string", 0    ; string are not 0 terminated
```

==== ALIGN
Aligns the current location in memory to a specified boundary by padding with zeros.

```asm
ALIGN  [expr[, offset]]
```

if no arguments, defaults to `ALIGN 4`.

Aligned to the next lowest address of the form:
$"offset" + n times "expr" quad n in ZZ$ is automatically selected to minimise padding.

==== SPACE, END

SPACE allocates a block of memory initialised to zero.

```
<label>  SPACE <expr>
```
expr:  specifies the number of bytes to reserve as zero.

END declares the end of the source file.

== Lecture 2
=== ARM data processing instructions
- Arithmetic: ADD, SUB, ADC, ...
- Comparison: CMP, CMN, TST, TEQ
- Logical: AND, EOR, ORR, BIC, ...
- Data movement: MOV, MVN

4-field instruction format: `<opcode> <dest> <src1> <src2>`
- Opcode: name of the operation
- Destination: destination; a register
- src1: 1st source; a register
- src2: 2nd source; a register, shifted register, or an immediate

=== ADD / SUB

/ `ADD`: addition `<s1> + <s2>`
/ `ADDS`: `ADD` but saves condition code flags
/ `SUB`: subtraction `<s1> -  <s2>`
/ `SUBS`: `SUB` but saves condition code flags
/ `RSB`: Reverse subtraction `<s2> - <s1>`

/ `ADC`: add with carry
/ `SBC`: subtract with carry
/ `RSC`: reverse subtract with carry

e.g.
```asm
; 64-bit addition
;   R1 R0
; + R3 R2
; ---------
;   R5 R4

ADDS  R4, R0, R2
ADC   R5, R1, R3

; 64-bit subtraction
;   R1 R0
; - R3 R2
; ---------
;   R5 R4

SUBS  R4, R0, R2
SBC   R5, R1, R3
```

=== Data move instructions

/ `MOV`: move `<dest> = <s1>`
/ `MVN`: move negative `<dest> = -<s1>`

=== Logical instructions

/ `AND`: bit-wise and
/ `ORR`: bit-wise or
/ `EOR`: bit-wise xor
/ `BIC`: bit clear `<dest> = <s1> AND (NOT <s2>)`

=== Shifting / rotate

/ `LSL`: logical left shift
/ `LSR`: logical right shift
/ `ASR`: arithmetic right shift
/ `ROR`: Rotate right
/ `RRX`: Rotate right throught carry

=== Multiplication

- Is expensive in clock cycles, power and circuit complexity.
- Multiplication by a constant can be achieved by decomposing number into multiples of powers of two.

E.g.
```asm
; B = 5 * A = (2^2 + 1)*A = 2^2*A + A
ADD  V2, V1, V1, LSL #2

; B = 105 * A = (15 * 7)A = (2^4 - 1)(2^3 - 1)*A
RSB  V2, V1, V1, LSL #4
RSB  V2, V2, V2, LSL #3
```

=== Load-store architecture

Data processing instructions only work on registers. Thus to act on data in memory, it must be loaded into a register first.

*Addressing modes*
- Pre-indexed `++address`
  - offset is added to the base register before the load/store.
  - The load/store takes place at the address pointed by (base + offset)
  - Optionally updates the base register with new address
- Post-indexed `address++`
  - offset is adeded to the base after the load/store.
  - The load/store happens at the address pointed by the base register.
  - Always updates the base register with new address.

```asm
; <opcode>[cond] <rd> \[<rn>, <offset>\][!]
; opcode  LDR (load word) STR (store word)
; cond    Optional conditional execution
; rd      Destination register for LDR and source register for STR
; rn      Base register
; offset  Offset from the abse register; immediate, register, or shifted register.
; !       Optionally write effective address back to base register

LDR  V1, [V2, #12]  ; load a word into V1 from V2 + 12
LDR  V1, [V2, #12]! ; load a word into V1 from V2 + 12 and store V2 + #12 into V2

LDR  V1, [V2, V3]   ; load a word into V1 from V2 + V3
LDR  V1, [V2, V3, LSL #2]!  ; load a word into V1 from V2 + V3 << 2 and store V2 + V3<<2 into V2

STR  V1, [V2, #2]   ; Store the contents of V1 at V2 + 2
STR  V1, [V2, #12]! ; Store the contents of V1 at V2 + 12 and store V2 + 12 at V2

STR  V1, [V2, V3]   ; Store the contents of V1 at V2 + V3
STR  V1, [V2, V3, LSL #2]! ; Store the contents of V1 at V2 + V3<<2 and store V2 + V3<<2 at V2
```

```asm
; <opcode>{cond} <rd> \[<rn>\], offset
; opcode  LDR (load word) STR (store word)
; cond    Optional conditional execution
; rd      Destination / Source register
; rn      Base register
; offset  Added to base

LDR  V1, [V2], #12 ; load a word into V1 from V2 and store V2 + 12 at V2
LDR  V1, [V2], V3  ; load a word into V1 from V2 and store V2 + V3 at V2
LDR  V1, [V2], V3, LSL #3 ; load a word into V1 from V2 and store V2 + V3<<3 at V2

STR  V1, [V2], #12 ; Store the contents of V1 at V2 and Store V2 + 12 at V2
```

e.g
```asm
; C + A + B
; Base: 0x4000
; A: offset 0
; B: offset 4
; C: offset 8

MOV V1, #0x4000
LDR V2, [V1, #0]
LDR V3, [V1, #4]
ADD V2, V2, V3
STR V2, [V1, #8]
```

*LDR / STR variants*
#table(
  columns: (1fr,) * 4,
  stroke: none,
  table.header()[Load][][Store][],
  [LDR], [Load a word], [STR], [Store a word],
  [LDRB], [Load a byte], [STRB], [Store a byte],
  [LDRH], [Load a half word], [STRH], [Store a half word],
  [LDRSB], [Load a signed byte], [], [],
  [LDRSH], [Load a signed halfword], [], [],
)

*Load / Store Multiple*:
```asm
STR a1, [v1], #4
STR a2, [v1], #4
STR a3, [v1], #4
STR a4, [v1], #4
=>
; Store Multiple Increment After
STMIA v1!, {a1-a4}

STR a1, [v1, #4]!
STR a2, [v1, #4]!
STR a3, [v1, #4]!
STR a4, [v1, #4]!
=>
; Store Multiple Increment Before
STMIB v1!, {a1-a4}

STR a1, [v1]
STR a2, [v1, #4]
STR a3, [v1, #8]
STR a4, [v1, #12]
=>
; Store Multiple Increment After (no !)
STMIA v1, {a1-a4}

STR a1, [v1, #4]
STR a2, [v1, #8]
STR a3, [v1, #12]
STR a4, [v1, #16]
=>
; Store Multiple Increment Before (no !)
STMIB v1, {a1-a4}
```

=== Endianness

- Little endian: least significant byte is stored at lowest moemry address.
- Big endian: least significant byte is stored at the highest memory address.

ARM is little-endian by default.

= Lecture 3
== Conditional Flags / Execution
Conditions flags in CPSR:
- N (negative)
- Z (zero)
- C (carry)
- V (overflow)

Condition flags can be updated by:
- 'S' option of data processing instructions: `ADDS`, `MOVS`
- Flag setting instructions: `CMP`, `CMN`, `TST`, `TEQ`
- Shift operations (only C flag)
- Other special instructions

== Flag Setting Instructions

=== `CMP` Compare
Compares 1st and 2nd operand by performing a subtraction, while setting the flags.

=== `CMN` Compare Negative
Same as `CMP` but performs addition instead.

=== `TST` Test bits
Logical `AND` between operands. Only N and Z flags.

=== `TEQ` Test Equivalence
Logical XOR between operands. Only N, Z and C flags.

== Flags for Conditional Execution
ARM instruction can execute normally or have a condition specified by a two letter suffix for conditional execution.

Instruction becomes a no-op if the conditions are not met.

e.g.
```asm
      MOV r1, #10
loop                     ; do
      SUBS r1, r1, #1    ;    i = i - 1
      BNE loop           ;  while (i != 0)
```

#table(
  columns: (1fr,) * 4,
  stroke: none,
  table.header()[Field Mnemonic][ConditionalCode][Flag Status][Meaning],
  [EQ], [0000], [Z set], [Equal],
  [NE], [0001], [Z clear], [Not Equal],
  [HS/CS], [0010], [C set], [Unsigned $>=$],
  [CC/LO], [0011], [C clear], [Unsigned $<$],
  [MI], [0100], [N set], [Negative],
  [PL], [0101], [N clear], [Positive or Zero],
  [VS], [0110], [V set], [Overflow],
  [VC], [0111], [V clear], [No Overflow],
  [HI], [1000], [C set and Z clear], [Unsigned $>$],
  [LS], [1001], [C clear and Z set], [Unsigned $<=$],
  [GE], [1010], [N = V], [Signed $>=$],
  [LT], [1011], [N $!=$ V], [Signed $<$],
  [GT], [1100], [Z clear, N = V], [Signed $>$],
  [LE], [1101], [Z set, N $!=$ V], [Signed $<=$],
  [AL], [1110], [Always], [Default],
)

== Branch Instructions
/ `B`: Regular branch
/ `BL`: Branch and link, branch to a new location, then return to the original location. The link register `LR` or `R14` used to hold the return address. Used to implement subroutines and function calls.

ARM address bus is 32-bit wide. How to specify 32-bit branch target address?
=> Use PC-relative addressing.

Branch address = (current PC + (offset \* 2^2))

However: cannot branch more than 32MB away from PC.

BL instruction modifies 3-stage pipeline by adding extra LINKRET and ADJUST stages after executing the branch link instruction.

= Lecture 4 (Functions, subroutines and procedural call standard)

Functions and subroutines need to
+ save and restore information between function / subroutine calls.
+ pass information (arguments and return values) to and from subroutines

This is achieved via *stacks*.
Need to follow specific rules when writing subroutines, e.g. how to handle register conflicts.

*ARM Architecture Procedure Call Standard* (AAPCS) specifies these rules so that subroutines developed by different programmers can talk to each other.

== Stack
- Is a special area in memory (RAM) with
  - variable length
  - fixed starting address
- has a list in first out (LIFO) data structure with
  - PUSH
  - POP
- Operations typically happen at word level (32 bits).
- *Stack Pointer* (SP / R13) holds address of either top-most empty entry or top most last filled entry in the stack
- Each processor mode has its own stack pointer
- Data is PUSHED onto the stack when using *STR* or *STM* with stack pointer as the base register.
- Data is POPPED from the stack when using LDR and LDM instructions with stack pointer as the base register.
- Stack pointer is updated on each action

== Stack types
- Descending / Ascending: whether the stack grows downwards or upwards (address decreases as stack grows or address increases as stack grows).
- Full / Empty: whether the stack pointer points to the last filled element or next empty space on the stack.

Default is Full Descending.

Can use suffixes as alternatives in load / store multiple:
- Full Descending (FD)
- Full Ascending (FA)
- Empty Descending (ED)
- Empty Ascending (EA)

#table(
  columns: (1fr,) * 3,
  stroke: none,
  table.header()[Stack Type][Push][Pop],
  [Full Descending], [STMFD (STMDB)], [LDMFD (LDMIA)],
  [Full Ascending], [STMFA (STMIB)], [LDMFA (LDMDA)],
  [Empty Descending], [STMED (STMDA)], [LDMED (LDMIB)],
  [Empty Ascending], [STMEA (STMIA)], [LDMEA (LDMDB)],
)

== Function call procedure
- Two parties: Caller, Callee
- Functions have return values, subroutines do not.
- Caller has to set up arguments
- Callee sets up return value
- Function call:
  - Acheived using `BL` (Branch and link).
  - `BL` saves current program counter in link register
  - Returning is achieved by `MOV PC, LR`

=== Nested function calls:
- Requires saving previous `LR` to the stack so we can return up the calling chain.

=== Register conflicts
Only 15 registers sharable between caller and calle.

Caller needs registers to pass arguments, Callee needs registeres to return values.

Callee should not corrupt any registers that caller might use after the function call.

To help resolve these conflicts, register groups are defined with usage rules:
- Scatch / argument: A1-A4
- Local variables: V1-V8

== Setting up function calls:

+ Create stack frame
  - Backup registers that conflict with caller
  - Save `LR` if current function calls another function
  - Pass arguments if A1-A4 insufficient
+ Perform operations (function body)
+ Remove stack frame and return to caller

