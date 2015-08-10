function dydt=G1S_Func(t,y,pars)

RB = y(1);
E2F = y(2);
CycD = y(3);
CycD_a = y(4);
AP = y(5);
RB1 = y(6);
RB2 = y(7);
CycE = y(8);
CycE_a = y(9);

k1 = pars(1);
k2 = pars(2);
k3 = pars(3);
k16 = pars(4);
k34 = pars(5);
k43 = pars(6);
k61 = pars(7);
k67 = pars(8);
k76 = pars(9);
k23 = pars(10);
k25 = pars(11);
k28 = pars(12);
k89 = pars(13);
k98 = pars(14);
a = pars(15);
J11 = pars(16);
J12 = pars(17);
J15 = pars(18);
J18 = pars(19);
J61 = pars(20);
J62 = pars(21);
J65 = pars(22);
J68 = pars(23);
J13 = pars(24);
J63 = pars(25);
Km1 = pars(26);
Km2 = pars(27);
Km4 = pars(28);
Km9 = pars(29);
kp = pars(30);
phi_RB = pars(31);
phi_E2F = pars(32);
phi_CycD = pars(33);
phi_CycD_a = pars(34);
phi_AP = pars(35);
phi_RB1 = pars(36);
phi_RB2 = pars(37);
phi_CycE = pars(38);
phi_CycE_a = pars(39);
Fm = pars(40);
C=pars(41);
D=pars(42);
% for t=1:100000
% Fm(t)=0.01;
% if t>10000
%     Fm(t)=0.01/(t*0.0001);
% end
% end
% Ramp down
% Fm=0.01;
% if t>10000
%     Fm=0.01/(t*0.0001);
% end
% Ramp up
% Fm=0.01;
% if t>10
%     Fm=0.001*(t*0.1);
% end

dydt(1,1) = k1*E2F*J11*J61/((Km1+E2F)*(J11+RB)*(J61+RB1))-k16*RB*CycD_a+k61*RB1-phi_RB*RB;
dydt(2,1) = kp+k2*(a^2+E2F^2)*J12*J62/((Km2^2+E2F^2)*(J12+RB)*(J62+RB1))-phi_E2F*E2F;
dydt(3,1) = D+k3*AP+k23*E2F*J13*J63/((J13+RB)*(J63+RB1))+k43*CycD_a-k34*CycD*CycD_a/(Km4+CycD_a)-phi_CycD*CycD;
% dydt(3,1) = 0.004+0.67*k3*AP+k23*E2F*J13*J63/((J13+RB)*(J63+RB1))+k43*CycD_a-k34*CycD*CycD_a/(Km4+CycD_a)-phi_CycD*CycD;
dydt(4,1) = k34*CycD*CycD_a/(Km4+CycD_a)-k43*CycD_a-phi_CycD_a*CycD_a;
dydt(5,1) = Fm + k25*E2F*J15*J65/((J15+RB)*(J65+RB1))-phi_AP*AP;
dydt(6,1) = k16*RB*CycD_a-k61*RB1-k67*RB1*CycE_a+k76*RB2-phi_RB1*RB1;
dydt(7,1) = k67*RB1*CycE_a-k76*RB2-phi_RB2*RB2;
dydt(8,1) = C+k28*E2F*J18*J68/((J18+RB)*(J68+RB1))+k98*CycE_a-k89*CycE*CycE_a/(Km9+CycE_a)-phi_CycE*CycE;
% dydt(8,1) = 0.8+0.67*k28*E2F*J18*J68/((J18+RB)*(J68+RB1))+k98*CycE_a-k89*CycE*CycE_a/(Km9+CycE_a)-phi_CycE*CycE;
dydt(9,1) = k89*CycE*CycE_a/(Km9+CycE_a)-k98*CycE_a-phi_CycE_a*CycE_a;

end