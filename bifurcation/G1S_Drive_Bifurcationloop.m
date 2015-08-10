% clc
% clear all;
% close all;

tspan = 0:1:1000;

 %k1  k2  k3  k16 k34  k43  k61  k67 k76 k23 k25 k28  k89  k98 a    
k=[1 1.6 0.05 0.4 0.04 0.01 0.30 0.7 0.1 0.3 0.9 0.01 0.07 0.01 0.04];
 
 %J11 J12  J15   J18 J61 J62 J65 J68 J13 J63
J=[0.5 5.00 0.001 0.6 5.0 8.0 6.0 7 0.002 2.0];
 
   %Km1 Km2 Km4 Km9    kp
Km=[0.5 4.0 0.3 0.005 0.05];
C=[0:0.2:0.8];
figure;
for cind=1:length(C)
   %phiRB phiE2F phicycD phicycDa phiAP  phiPRBp phiPRBpp phiCycE phiCyca Fm
phi=[0.005 0.1 0.02300 0.030000 0.0100 0.06000 0.040000 0.06000 0.05000 0.044];
pars = [k J Km phi C(cind)];
initial = [5 0 0 0.01 0 0 0 0 0.01];
% figure;
for i=1:20
    pars(40)=i*0.0009;
    options = odeset('reltol',1e-6);
    [t,result{i}]=ode45(@G1S_Func,tspan,initial,options,pars);
%     subplot(4,5,i);plot(t,result{i}); axis([0 1000 0 15]);
end

r1=result{1};r2=result{2};r3=result{3};r4=result{4};r5=result{5};
r6=result{6};r7=result{7};r8=result{8};r9=result{9};r10=result{10};
r11=result{11};r12=result{12};r13=result{13};r14=result{14};r15=result{15};
r16=result{16};r17=result{17};r18=result{18};r19=result{19};r20=result{20};
Stability_Low=[r1(90,2),r2(90,2),r3(90,2),r4(90,2),r5(90,2),r6(90,2),r7(90,2),r8(90,2),r9(90,2),r10(90,2),r11(90,2),r12(90,2),r13(90,2),r14(90,2),r15(90,2),r16(90,2),r17(90,2),r18(90,2),r19(90,2),r20(90,2)];
Stability_High=[r1(1000,2),r2(1000,2),r3(1000,2),r4(1000,2),r5(1000,2),r6(1000,2),r7(1000,2),r8(1000,2),r9(1000,2),r10(1000,2),r11(1000,2),r12(1000,2),r13(1000,2),r14(1000,2),r15(1000,2),r16(1000,2),r17(1000,2),r18(1000,2),r19(1000,2),r20(1000,2)];

Fm=zeros(1,20);
for i=1:20
    Fm(i)=i*0.0009;
end
axis([0 0.0009*20 0 15]);
plot(Fm,Stability_Low);
hold on
plot(Fm,Stability_High); grid on;
end

%
% figure(1); %Plots for pRB and E2F
% plot(t,result(:,1),'r',t,result(:,2),'g',t,result(:,4),'b',t,result(:,9),'c');
% xlabel('Time');ylabel('Concentration');title('Time course of computed protein concentrations.')
% legend('pRB','E2F','Cyclin D/cdk4,6','Cyclin E/cdk2');
% 
% figure(2); %Plots for cyclin D & E, activated cyclin D &E
% plot(t,result(:,3),'b',t,result(:,8),'g')
% xlabel('Time');ylabel('Concentration');title('Bistability of Cyclins');
% legend('CycD','CycE');
% 
% figure(3) %plots for the generation rate of cyclin E
% plot(t,0.06*result(:,2).*0.6*7./((0.6+result(:,1)).*(7+result(:,6))))
% xlabel('Time');ylabel('Concentration');title('Generation rate of Cyclin E');
% 
% 
% % plot(t,result)
% % legend('pRB','E2F','CycD','CycD_a','AP','pRB_p','pRB_pp','CycE','CycE_a')
