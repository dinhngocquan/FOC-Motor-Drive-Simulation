# FOC Motor Drive Simulation

A Simulink-based Field-Oriented Control (FOC) simulation for an AC motor drive system. This project implements vector control with current and speed PID controllers for precise torque and speed regulation.

## Overview

This project simulates a three-phase AC motor driven by a Field-Oriented Control algorithm. The simulation includes:

- **FOC (Field-Oriented Control)** with Clarke and Park transformations
- **Current loop PID controllers** (d-axis and q-axis)
- **Speed loop PID controller**
- **SVPWM (Space Vector Pulse Width Modulation)** inverter model
- **Discrete-time implementation** for digital control

## Project Structure

```
FOC_xeConCauTruc_discrete_251130_DNQ/
├── FOC_xeConCauTruc_discrete_251130_DNQ.mdl   # Main Simulink model
├── parameters.m                                # Controller PID parameters
├── motor_params.m                              # Motor specifications and derived parameters
├── speed_ref.mat                               # Speed reference signal data
├── velocity_ref.mat                            # Velocity reference signal data
├── .gitignore                                  # Git ignore rules for MATLAB/Simulink
└── README.md                                   # This file
```

## Motor Specifications

| Parameter | Symbol | Value | Unit |
|-----------|--------|-------|------|
| Rated Power | Pn | 11000 | W (11 kW) |
| Rated Voltage (line-to-line) | Vn | 400 | V |
| Rated Frequency | fn | 50 | Hz |
| Stator Resistance | Rs | 0.386 | Ohms |
| Rotor Resistance | Rr | 0.381 | Ohms |
| Stator Leakage Inductance | Lls | 0.00524 | H |
| Rotor Leakage Inductance | Llr | 0.00524 | H |
| Mutual Inductance | Lm | 0.141 | H |
| Inertia | J | 0.055 | kg·m² |
| Friction Factor | F | 0.0 | N·m·s |
| Pole Pairs | p | 2 | - |
| DC Bus Voltage | Vdc | 510 | V |

## Controller Parameters

### Current Loop (d-q axis)

| Parameter | Value | Description |
|-----------|-------|-------------|
| Sampling Time | 1e-5 | s (10 µs) |
| Proportional Gain | kp1 | Current loop P gain |
| Integral Gain | ki1 | Current loop I gain |

### Speed Loop

| Parameter | Value | Description |
|-----------|-------|-------------|
| Torque Constant | KT | Motor torque constant |
| Proportional Gain | kp2 | Speed loop P gain |
| Integral Gain | ki2 | Speed loop I gain |

## Prerequisites

- **MATLAB** R2020a or later
- **Simulink** (with Simscape / Power Systems toolbox recommended)
- **Control System Toolbox**

## How to Run

1. Open MATLAB and navigate to this project directory:
   ```matlab
   cd FOC_xeConCauTruc_discrete_251130_DNQ
   ```

2. Load the motor parameters:
   ```matlab
   run('motor_params.m')
   run('parameters.m')
   ```

3. Open the Simulink model:
   ```matlab
   FOC_xeConCauTruc_discrete_251130_DNQ
   ```

4. Click **Run** in Simulink to start the simulation.

5. View results in the Simulink scope blocks or export data to the MATLAB workspace.

## Simulation Parameters

| Parameter | Value | Description |
|-----------|-------|-------------|
| Sample Time | 1e-5 s | Discrete control period |
| DC Bus Voltage | 510 V | Inverter input voltage |
| Switching Frequency | 5000 Hz | PWM carrier frequency |

## Reference Signals

- `speed_ref.mat` — Speed reference profile (rad/s or RPM)
- `velocity_ref.mat` — Velocity reference profile

## Key Features

- **Discrete-time FOC controller** — Suitable for DSP/FPGA implementation
- **PI current controllers** — Independent d-axis (flux) and q-axis (torque) control
- **PI speed controller** — Regulates motor speed to reference
- **SVPWM modulation** — Efficient inverter switching strategy
- **Parametrized design** — Motor and controller parameters defined in `.m` files
