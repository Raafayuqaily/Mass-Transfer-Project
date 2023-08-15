%Mini Project 2

clc
clear

%Part 1

% Define constants
syms CB0 CB(L) CD(L) L P R Qb Qd phi
eqn1=diff(CB,L)==-(2*P*pi*R)/Qb*(CB-phi*CD); 
eqn2=diff(CD,L)==(2*P*pi*R)/Qd*(CB-phi*CD);
eqn=[eqn1; eqn2];
cond1=CB(0)==100;
cond2=CD(0)==0;
cond=[cond1 ; cond2];
[Cbsol(L),Cdsol(L)]=dsolve(eqn, cond);

P = 5.4*10^(-2); 
phi = 1;
L=20; % length is always constant
Qb=150;
Qd=2*Qb;

i=1;
for R=0:0.05:20 %20 cm for question 1, 200 cm for question 2 of part 1
    output(i) = eval(subs(Cbsol));
    i = i+1;
end

% plot
R=0:0.05:20; %20 cm for question 1, 200 cm for question 2 of part 1
figure
hold on
plot(R,output)
yline(60)
xlabel('Radius (cm)')
ylabel(' % Concentration of A')
title('Concentration vs. Time')
