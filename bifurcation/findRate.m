function rate = findRate(pars,results)

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

for i = 1:size(results,1)
    rate(i) = kp+k2*(a^2+results(i,2)^2)*J12*J62/((Km2^2+results(i,2)^2)*(J12+results(i,1))*(J62+results(i,6)))-phi_E2F*results(i,2);
end

figure;
% plot(results(:,2),rate);
plot(results(:,2),rate);
end
% for i = 1:size(results,1)
%     ratep(i) = kp+k2*(a^2+results(i,2)^2)*J12*J62/((Km2^2+results(i,2)^2)*(J12+results(i,1))*(J62+results(i,6)));
%     rater(i) = phi_E2F*results(i,2);
% end
% 
% figure;
% plot(results(:,2),ratep,results(:,2),rater);
% 
% end
