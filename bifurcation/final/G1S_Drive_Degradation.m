%For fig. 7
clc
clear all;
close all;

tspan = 0:1:1000;

 %k1  k2  k3  k16 k34  k43  k61  k67 k76 k23 k25 k28  k89  k98 a    
k=[1 1.6 0.05 0.4 0.04 0.01 0.30 0.7 0.1 0.3 0.9 0.06 0.07 0.01 0.04];
 
 %J11 J12  J15   J18 J61 J62 J65 J68 J13 J63
J=[0.5 5.00 0.001 0.6 5.0 8.0 6.0 7 0.002 2.0];
 
   %Km1 Km2 Km4 Km9    kp
Km=[0.5 4.0 0.3 0.005 0.05];
   
   %phiRB phiE2F phicycD phicycDa phiAP  phiPRBp phiPRBpp phiCycE phiCyca Fm
phi=[0.005 0.1 0.02300 0.030000 0.0100 0.06000 0.040000 0.06000 0.05000 0.044];

C=0;
D=0;

pars = [k J Km phi C D];
initial = [5 0 0 0.01 0 0 0 0 0.01];
%figure;

%Solve for ODE at different Fm
for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    %subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};

Stability_Low=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
Stability_High=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];


Fm=zeros(1,16);
for i=1:16
    Fm(i)=i*0.0005;
end


%Constitutive Overspression of Cyclin D w/double degradation rate
C=0;
D=0.02;

k(10)=0.28;

pars = [k J Km phi C D];
pars(33)=0.04; %changing the degradation rate for cyclin D_i
pars(34)=0.05; %changing the degradation rate for cyclin D_a

%figure;

for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    %subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};

Stability_LowD(1,:)=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
Stability_HighD(1,:)=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];

%Constitutive Overspression of Cyclin D
C=0;
D=0.02;

k(10)=0.28;

pars = [k J Km phi C D];
pars(33)=0.023; %changing the degradation rate for cyclin D_i
pars(34)=0.03; %changing the degradation rate for cyclin D_a

%figure;

for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    %subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};

Stability_LowD(2,:)=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
Stability_HighD(2,:)=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];


% Generate Bifurcation plot
figure; axis([0 0.0005*16 0 15]);
subplot(2,1,1);plot(Fm,Stability_Low,Fm(7:16),Stability_High(7:16));
xlabel('Fm');ylabel('E2F1');grid on;title('Bifurcation without Overexpression of Cyclin E & D')

subplot(2,1,2);plot(Fm(8:16),Stability_HighD(1,8:16),'r',Fm,Stability_HighD(2,:),'g');
legend('increased degradation','normal degradation')
hold on
plot(Fm,Stability_LowD(1,:),'b',Fm,Stability_LowD(2,:),'b')
xlabel('Fm');ylabel('E2F1');grid on;title('Bifurcation with Overexpression of Cyclin D with increasing degradation rate')

