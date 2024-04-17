clear all
close all
clc


all_data=xlsread('HL60short_ml.xlsx',1)
% initial_cell=xlsread('HL60short_ml.xlsx',2)

antibody_con = all_data(:,1);
tumor_cell = all_data(:,2);

rho =0.7180;
beta = 1.6251e+06;
replic_para=[rho,beta];

kappa_0=10^(-1);
phi_0=10^(-1);
lysing_para=[kappa_0,phi_0];

Target_ini=10^(5);
Effector_ini=5*10^(5);
ini_cell=[Target_ini,Effector_ini];

ini_1=[ini_cell(1),antibody_con(1)];
% ini_2=[ini_cell(1),antibody_con(2)];
% ini_3=[ini_cell(1),antibody_con(3)];
% ini_4=[ini_cell(1),antibody_con(4)];
% ini_5=[ini_cell(1),antibody_con(5)];
% ini_6=[ini_cell(1),antibody_con(6)];
% ini_7=[ini_cell(1),antibody_con(7)];
% ini_8=[ini_cell(1),antibody_con(8)];

        [time_1, tumor_esti_1] = ode23(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_1);
%         [time_2, tumor_esti_2] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_2);
%         [time_3, tumor_esti_3] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_3);
%         [time_4, tumor_esti_4] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_4);
%         [time_5, tumor_esti_5] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_5);
%         [time_6, tumor_esti_6] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_6);
%         [time_7, tumor_esti_7] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_7);
%         [time_8, tumor_esti_8] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para, Effector_ini)),[0 2],ini_8);

figure 
hold on
plot(time_1,tumor_esti_1,'r.');
% plot(time_data,estimated_result,'b*');
xlabel('Days post inoculation'); % plotting final fit
ylabel('Tumour cell count (log10 cell/ml)');
hold off

% figure
% plot(time_3,tumor_esti_3)