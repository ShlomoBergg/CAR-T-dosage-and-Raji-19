clear all
close all
clc

all_data_24=xlsread('Fig_2B_CAR_Transduced_rechallege_ml.xlsx',1);

tumor_cell_24 = all_data_24(1,:);

% % % rho =0.7161;
% % % beta = 1.0897e+09;
rho =0.9032;
beta = 7.3156e+06;
replic_para=[rho,beta];

kappa_0=10^(-1);
gamma_0=10^(-1);
eta_0=10^(-1);
% b_0=10^(-1);
% c_0=10^(-1);
lysing_para=[kappa_0,gamma_0,eta_0];

target_cell=50000*5;
effector_cell=[50000*5;25000*5;12500*5;6250*5];


    ub=[10^(4),10^(4),10^(4)];
    lb=[0,0,0];
    lysing_para = fmincon(@(lysing_para)moder2(lysing_para,replic_para,tumor_cell_24,target_cell,effector_cell),lysing_para, [],[],[],[],lb,ub);

ini_1=[target_cell,effector_cell(1)];
ini_2=[target_cell,effector_cell(2)];
ini_3=[target_cell,effector_cell(3)];
ini_4=[target_cell,effector_cell(4)];

        [~, tumor_esti_1] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_1);
        [~, tumor_esti_2] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_2);
        [~, tumor_esti_3] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_3);
        [~, tumor_esti_4] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_4);


        estimated_result_24=[tumor_esti_1(end,1), tumor_esti_2(end,1),tumor_esti_3(end,1),tumor_esti_3(end,1)];

        error_in_data_A = sum((log10(estimated_result_24) - log10(tumor_cell_24)).^2);


%         error_in_data_A = sum((log10(estimated_result) - log10(tumor_cell_data)).^2);
        

    disp(lysing_para);
    disp(lysing_para(1,1));
    disp(lysing_para(1,2));
    disp(lysing_para(1,3));
%     disp(lysing_para(1,4));
%     disp(lysing_para(1,5));
%     disp(replic_para(1,6));
%     disp(error_in_data2);

    a1=(lysing_para(1,1));
    a2=(lysing_para(1,2));
    a3=(lysing_para(1,3));
%     a4=(lysing_para(1,4));
%     a5=(lysing_para(1,5));
%     a6=(k1(1,6));
    
%     results(:,1)=[a1;a2;error_in_data_A]

% % % 
% filename1 ='estimated_parameter_saturated1A.xlsx';
% writematrix(results, filename1,'Sheet',1,'range','A1')
ET=linspace(1,4,4);

figure 
hold on
plot(ET,tumor_cell_24,'r.');
plot(ET,estimated_result_24,'b*');
xlabel('antibody concentration'); % plotting final fit
ylabel('Tumour cell count (log10 cell/ml)');
hold off



