clear all
close all
clc

global w1
global w2

% rng(0,'twister');
% a = 0.025;
% b = 0.25;
% r1 = (b-a).*rand(5,1) + a;
% r2 = (b-a).*rand(5,1) + a;

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

% ww1=[0.03611 0.15993 0.20461 0.22692 0.22878];
% ww2=[0.13899 0.2414 0.0289 0.07323 0.23959];

% run=00;
% w1=0.250;
%     for w2=0.005:0.005:0.25
% while run<5
% for loop=1:5
tic;

w1=0.001;
w2=0.001;
% run=run+1;

% w1=r1(run,1);
% w2=r2(run,1);
nP=10;          % Number of Population

MaxIt=25;      % Maximum number of iterations

fobj = @(x) objective2(x);
lb=[0 0 0 0 0 0];
ub=[2 2 4 2 2 4];
dim = 6;
[Best_fitness,BestPositions] = EGBO(nP,MaxIt,lb,ub,dim,fobj);


optim_param=BestPositions;
display(['The best solution obtained by MPA is : ', num2str(BestPositions,10)]);
display(['The best optimal value of the objective function found by MPA is : ', num2str(Best_fitness,10)]);

% semilogy(Convergence_curve,'Color','b','LineWidth',3);
% title('Convergence curve')
% xlabel('Iteration');
% ylabel('Best fitness obtained so far');
% axis tight
% grid off
% box on
% legend('GBO')


toc;
t=toc;

% vec1(run,1)=run;
% vec2(run,1)=BestPositions(1,1);
% vec3(run,1)=BestPositions(1,2);
% vec4(run,1)=BestPositions(1,3);
% vec5(run,1)=BestPositions(1,4);
% vec6(run,1)=BestPositions(1,5);
% vec7(run,1)=BestPositions(1,6);
% vec8(run,1)=Best_fitness;
% vec9(run,1)=t;
% vec10(run,1)=w1;
% vec11(run,1)=w2;
% end
% end
% end
% result = [run Best_fitness t BestPositions];
