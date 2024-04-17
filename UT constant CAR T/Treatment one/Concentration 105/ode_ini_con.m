clear all
close all
clc

rho =0.9032;
beta = 7.3156e+06;
replic_para=[rho,beta];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kappa=4.965724875
eta=4.399535064
gamma=0.319190588

lysing_para=[kappa,eta,gamma];
endurance=30;

ini_1=[0.1*10^(7),6*10^(5)];
ini_2=[0.2*10^(7),6*10^(5)];
ini_3=[0.3*10^(7),6*10^(5)];
ini_4=[0.4*10^(7),6*10^(5)];

[time_1, tumor_esti_1] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 endurance],ini_1);
[time_2, tumor_esti_2] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 endurance],ini_2);
[time_3, tumor_esti_3] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 endurance],ini_3);
[time_4, tumor_esti_4] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 endurance],ini_4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on
plot(time_1,tumor_esti_1(:,1),'b')
plot(time_2,tumor_esti_2(:,1),'r')
plot(time_3,tumor_esti_3(:,1),'g')
plot(time_4,tumor_esti_4(:,1),'m')
ylabel('Raji cell concentration (log(cells/ml))')
xlabel('Days post treatment')
axis([0 endurance 0 7*10^(6)])
hold off

figure
hold on
plot(time_1,tumor_esti_1(:,2),'b')
plot(time_2,tumor_esti_2(:,2),'r')
plot(time_3,tumor_esti_3(:,2),'g')
plot(time_4,tumor_esti_4(:,2),'m')
ylabel('CAR T cell concentration (log(cells/ml))')
xlabel('Days post treatment')
axis([0 endurance 0 6*10^(5)])
hold off





















