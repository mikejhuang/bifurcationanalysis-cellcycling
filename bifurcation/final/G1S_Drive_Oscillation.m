%For fig. 8

clc;
clear all;
close all;

tspan = [0 2000];

 %k1  k2  k3  k16 k34  k43  k61  k67 k76 k23 k25 k28  k89  k98 a    
k=[1 1.6 0.05 0.4 0.04 0.01 0.30 0.7 0.1 0.3 0.9 0.06 0.07 0.01 0.44];
 
 %J11 J12  J15   J18 J61 J62 J65 J68 J13 J63
J=[0.5 5.00 0.001 0.6 5.0 8.0 6.0 7 0.002 2.0];
 
   %Km1 Km2 Km4 Km9    kp
Km=[0.5 4.0 0.3 0.005 0.05];
   
   %phiRB phiE2F phicycD phicycDa phiAP  phiPRBp phiPRBpp phiCycE phiCyca Fm
phi=[0.005 0.1 0.02300 0.030000 0.0100 0.06000 0.040000 0.06000 0.05000 0.007];

%Constitutive Concentration
C=0;
D=0;
k(12)=0.06;

pars = [k J Km phi C D];
initial = [5 0 0 0.01 0 0 0 0 0.01];

options = odeset('reltol',1e-6);
[t,result]=ode45(@G1S_Func_Oscillation,tspan,initial,options,pars);

figure; %Plots for pRB and E2F
plot(t,result(:,1),'r',t,result(:,2),'g',t,result(:,4),'b',t,result(:,9),'c','linesmoothing','on');
xlabel('Time');ylabel('Concentration');title('Time course of computed protein concentrations.')
legend('pRB','E2F','Cyclin D/cdk4,6','Cyclin E/cdk2');

