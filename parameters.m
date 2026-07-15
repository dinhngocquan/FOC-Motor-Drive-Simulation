clear all
Tsample = 1e-5;                  % Sampling Time (sec)
Vdc = 900;                  % Bus DC Voltage (V)

p = 4;
P = 8;
Rs = 1.000830856;
Lls = 0.009662862;
Rr = 0.97664535;
Llr = 0.009662862;
Lm = 0.1213;

Lr = 0.130957;
Ls = 0.130957498;

Ts = Ls/Rs;
Tr = Lr/Rr;
sigma = 1 - Lm^2/(Lr*Ls);

k = Ts*Tr/(Ls*Tr+(1-sigma)*Ls*Ts);
Ti = sigma*Ts*Tr/(Tr+(1-sigma)*Ts);

Ti1 = Ti;
kp1 = Ti1/(k*5*(1/4000));
ki1 = kp1/Ti1;


KT = 3/2*p*Lm/Lr*0.894;

eta = 0.7;
T0w = 25*1/4000;
Ti2 = 2*eta*T0w;
kp2 = 2*eta*0.0676/(KT*T0w);
ki2 = kp2/Ti2;

