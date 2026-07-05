# Microprossors-Labs
Microprocessor and Digital Logic labs from Minnesota State University, Mankato
# Lab 1 - Bit Mask Counting (AVR Assembly)

## Overview

This laboratory assignment was completed for EE235 at Minnesota State University, Mankato.

The program scans an array stored in program memory and counts how many bytes contain the required bit pattern using a bit mask.

## Concepts

- AVR Assembly
- ATxmega128A1U
- Program Memory (LPM)
- Bit Masking
- Conditional Branching
- Loops
- Registers

## Hardware

- ATxmega128A1U

## Algorithm

1. Load each byte from program memory.
2. Apply the mask `0x91`.
3. Compare the masked value with `0x91`.
4. Increment the counter when matched.
5. Store the final count in SRAM.

## Skills Demonstrated

- Embedded programming
- Assembly language
- Memory addressing
- Bitwise operations
