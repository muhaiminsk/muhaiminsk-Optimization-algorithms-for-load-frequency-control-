function [ ob_func ] = objective2 ( x )

% global w1
% global w2
% global w3
% 
% global optim_param1
% global optim_param2
% global optim_param3
% global optim_param4
% global optim_param5
% global optim_param6
% global optim_param7
% global optim_param8
% global optim_param9
% 
% optim_param1=x(1);
% optim_param2=x(2);
% optim_param3=x(3);
% optim_param4=x(4);
% optim_param5=x(5);
% optim_param6=x(6);
% optim_param7=x(7);
% optim_param8=x(8);
% optim_param9=x(9);
assignin('base','optim_param',x);
sim('hydrothermal')
ob_func=itae(end);
end
 