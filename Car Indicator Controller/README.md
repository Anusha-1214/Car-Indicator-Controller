# 🚗 Car Indicator Controller using Verilog

## 📌 Project Description

This project implements a Car Indicator Controller using Verilog HDL.

The system controls the left and right indicators of a vehicle.

It also supports hazard lights.

Hazard mode has the highest priority and turns ON both indicators.

The controller prevents conflicting left and right turn signals from
being activated simultaneously.

## ⚙️ Features

- Left turn indicator
- Right turn indicator
- Hazard light control
- Conflict prevention
- Reset functionality
- Verilog testbench
- VCD waveform generation
- Icarus Verilog simulation
- GTKWave support

## 🔌 Inputs

| Input | Value | Meaning |
|---|---|---|
| left_signal | 0 | Left OFF |
| left_signal | 1 | Left requested |
| right_signal | 0 | Right OFF |
| right_signal | 1 | Right requested |
| hazard_signal | 0 | Hazard OFF |
| hazard_signal | 1 | Hazard ON |

## 💡 Outputs

| Output | Value | Meaning |
|---|---|---|
| left_indicator | 0 | Left indicator OFF |
| left_indicator | 1 | Left indicator ON |
| right_indicator | 0 | Right indicator OFF |
| right_indicator | 1 | Right indicator ON |

## 📊 Priority

```text
Hazard Signal
     ↓
Left / Right Signal
     ↓
No Signal
