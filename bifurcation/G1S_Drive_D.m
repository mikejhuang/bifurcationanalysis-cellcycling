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
figure;

%Solve for ODE at different Fm
for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};%r17=result{17};r18=result{18};r19=result{19};r20=result{20};

Stability_Low=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];%,r17(200,2),r18(200,2),r19(200,2),r20(200,2)];
% Stability_High=[r1(1000,2),r2(1000,2),r3(1000,2),r4(1000,2),r5(1000,2),r6(1000,2),r7(1000,2),r8(1000,2),r9(1000,2),r10(1000,2),r11(1000,2),r12(1000,2),r13(1000,2),r14(1000,2),r15(1000,2),r16(1000,2),r17(1000,2),r18(1000,2),r19(1000,2),r20(1000,2)];
Stability_High=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];%,r17(800,2),r18(800,2),r19(800,2),r20(800,2)];


Fm=zeros(1,16);
for i=1:16
    Fm(i)=i*0.0005;
end
% %% Change in Cyclin E degradation
% C=0;
% D=0;
% k(12)=0.06;
% 
% pars = [k J Km phi C D];
% 
% figure;
% 
% for i=1:16
%     pars(40)=i*0.0005;
%     options = odeset('reltol',1e-6);
%     [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
%     subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
% end
% 
% r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
% r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
% r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
% r16=result{16};
% 
% Stability_LowDegE=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
% Stability_HighDegE=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];

%% Constitutive Overspression of Cyclin E
for j=1:4
C=[0 0.005 0.05 0.5];
D=0;
k(12)=0.04;

pars = [k J Km phi C(j) D];

figure;

for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};

Stability_LowE(j,:)=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
Stability_HighE(j,:)=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];

end
%% Constitutive Overspression of Cyclin D

for j=1:4
C=0;
D=[0 0.001 0.005 0.01];
k(10)=0.1;
k(12)=0.06;
pars = [k J Km phi C D(j)];

figure;

for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};

Stability_LowD(j,:)=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
Stability_HighD(j,:)=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];

end

%% Constitutive Overspression of Cyclin D & E
for j=1:4
C=[0 0.005 0.05 0.5];
D=[0 0.001 0.005 0.01];
k(12)=0.04;
k(10)=0.1;

pars = [k J Km phi C(j) D(j)];

figure;

for i=1:16
    pars(40)=i*0.0005;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
    subplot(4,4,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};

%Stability_LowDE=[r1(100,2),r2(100,2),r3(100,2),r4(100,2),r5(100,2),r6(100,2),r7(100,2),r8(100,2),r9(100,2),r10(100,2),r11(100,2),r12(100,2),r13(100,2),r14(100,2),r15(100,2),r16(100,2)];
Stability_LowDE(j,:)=[r1(200,2),r2(200,2),r3(200,2),r4(200,2),r5(200,2),r6(200,2),r7(200,2),r8(200,2),r9(200,2),r10(200,2),r11(200,2),r12(200,2),r13(200,2),r14(200,2),r15(200,2),r16(200,2)];
Stability_HighDE(j,:)=[r1(800,2),r2(800,2),r3(800,2),r4(800,2),r5(800,2),r6(800,2),r7(800,2),r8(800,2),r9(800,2),r10(800,2),r11(800,2),r12(800,2),r13(800,2),r14(800,2),r15(800,2),r16(800,2)];
end
%% Generate bifurcation plot for varying constitutive rates
figure;axis([0 0.0005*16 0 15]);
% set(gcf, 'renderer', 'opengl')
subplot(3,1,1);
plot(Fm,Stability_LowD, 'LineWidth', 1.5, 'LineSmoothing','on');
hold on
plot(Fm(7:16),Stability_HighD(1,7:16), Fm(7:16),Stability_HighD(2,7:16),Fm(5:16),Stability_HighD(3,5:16),Fm(3:16),Stability_HighD(4,3:16),'LineWidth',1.5,'LineSmoothing','on');
xlabel('Fm')
ylabel('E2F1')
legend('C_D=0','C_D=0.001','C_D=0.005','C_D=0.01')
subplot(3,1,2);
plot(Fm,Stability_LowE, 'LineWidth', 1.5, 'LineSmoothing','on');
hold on
plot(Fm(8:16),Stability_HighE(1,8:16),Fm(7:16),Stability_HighE(2,7:16),Fm(5:16),Stability_HighE(3,5:16),Fm(4:16),Stability_HighE(4,4:16),'LineWidth', 1.5, 'LineSmoothing','on');
xlabel('Fm')
ylabel('E2F1')
legend('C_E=0','C_E=0.005','C_E=0.05','C_E=0.5')
subplot(3,1,3);
plot(Fm,Stability_LowDE(1,:), Fm,Stability_LowDE(2,:),Fm,Stability_LowDE(3,:),Fm(1:4),Stability_LowDE(4,1:4),'LineWidth', 1.5, 'LineSmoothing','on');
hold on
plot(Fm(8:16),Stability_HighDE(1,8:16),Fm(7:16),Stability_HighDE(2,7:16),Fm(3:16),Stability_HighDE(3,3:16),Fm,Stability_HighDE(4,:),'LineWidth', 1.5, 'LineSmoothing','on');
xlabel('Fm')
ylabel('E2F1')
legend('0,0','0.001,0.005','0.005,0.05','0.01,0.5')
%% Generate comparison plot

% figure;axis([0 0.0005*16 0 15]);
% % set(gcf, 'renderer', 'opengl')
% subplot(3,1,1);
% plot(Fm,Stability_Low,Fm,Stability_LowE, 'LineWidth', 1.5, 'LineSmoothing','on');
% hold on
% plot(Fm(7:16),Stability_High(7:16),Fm(7:16),Stability_HighE(7:16),'LineWidth', 1.5, 'LineSmoothing','on');
% xlabel('Fm')
% ylabel('E2F1')
% legend('Base Model','w/CycE Constit.')
% subplot(3,1,2);
% plot(Fm,Stability_Low,Fm,Stability_LowD, 'LineWidth', 1.5, 'LineSmoothing','on');
% hold on
% plot(Fm(7:16),Stability_High(7:16),Fm(7:16),Stability_HighD(7:16),'LineWidth', 1.5, 'LineSmoothing','on');
% xlabel('Fm')
% ylabel('E2F1')
% legend('Base Model','w/CycD Constit.')
% subplot(3,1,3);
% plot(Fm,Stability_Low,Fm,Stability_LowDE, 'LineWidth', 1.5, 'LineSmoothing','on');
% hold on
% plot(Fm(7:16),Stability_High(7:16),Fm(7:16),Stability_HighDE(7:16),'LineWidth', 1.5, 'LineSmoothing','on');
% xlabel('Fm')
% ylabel('E2F1')
% legend('Base Model','w/CycD&E Constit.')
% myaa(10)
% %Generate Bifurcation plot
% figure; axis([0 0.0005*16 0 15]);
% subplot(4,1,1);plot(Fm,Stability_Low,Fm(7:16),Stability_High(7:16));
% xlabel('Fm');ylabel('E2F1');grid on;title('Bifurcation without Overexpression of Cyclin E & D')
% 
% subplot(4,1,2);plot(Fm,Stability_LowE,Fm(4:16),Stability_HighE(4:16));
% xlabel('Fm');ylabel('E2F1');grid on;title('Bifurcation with Overexpression of Cyclin E at C=0.2')
% 
% 
% subplot(4,1,3);plot(Fm,Stability_LowD,Fm(1:16),Stability_HighD(1:16));
% xlabel('Fm');ylabel('E2F1');grid on;title('Bifurcation with Overexpression of Cyclin D at D=0.02')
% 
% subplot(4,1,4);plot(Fm,Stability_LowDE,Fm(1:16),Stability_HighDE(1:16));
% xlabel('Fm');ylabel('E2F1');grid on;title('Bifurcation with Overexpression of Cyclin E & D  at E=0.2 & D=0.02')
% 
