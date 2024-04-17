clear all
close all
clc

rho =0.9032;
beta = 7.3156e+06;
replic_para=[rho,beta];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % kappa=4.965724875
% % eta=4.399535064
% % gamma=0.319190588

% kappa=8.063354128;
% eta=9.09159046;
% gamma=0.414826242;

kappa=4.965724875;
eta=4.399535064
gamma=0.319190588;

killing_para=[kappa,eta,gamma];


n=2.0*10^(6);
m=10^(3)+1;
effector_con=linspace(0,n,m);
[C2, C1,C0,Delta]=bifurcation_function(replic_para,killing_para,effector_con);

for i=1:m
if Delta(i)<0
    Delta(i)=0, C1(i)=0, C0(i)=0;
    
end
end 

V1=(-C1-sqrt(Delta))./(2.*C2);
V2=(-C1+sqrt(Delta))./(2.*C2);



figure 
% target cells
hold on
plot(effector_con,V1,'c')
plot(effector_con,V2,'k')
plot(6*10^(5),0.1*10^(7),'bo', 6*10^(5),0.2*10^(7),'ro',6*10^(5),0.3*10^(7),'go', 6*10^(5),0.4*10^(7),'mo')
plot(13*10^(5),0.1*10^(7),'bo', 13*10^(5),0.2*10^(7),'ro',13*10^(5),0.3*10^(7),'go', 13*10^(5),0.4*10^(7),'mo')
plot(19.5*10^(5),0.1*10^(7),'bo', 19.5*10^(5),0.2*10^(7),'ro',19.5*10^(5),0.3*10^(7),'go', 19.5*10^(5),0.4*10^(7),'mo')
ylabel('Raji cell concentration (log(cells/ml))')
xlabel('CAR T count ((log(cells/ml)))')
axis([0 n 0 8*10^(6)])
hold off




























