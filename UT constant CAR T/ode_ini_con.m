clear all
close all
clc

rho =0.9032;
beta = 7.3156e+06;
replic_para=[rho,beta];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

kappa=5.235023747;
eta=4.370548803;
gamma=0.351590694;
lysing_para=[kappa,eta,gamma];


ini_1=[1*10^(6),12.5*10^(5)];
ini_2=[2*10^(6),12.5*10^(5)];
ini_3=[3*10^(6),12.5*10^(5)];
ini_4=[4*10^(6),12.5*10^(5)];

        [time_1, tumor_esti_1] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 20],ini_1);
        [time_2, tumor_esti_2] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 20],ini_2);
        [time_3, tumor_esti_3] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 20],ini_3);
        [time_4, tumor_esti_4] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 20],ini_4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on
plot(time_1,tumor_esti_1(:,1),'r')
plot(time_2,tumor_esti_2(:,1),'b')
plot(time_3,tumor_esti_3(:,1),'c')
plot(time_4,tumor_esti_4(:,1),'k')
ylabel('Raji cell concentration (log(cells/ml))')
xlabel('Day post treatment')
axis([0 20 0 8*10^(6)])
hold off























