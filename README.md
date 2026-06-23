# Microprocessors and Microcontrollers

This repository contains laboratory exercises, source code, simulation files, reports, and final project materials for the **Microprocessors and Microcontrollers** course.

The course focuses on fundamental knowledge of microprocessors and microcontrollers, including the architecture, programming model, instruction set, memory organization, and peripheral interfacing of common embedded systems.

The coursework covers the **8086 microprocessor**, the **8051 microcontroller family**, and an introduction to other microcontroller architectures such as **AVR** and **ARM/STM32F1**. Through laboratory exercises, students gain practical experience in Assembly programming, circuit simulation, peripheral control, timer configuration, interrupt handling, UART communication, and embedded system design.

---

## Course Information

| Item | Details |
|---|---|
| Course | Microprocessors and Microcontrollers |
| Vietnamese Name | Vi xử lý - Vi điều khiển |
| Course Code | CE103 |
| Class Code | CE103.Q24 |
| Semester | Semester II, 2025–2026 |
| Instructor | The Tung Than |

---

## Repository Structure

```text
CE103-Microprocessors-and-Microcontrollers/
│
├── README.md
│
├── LAB01/
│   └── Acquaintance with Proteus and 8051
│
├── LAB02/
│   └── Communication with 7-Segment LED and Timer
│
├── LAB03/
│   └── Using Interrupt
│
├── LAB04/
│   └── Using UART
│
├── LAB05/
│   └── Addition and Subtraction of Two 32-bit Numbers on 8086
│
├── LAB06/
│   └── I/O Processing, Calculation and Memory on 8086
│
└── Final_Project/
    └── Smart Door Lock System Using 8051 MCU, RFID and SD Card Storage
```

---

## Laboratory Exercises

### LAB01 – Acquaintance with Proteus and the 8051 Microcontroller Family

This lab introduces circuit simulation using **Proteus** and Assembly programming for the **8051 microcontroller family**.

The main tasks include:

- Designing a heart-shaped LED circuit using 32 LEDs.
- Controlling LEDs with the AT89C51 microcontroller.
- Writing an Assembly program to run at least three LED effects.
- Researching the process of designing and implementing a printed circuit board.

The objective is to become familiar with Proteus, 8051 Assembly programming, and basic microcontroller-based circuit design.

---

### LAB02 – Communication with 7-Segment LED and Timer

This lab focuses on controlling 7-segment LED displays and using the Timer module of the 8051 microcontroller.

The main tasks include:

- Drawing the flowchart of the LED scanning algorithm.
- Displaying data using 7-segment LEDs.
- Configuring the 8051 Timer.
- Designing a 24-hour digital clock circuit.
- Comparing Timer-based delay and loop-based delay methods.

The objective is to understand display multiplexing, Timer configuration, and time-based control in embedded systems.

---

### LAB03 – Using Interrupt

This lab introduces interrupt handling on the 8051 microcontroller.

The main tasks include:

- Designing a stopwatch circuit using AT89C51/AT89C52.
- Displaying time using four 7-segment LED modules.
- Handling buttons using interrupt-based control.
- Implementing Pause/Resume and Reset functions.
- Extending the design with buttons to increase and decrease the counting value.

The objective is to understand interrupt configuration, external button handling, and real-time control in embedded systems.

---

### LAB04 – Using UART

This lab focuses on UART communication with the 8051 microcontroller.

The main tasks include:

- Designing a 4x4 keypad.
- Implementing number and operator input.
- Building a simple handheld calculator.
- Displaying calculations and results on a UART LCD.

The objective is to understand serial communication, keypad scanning, UART data transmission, and calculator logic implementation using 8051.

---

### LAB05 – Addition of Two 32-bit Numbers on the 8086 Processor

This lab focuses on arithmetic programming using the **8086 microprocessor** and **emu8086**.

The main tasks include:

- Studying the add/subtract example in emu8086.
- Writing an Assembly program to add two 32-bit numbers.
- Drawing the flowchart of the 32-bit addition algorithm.
- Extending the program to subtract two 32-bit numbers.

The objective is to understand multi-word arithmetic, carry handling, borrow handling, and Assembly programming on the 8086 processor.

---

### LAB06 – I/O Processing, Calculation and Memory on the 8086 Microprocessor

This lab focuses on keyboard input, console output, calculation, and memory usage on the 8086 microprocessor.

The main tasks include:

- Reading a 2-digit number `N` from the keyboard.
- Printing the first `N` Fibonacci numbers.
- Using memory or arrays to store intermediate values.
- Implementing another method to solve the same problem.

The objective is to practice 8086 Assembly programming, input/output processing, loop control, memory access, and numerical calculation.

---

## Final Project

### Smart Door Lock System Using 8051 MCU, RFID and SD Card Storage

The final project focuses on designing and implementing a smart door lock system using the 8051 microcontroller.

The system integrates multiple hardware modules, including:

- AT89S52 microcontroller.
- RFID module.
- LCD display.
- Servo motor.
- SD card storage.
- UART, SPI, and I2C communication.

The project demonstrates the application of microcontroller programming, peripheral interfacing, data storage, authentication logic, and embedded system design.

---

## Tools and Technologies

- Assembly Language
- C Language
- 8051 Microcontroller
- 8086 Microprocessor
- AT89C51 / AT89C52 / AT89S52
- emu8086
- Proteus
- Keil C
- Timer
- Interrupt
- UART
- GPIO
- 7-Segment LED
- LCD Display
- RFID
- SD Card

---

## Learning Outcomes

After completing this coursework, students are able to:

- Understand the architecture and operation of the 8086 microprocessor.
- Write and debug Assembly programs for the 8086 processor.
- Perform arithmetic operations on multi-byte and multi-word data.
- Understand the architecture and programming model of the 8051 microcontroller.
- Design and simulate microcontroller-based circuits using Proteus.
- Interface microcontrollers with LEDs, buttons, 7-segment displays, LCDs, and serial modules.
- Configure and use Timer, Interrupt, UART, GPIO, and memory-related functions.
- Apply microprocessor and microcontroller knowledge to embedded system design projects.

---

## Author

**Van Nhat Tan**  
Computer Engineering Student  
University of Information Technology – VNUHCM

---

## License

This repository is created for academic and educational purposes.

