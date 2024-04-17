clear all
close all
clc


UT_CAR_transduced=xlsread('UT_CAR_transduced.xlsx',1)
UT_CAR_transduced_rechallege=xlsread('UT_CAR_transduced_rechallege.xlsx',1)
VIII_CAR_transduced=xlsread('VIII_CAR_transduced.xlsx',1)
VIII_CAR_transduced_rechallege=xlsread('VIII_CAR_transduced_rechallege.xlsx',1)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

UT_CAR_transduced_kappa=log10(UT_CAR_transduced(1,:));
UT_CAR_transduced_gamma=log10(UT_CAR_transduced(2,:));
UT_CAR_transduced_eta=log10(UT_CAR_transduced(3,:));

UT_CAR_transduced_rechallege_kappa=log10(UT_CAR_transduced_rechallege(1,:))
UT_CAR_transduced_rechallege_gamma=log10(UT_CAR_transduced_rechallege(2,:))
UT_CAR_transduced_rechallege_eta=log10(UT_CAR_transduced_rechallege(3,:))

VIII_CAR_transduced_kappa=log10(VIII_CAR_transduced(1,:))
VIII_CAR_transduced_gamma=log10(VIII_CAR_transduced(2,:))
VIII_CAR_transduced_eta=log10(VIII_CAR_transduced(3,:))

VIII_CAR_transduced_rechallege_kappa=log10(VIII_CAR_transduced_rechallege(1,:))
VIII_CAR_transduced_rechallege_gamma=log10(VIII_CAR_transduced_rechallege(2,:))
VIII_CAR_transduced_rechallege_eta=log10(VIII_CAR_transduced_rechallege(3,:))



figure 
% scatter3(UT_CAR_transduced_kappa,UT_CAR_transduced_gamma,UT_CAR_transduced_eta,'r','filled')
% scatter3(UT_CAR_transduced_rechallege_kappa,UT_CAR_transduced_rechallege_gamma,UT_CAR_transduced_rechallege_eta,'b','filled')
scatter3(VIII_CAR_transduced_kappa,VIII_CAR_transduced_gamma,VIII_CAR_transduced_eta,'k','filled')
hold on
scatter3(VIII_CAR_transduced_rechallege_kappa,VIII_CAR_transduced_rechallege_gamma,VIII_CAR_transduced_rechallege_eta,'c','filled')
hold off
grid on 
xlabel('kappa')
ylabel('eta')
zlabel('gamma')