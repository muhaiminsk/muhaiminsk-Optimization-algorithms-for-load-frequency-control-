
clear all
close all
clc

format long

global w1
global w2
% global w3

tic;
fun = @objective2;

w1=0.001;
w2=0.001;
% w3=0.001;

% ww1=[0.03611 0.15993 0.20461 0.22692 0.22878];
% ww2=[0.13899 0.2414 0.0289 0.07323 0.23959];
% vec1=zeros(50,1);
% vec2=zeros(50,1);
% vec3=zeros(50,1);
% vec4=zeros(50,1);
% vec5=zeros(50,1);
% vec6=zeros(50,1);
% vec7=zeros(50,1);
% vec8=zeros(50,1);
% vec9=zeros(50,1);
% vec10=zeros(50,1);
% vec11=zeros(50,1);
% 
% run=00;
% w1=0.1;
%  w2=0.1
tic;
% w1=ww1(1,5);
% w2=ww2(1,5);
% run=run+1;
SearchAgents_no=10; % Number of search agents

% Function_name='F23';
   
Max_iteration=25; % Maximum number of iterations
lower=0;
upper=2;
% lb=[-16 -45 -8 -16 -45 -8];
% ub=[-6 -15 -3 -6 -15 -3];
lb=[lower lower lower lower lower lower];
ub=[upper upper 4 upper upper 4];
dim = 6;
fobj = @objective2;

[Best_score,Best_pos,Convergence_curve]=MPA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

optim_param=Best_pos;

% sim('twoareaIPSnonlinear')
% finale=itae(end);
% disp(finale)

toc;
t=toc;
% function topology
% figure('Position',[500 400 700 290])
% subplot(1,2,1);
% func_plot(Function_name);
% title('Function Topology')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([Function_name,'( x_1 , x_2 )'])

% Convergence curve
% subplot(1,2,2);
% semilogy(Convergence_curve,'Color','r')
% title('Objective space')
% xlabel('Iteration');
% ylabel('Best score obtained so far');


display(['The best solution obtained by MPA is : ', num2str(Best_pos,10)]);
display(['The best optimal value of the objective function found by MPA is : ', num2str(Best_score,10)]);
% disp(sprintf('--------------------------------------'));
% vec1(run,1)=run;
% vec2(run,1)=Best_pos(1,1);
% vec3(run,1)=Best_pos(1,2);
% vec4(run,1)=Best_pos(1,3);
% vec5(run,1)=Best_pos(1,4);
% vec6(run,1)=Best_pos(1,5);
% vec7(run,1)=Best_pos(1,6);
% vec8(run,1)=Best_score;
% vec9(run,1)=t;
% vec10(run,1)=w1;
% vec11(run,1)=w2;

