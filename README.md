# sync-fifo-verilog
Synchronous FIFO Memory Controller in Verilog

This project implements a Synchronous First-In First-Out (FIFO) Memory Controller using Verilog HDL.

The FIFO operates using a single clock domain for both read and write operations. Circular read and write pointers are used to manage data storage efficiently while maintaining the order of data transfer. The design includes status flag generation to indicate Full and Empty conditions and prevent overflow or underflow scenarios.

The project was developed to understand memory buffering concepts, pointer management, and RTL design methodologies commonly used in digital VLSI systems.
