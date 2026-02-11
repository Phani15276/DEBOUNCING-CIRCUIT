## 📄 debouncing.v – Module Description

The `debouncing.v` file implements a **Finite State Machine (FSM)-based push button debouncing circuit** in Verilog.  
It removes mechanical switch bouncing and generates a clean, stable output signal.

### 🔁 FSM States

The module uses multiple states to validate stable transitions:

- **s0** – Initial idle state (button not pressed).
- **w1, w2, w3** – Waiting states to confirm a valid button press.
- **s1** – Confirmed pressed state (stable HIGH output).
- **w4, w5, w6** – Waiting states to confirm button release.

### ⚙️ Working Principle

1. When the switch input changes, the FSM does not update the output immediately.
2. It moves through intermediate waiting states (`w` states).
3. If the input remains stable for multiple `m_tick` cycles,  
   the FSM transitions to the confirmed state (`s0` or `s1`).
4. This eliminates false triggering caused by switch bouncing.

### 🎯 Output Behavior

- Output changes only after stability is confirmed.
- Ensures one clean transition per press and per release.
