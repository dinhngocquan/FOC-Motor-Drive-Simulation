clc;
clear;
%% Motor parameters
Tsample = 1e-5;                  % Sampling Time (sec)
%Pn = 4000;                 % Motor power (1492 W-2HP)
Pn = 11000;
Vn = 400;                   % Line to line voltage (V)
fn = 50;                    % Frequency (Hz)
% Rs = 13.0108;                    % Stator resistance (Ohms)
% Rs = 1.000830856;
Rs = 0.386041637;
% Lls = 0.009662862;                 % Stator leakage inductance (H)
Lls = 0.005238655;
% Rr = 12.69639;                   % Rotor resistance (Ohm)
% Rr = 0.976645435;
Rr = 0.380952381;
% Llr = 0.009662862;                 % Rotor leakage inductance (H)
Llr = 0.005238655;
% Lm = 0.121295;                  % Mutual Inductance (H)
Lm = 0.141018834;
Ls = Lm + Lls;              % Stator self inductance (H)
Lr = Lm + Llr;              % Rotor self inductance (H)
% J = 0.0676;                   % Inertia(kg.m^2)
J = 0.055;
F = 0.0;                 % Friction factor (N.m.s)
% p = 4; 
% P=8;
p = 2;
P = 4;
% Number of pole pairs
Tr = Lr/Rr;                 % Time Constant of flux (second
sigma = 1-Lm^2/(Ls*Lr);
Vdc = 510;                  % Bus DC Voltage (V)

Ts = Ls/Rs;
Tr = Lr/Rr;
sigma = 1 - Lm^2/(Lr*Ls);

k = Ts*Tr/(Ls*Tr+(1-sigma)*Ls*Ts);
Ti = sigma*Ts*Tr/(Tr+(1-sigma)*Ts);

Ti1 = Ti;
kp1 = Ti1/(k*5*(1/5000));
ki1 = kp1/Ti1;


KT = 3/2*p*Lm/Lr*0.95;

eta = 0.7;
T0w = 25*1/5000;
Ti2 = 2*eta*T0w;
kp2 = 2*eta*0.0479/(KT*T0w);
ki2 = kp2/Ti2;

