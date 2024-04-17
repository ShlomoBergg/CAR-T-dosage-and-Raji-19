%define the sum-of-squares error (SSE) 
function error_in_data1 = moder2(lysing_para_true,replic_para_true,tumor_cell24,target_cell,effector_cell)

replic_para=replic_para_true;
lysing_para=lysing_para_true;

ini_1=[target_cell,effector_cell(1)];
ini_2=[target_cell,effector_cell(2)];
ini_3=[target_cell,effector_cell(3)];
ini_4=[target_cell,effector_cell(4)];

        [~, tumor_esti_1] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_1);
        [~, tumor_esti_2] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_2);
        [~, tumor_esti_3] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_3);
        [~, tumor_esti_4] = ode45(@(t,y)(model_1(t,y,replic_para,lysing_para)),[0 3],ini_4);


        estimated_result24=[tumor_esti_1(end,1), tumor_esti_2(end,1),tumor_esti_3(end,1),tumor_esti_4(end,1)];

        error_in_data1 = sum((log10(estimated_result24) - log10(tumor_cell24)).^2)


    end