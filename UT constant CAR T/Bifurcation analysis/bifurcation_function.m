function [C2, C1,C0,Delta]=bifurcation_function(replic_para,killing_para,E_con)

rho =replic_para(1);
beta = replic_para(2);

kappa=killing_para(1);
eta=killing_para(2);
gamma=killing_para(3);

effector_con=E_con;

C2=rho*eta;
C1=-beta*rho*eta + rho*(effector_con*gamma + 1);
C0=-beta*rho*(effector_con*gamma + 1) + kappa*effector_con*beta;

Delta=C1.^(2)-4*C2*C0;
% % % 
% % % if Delta>0
% % % s_2=(-C1+sqrt(Delta))/(2*C2);
% % % s_1=(-C1-sqrt(Delta))/(2*C2);
% % % elseif Delta<0
% % %     s_2=0;
% % %     s_1=0;
% % % end


end 


















