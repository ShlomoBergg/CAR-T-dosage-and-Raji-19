function dy=model_1(t,y,replic_para,lysing_para)
        
rho =replic_para(1);
beta = replic_para(2);
% delta = replic_para(3);
kappa=lysing_para(1);
gamma=lysing_para(2);
eta=lysing_para(3);
% % b=lysing_para(4);
% % c=lysing_para(5);
%%%%
  
        dy=zeros(2,1);
        dy(1)=rho*y(1)*(1-y(1)/beta)-kappa*y(1)*y(2)/(1+eta*y(2)+gamma*y(1)); %/(1+a*y(2)+b*y(1)+c*Eff)susceptible cell
%         dy(2)=0.3*10^(-10)*y(1)*y(2)-0.02*y(2);%Macrophage
        dy(2)=0.3*10^(-10)*y(1)*y(2)-0.02*y(2);%Macrophage
        
    end