# MIPS Processor Implementation

A complete MIPS (Microprocessor without Interlocked Pipeline Stages) processor implementation using Logisim circuit simulation. This project demonstrates both basic and advanced processor architectures with memory integration.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Processor Variants](#processor-variants)
- [Supported Instructions](#supported-instructions)
- [Sample Programs](#sample-programs)
- [File Formats](#file-formats)
- [Usage Guide](#usage-guide)
- [Components](#components)
- [Contributing](#contributing)

## 🎯 Overview

This repository contains two variants of a MIPS processor implementation designed in Logisim:

1. **No Memory Version**: A basic processor implementation without memory integration
2. **With Memory Version**: A complete processor with data memory, supporting load/store operations

Both implementations are built using modular components including ALU, Control Unit, Register File, and supporting circuitry.

## ✨ Features

- **Modular Design**: Separated components for ALU, Control Unit, and Register File
- **MIPS Instruction Set**: Supports R-type, I-type, and branch instructions
- **Memory Operations**: Load Word (LW) and Store Word (SW) instructions
- **Branching**: Conditional branch on equal (BEQ) support
- **Sample Programs**: Three example programs demonstrating various operations
- **Hex Format Support**: Programs converted to Logisim-compatible hex format
- **Complete Documentation**: Includes detailed reports (PDF format)

## 📁 Project Structure

```
MIPS_PROCESSOR/
│
├── No_memory/                          # Basic processor without memory
│   ├── B23EE1006_ALUControlUnit.circ  # ALU control logic
│   ├── B23EE1006_ALUMain.circ         # Main ALU implementation
│   ├── B23EE1006_ControlUnit.circ     # Main control unit
│   ├── B23EE1006_MAIN.circ            # Top-level processor circuit
│   ├── B23EE1006_RegisterFile.circ    # Register file (32 registers)
│   └── Report.pdf                      # Detailed documentation
│
└── With_memory/                        # Complete processor with memory
    ├── ALU.circ                        # Arithmetic Logic Unit
    ├── ALUCtrlUnit.circ                # ALU control signals
    ├── ControlUnit.circ                # Main control unit
    ├── RegisterFile.circ               # Register file implementation
    ├── B23EE1006_CompleteProcessor.circ # Complete processor circuit
    ├── b23ee1006_new.circ              # Alternative implementation
    ├── B23EE1006.pdf                   # Project documentation
    │
    ├── program1.asm                    # Sample program 1: Addition
    ├── program1.hex                    # Hex format of program 1
    ├── program1_result                 # Expected output
    │
    ├── program2.asm                    # Sample program 2: Subtraction & Branch
    ├── program2.hex                    # Hex format of program 2
    ├── program2_result                 # Expected output
    │
    ├── program3.asm                    # Sample program 3: Bitwise operations
    ├── program3.hex                    # Hex format of program 3
    └── program3_result                 # Expected output
```

## 🔧 Prerequisites

To run and simulate these circuits, you'll need:

- **Logisim Evolution** (recommended) or **Logisim Classic**
  - Download from: [Logisim Evolution](https://github.com/logisim-evolution/logisim-evolution)
  - Or: [Logisim Classic](http://www.cburch.com/logisim/)

- **Optional**: MIPS assembler for creating custom programs
  - MARS MIPS Simulator
  - SPIM Simulator

## 🚀 Getting Started

### Opening the Circuits

1. **Clone the repository**:
   ```bash
   git clone https://github.com/RepoRogue123/MIPS_PROCESSOR.git
   cd MIPS_PROCESSOR
   ```

2. **Open Logisim**:
   - Launch Logisim Evolution or Logisim Classic

3. **Load a circuit**:
   - For basic processor: Open `No_memory/B23EE1006_MAIN.circ`
   - For complete processor: Open `With_memory/B23EE1006_CompleteProcessor.circ`

### Running Programs

1. **Load Program Memory**:
   - Right-click on the ROM/RAM component
   - Select "Load Image"
   - Choose one of the `.hex` files (e.g., `program1.hex`)

2. **Simulate**:
   - Enable simulation: `Simulate → Simulation Enabled` (Ctrl+E)
   - Set clock tick: `Simulate → Auto-Tick Enabled` (Ctrl+K)
   - Adjust tick frequency as needed

3. **Observe Results**:
   - Monitor register values in the Register File
   - Check memory contents for stored results
   - Compare with expected outputs in `program*_result` files

## 🔄 Processor Variants

### No Memory Version

A simplified processor implementation focusing on core computational operations:

- **Components**: ALU, Control Unit, Register File
- **Operations**: Arithmetic and logical operations on registers
- **Use Case**: Understanding basic processor architecture
- **Main File**: `B23EE1006_MAIN.circ`

### With Memory Version

A complete processor with data memory integration:

- **Additional Features**: Load/Store operations, memory addressing
- **Components**: All basic components + Data Memory (RAM)
- **Operations**: Full MIPS instruction subset including memory access
- **Use Case**: Realistic program execution with data persistence
- **Main File**: `B23EE1006_CompleteProcessor.circ`

## 📖 Supported Instructions

### R-Type Instructions (Register Operations)

| Instruction | Format | Description | Example |
|------------|--------|-------------|---------|
| `ADD` | `add $rd, $rs, $rt` | Addition | `add $t4, $t2, $t3` |
| `SUB` | `sub $rd, $rs, $rt` | Subtraction | `sub $t4, $t2, $t3` |
| `AND` | `and $rd, $rs, $rt` | Bitwise AND | `and $t4, $t2, $t3` |
| `OR` | `or $rd, $rs, $rt` | Bitwise OR | `or $t5, $t2, $t3` |

### I-Type Instructions (Immediate Operations)

| Instruction | Format | Description | Example |
|------------|--------|-------------|---------|
| `ADDI` | `addi $rt, $rs, imm` | Add immediate | `addi $t0, $zero, 10` |
| `LW` | `lw $rt, offset($rs)` | Load word | `lw $t2, 0($zero)` |
| `SW` | `sw $rt, offset($rs)` | Store word | `sw $t0, 0($zero)` |
| `BEQ` | `beq $rs, $rt, label` | Branch if equal | `beq $t4, $zero, SAME` |

## 💻 Sample Programs

### Program 1: Addition with Memory

**Purpose**: Demonstrate basic arithmetic and memory operations

```assembly
addi $t0, $zero, 10        # $t0 = 10
addi $t1, $zero, 20        # $t1 = 20
sw   $t0, 0($zero)         # Store 10 at memory[0]
sw   $t1, 4($zero)         # Store 20 at memory[4]
lw   $t2, 0($zero)         # Load value from memory[0]
lw   $t3, 4($zero)         # Load value from memory[4]
add  $t4, $t2, $t3         # $t4 = 10 + 20 = 30
sw   $t4, 8($zero)         # Store result at memory[8]
END: beq  $zero, $zero, END # Infinite loop
```

**Expected Result**: Memory[8] = 30 (0x1E)

### Program 2: Conditional Branching

**Purpose**: Demonstrate subtraction and branch instructions

```assembly
addi $t0, $zero, 15        # $t0 = 15
addi $t1, $zero, 15        # $t1 = 15
sw   $t0, 0($zero)         # Store 15 at memory[0]
sw   $t1, 4($zero)         # Store 15 at memory[4]
lw   $t2, 0($zero)         # Load from memory
lw   $t3, 4($zero)         # Load from memory
sub  $t4, $t2, $t3         # $t4 = 15 - 15 = 0
beq  $t4, $zero, SAME      # Branch if result == 0
addi $t5, $zero, 1         # (Skipped)
SAME: sw $t4, 8($zero)     # Store result
END: beq $zero, $zero, END # Infinite loop
```

**Expected Result**: Memory[8] = 0, branch taken

### Program 3: Bitwise Operations

**Purpose**: Demonstrate AND and OR operations

```assembly
addi $t0, $zero, 6         # $t0 = 6 (0110 binary)
addi $t1, $zero, 3         # $t1 = 3 (0011 binary)
sw   $t0, 0($zero)         # Store values
sw   $t1, 4($zero)
lw   $t2, 0($zero)         # Load values
lw   $t3, 4($zero)
and  $t4, $t2, $t3         # $t4 = 6 AND 3 = 2
or   $t5, $t2, $t3         # $t5 = 6 OR 3 = 7
sw   $t4, 8($zero)         # Store AND result
sw   $t5, 12($zero)        # Store OR result
END: beq $zero, $zero, END # Infinite loop
```

**Expected Result**: Memory[8] = 2, Memory[12] = 7

## 📄 File Formats

### .circ Files

Logisim circuit files in XML format containing:
- Circuit components and their connections
- Component properties and configurations
- Sub-circuit definitions

### .asm Files

MIPS assembly source code files:
- Human-readable assembly instructions
- Comments explaining functionality
- Labels for branching

### .hex Files

Logisim-compatible hex format for program memory:
- Format: `v2.0 raw`
- Each instruction represented in hexadecimal
- Padded with `00000000` for NOP instructions (pipeline stages)
- Compatible with Logisim ROM/RAM image loading

### _result Files

Expected output files:
- Memory dump showing expected results
- Format: `v2.0 raw` followed by hex values
- Used for verification of correct execution

## 📚 Usage Guide

### Creating Custom Programs

1. **Write Assembly Code**:
   ```assembly
   # Your program here
   addi $t0, $zero, 5
   addi $t1, $zero, 3
   add $t2, $t0, $t1
   ```

2. **Convert to Machine Code**:
   - Use MARS or SPIM to assemble
   - Export as hex format
   - Ensure format matches Logisim requirements (`v2.0 raw`)

3. **Load into Processor**:
   - Open the circuit in Logisim
   - Load hex file into instruction memory
   - Run simulation

### Debugging Tips

- **Single-Step Mode**: Use manual tick mode to step through instructions
- **Probe Tool**: Right-click → Probe to monitor signal values
- **Register Inspection**: Monitor register file to track data flow
- **Memory Viewer**: Check RAM/ROM contents to verify load/store operations

## 🧩 Components

### ALU (Arithmetic Logic Unit)

- Performs arithmetic operations (ADD, SUB)
- Executes logical operations (AND, OR)
- Generates zero flag for branch decisions
- Configurable operation codes

### Control Unit

- Decodes instruction opcodes
- Generates control signals for datapath
- Manages RegWrite, MemWrite, MemRead signals
- Controls ALU operation selection

### Register File

- 32 general-purpose registers
- Dual read ports (read two registers simultaneously)
- Single write port
- Register $zero hardwired to 0

### Memory Unit (With Memory Version)

- Data RAM for load/store operations
- Word-aligned addressing (4-byte words)
- Synchronous read/write operations

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report Issues**: Found a bug? Open an issue
2. **Suggest Features**: Have ideas for improvements? Let us know
3. **Submit Pull Requests**: 
   - Fork the repository
   - Create a feature branch
   - Make your changes
   - Submit a pull request

### Areas for Contribution

- Additional sample programs
- Support for more MIPS instructions
- Pipeline implementation
- Hazard detection and forwarding
- Documentation improvements

## 📝 Notes

- **Register Convention**: Uses MIPS register naming ($t0-$t9, $zero, etc.)
- **Memory Addressing**: Word-aligned (addresses 0, 4, 8, 12, ...)
- **Pipeline Stages**: Hex files include NOPs for pipeline delays
- **Clock**: Synchronous design requiring clock signal

## 📄 License

This project is available for educational purposes. Please refer to any included documentation for specific licensing terms.

## 📧 Contact

For questions or feedback about this project, please open an issue on GitHub.

---

**Project ID**: B23EE1006

**Built with**: Logisim Circuit Simulator

**Architecture**: MIPS (32-bit)
