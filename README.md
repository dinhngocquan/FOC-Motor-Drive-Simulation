# FOC Motor Drive Simulation

Field-Oriented Control (FOC) simulation for an induction motor drive system, implemented in MATLAB/Simulink.

## Project Overview

This project contains a Simulink model for simulating a Field-Oriented Control (vector control) system for a three-phase induction motor. The model implements:

- **d-q axis current control** in the synchronous reference frame
- **PI controllers** for speed and current loops
- **Space Vector Pulse Width Modulation (SVPWM)** for inverter gating signals
- **Motor parameter calculations** based on induction motor equivalent circuit
```

## Requirements

- **MATLAB** R2020a or later
- **Simulink** with SimPowerSystems / Simscape Electrical toolbox
- **Control System Toolbox** (for PI controller design)

## How to Use

1. Open the Simulink model:
   ```matlab
   open_system('model/FOC_xeConCauTruc_discrete_251130_DNQ.mdl')
   ```

2. Set the MATLAB path to include the scripts folder:
   ```matlab
   addpath('scripts')
   ```

3. Run the parameter initialization script before simulation:
   ```matlab
   % Use default parameters
   parameters
   
   % OR use alternative configuration
   thongso
   ```

4. Run the Simulink model simulation:
   ```matlab
   sim('model/FOC_xeConCauTruc_discrete_251130_DNQ')
   ```

5. Load and plot results:
   ```matlab
   load('results/speed_ac.mat')
   load('results/speed_ref.mat')
   plot(tout, speed_ac)
   hold on
   plot(tout, speed_ref)
   legend('Actual Speed', 'Reference Speed')
   ```

## Motor Parameters

Two parameter sets are provided:

| Parameter | Description | Unit |
|-----------|-------------|------|
| `Tsample` | Sampling time | s |
| `Vdc` | DC bus voltage | V |
| `Rs` | Stator resistance | Ω |
| `Rr` | Rotor resistance | Ω |
| `Lls` | Stator leakage inductance | H |
| `Llr` | Rotor leakage inductance | H |
| `Lm` | Mutual inductance | H |
| `Ls` | Stator self inductance | H |
| `Lr` | Rotor self inductance | H |
| `J` | Inertia | kg·m² |
| `p` | Pole pairs | - |
| `eta` | Efficiency | - |

## Simulation Results

All `.mat` files in the `results/` folder contain simulation data in a variable named `tout` (time) and the corresponding signal data. These can be loaded and analyzed directly in MATLAB or exported to other tools for post-processing.
