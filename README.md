# 8-Bit PIPO Register Using VHDL

This project implements an **8-bit Parallel-In Parallel-Out (PIPO) Register** using VHDL, with synchronous load and asynchronous reset, in Xilinx ISE.

## Objectives

- Design a D Flip-Flop and a 2:1 Multiplexer.
- Build a 1-bit register using the MUX and D Flip-Flop.
- Connect eight 1-bit registers to create an 8-bit PIPO register.
- Generate and verify RTL schematics using Xilinx ISE.
- Verify Load, Hold, and Asynchronous Reset operations using ISim.

## Project Files

- `DFlipFlop.vhd` – D Flip-Flop module with asynchronous reset
- `Multiplexer2.vhd` – 2:1 Multiplexer module
- `Register1Bit.vhd` – 1-bit register using MUX and D-FF
- `Register8bit.vhd` – Top-level 8-bit PIPO register
- `Register8bitTb.vhd` – VHDL testbench for functional verification

## Functional Operations

| RESET | LOAD | Operation |
|-------|------|-----------|
| 1 | X | Asynchronous Reset |
| 0 | 1 | Load input data |
| 0 | 0 | Hold previous data |

The register loads the input `D[7:0]` on the active clock edge when `LOAD = 1`. When `LOAD = 0`, the previous value is retained. Setting `RESET = 1` clears the register asynchronously.

## Simulation

The design was verified using ISim with different combinations of Reset, Load, Clock, and 8-bit input data.

Example test cases:

- `10101010` → Loaded successfully
- `11111111` → Ignored during Hold state
- `01010101` → Loaded successfully
- `RESET = 1` → Output cleared to `00000000`

## Tools Used

- Xilinx ISE Design Suite
- ISim Simulator
- VHDL

## Conclusion

An 8-bit PIPO Register was successfully designed using a hierarchical structural approach. The design was synthesized in Xilinx ISE and functionally verified using ISim for parallel loading, data retention, and asynchronous reset operations.
