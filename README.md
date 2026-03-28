# Table of Contents

- [Introduction](#introduction)
---
# Introduction

This project presents the design and implementation of a custom 16-bit single-cycle processor using Verilog HDL. The processor is based on a user-defined instruction set architecture (ISA) and is capable of executing each instruction in a single clock cycle.

The design follows a modular approach, incorporating key components such as the Program Counter, Instruction Memory, Control Unit, Register File, ALU, and Data Memory. The processor supports fundamental operations including arithmetic, logical, memory access, and control flow instructions.

The functionality of the processor is verified through simulation using testbenches and memory initialization files.

---
# Instruction Classification and ISA Architecture

## Opcode Mapping 

The processor supports 16 instructions, each uniquely identified by a 4-bit opcode.

| Opcode | Instruction | Description |
|--------|------------|-------------|
| 0000   | ADD        | DS = S1 + S2 |
| 0001   | SUB        | DS = S1 - S2 |
| 0010   | MUL        | DS = S1 * S2 |
| 0011   | DIV        | DS = S1 / S2 |
| 0100   | XOR        | DS = S1 ^ S2 |
| 0101   | AND        | DS = S1 & S2 |
| 0110   | OR         | DS = S1 \| S2 |
| 0111   | MOV        | DS = S1 |
| 1000   | LOADI_L    | Load immediate (lower byte) |
| 1001   | LOADI_H    | Load immediate (higher byte) |
| 1010   | LOAD       | DS = MEM[ADDR] |
| 1011   | STORE      | MEM[ADDR] = DS |
| 1100   | SHL        | DS = S1 << SHAMT |
| 1101   | SHR        | DS = S1 >> SHAMT |
| 1110   | JZ         | Jump if DS == 0 |
| 1111   | NOP        | No operation |


The processor implements a fixed-length 16-bit Instruction Set Architecture (ISA) characterized by a modular 4-bit field structure. Instructions are categorized into five distinct functional groups based on their impact on the Architectural State.

### 1. Arithmetic and Logic Instructions (R-Type)

These instructions form the core of the processor's computational power, performing operations on two source registers and storing the result in a destination register.

Format:
[ OPC (4) | DS (4) | S1 (4) | S2 (4) ]

 - ALU Operations: Supports addition, subtraction, bitwise AND, OR, XOR, and an 8-bit multiplication and division
 - Data Path: Operands are fetched from the Register File and processed by the ALU in a single cycle.


### 2. Data Movement and Immediate Instructions (I-Type)

These instructions handle the initialization of registers and the movement of data between different architectural states.

Format:
[ OPC (4) | DS (4) | S1 (4) | ---- (4) ]    
Format: [ OPC (4) | DS (4) | IMM (8) ]

 - Register-to-Register: The MOV instruction allows for direct data transfer between registers.
 - Immediate Loading: MVIH and MVIL allow for loading 8-bit constants into either the upper or lower byte of a 16-bit register, enabling the construction of full 16-bit values.

### 3. Shift Instructions (S-Type)

Used for bit-level manipulation, these instructions shift the contents of a register by a specified immediate value.

Format:
[ OPC (4) | DS (4) | S1 (4) | SHAMT (4) ]

 - Shift Operations: Supports both Shift Left Logical (SLL) and Shift Right Logical (SRL).
 - Control Logic: The lower 4 bits of the instruction word are used to define the shift amount

### 4. Memory Reference Instructions (M-Type)

These instructions facilitate interaction between the processor core and the 256-word Data Memory.

Format:
[ OPC (4) | DS (4) | MEM_ADDR (8) ]

 - Load: Retrieves a 16-bit word from a specified memory address and loads it into a destination register.
 - Store: Writes the contents of a source register into the Data Memory at a designated address.

### 5. Control Flow Instructions (J-Type)

The ISA includes a specialized control instruction to enable non-linear program execution through conditional branching.

Format:
[ OPC (4) | DS (4) | JUMP_ADDR (8) ]

 - Conditional Jump (JNZ): The data of DS register evaluates to a "Jump if Zero" condition.
 - PC Update: If the condition is met, the Program Counter is updated with an 8-bit immediate address instead of incrementing sequentially.

### 6. System Control Instructions (NOP)

Performs "No Operation." 

Format:
[ OPC (4) | ---- (12) ]

 - This instruction is used to create a predictable delay or to fill empty slots in the instruction memory without affecting registers or data memory.

---

# Core Architectural Blocks 

The processor's architecture is composed of several modular functional units, each designed to handle a specific stage of the instruction cycle within a single clock period. These blocks are interconnected via a 16-bit data bus and a centralized control signals network to ensure synchronized execution. From the initial instruction fetch in the Program Counter to the final write-back in the Register File, every module plays a specialized role in maintaining the integrity of the data path.

**List of Hardware Modules**
- Program Counter (PC): Manages the 8-bit instruction address.
- Instruction Memory (IMEM): Stores the 256-word instruction set.
- Register File: A $16 \times 16$-bit dual-port storage array.
- Arithmetic Logic Unit (ALU): Performs 10 distinct computational operations.
- Control Unit (CU): Generates 10 unique control signals based on the opcode.
- Data Memory: A 256-entry RAM for persistent data storage.
- Jump Decoder: Evaluates conditional branch logic.
- Multiplexers (Mux): Includes route_mux and sub_mux for dynamic data path routing.

### 1. Program Counter - [prog_cntr.v](Source%20Files/prog_cntr.v)
















