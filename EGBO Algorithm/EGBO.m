
function [Best_Cost,Best_X]=EGBO(nP,MaxIt,lb,ub,dim,fobj)
%% Initialization
nV = dim;                        % Number f Variables
lb = ones(1,dim).*lb;            % lower boundary 
ub = ones(1,dim).*ub;            % upper boundary
Cost = zeros(nP,1);
uF = zeros(nP,1);
uCR = zeros(nP,1);
X = initialization(nP,nV,ub,lb); %Initialize the set of random solutions
% Convergence_curve = zeros(1,MaxIt);
% NFE=0;
for i=1:nP
    Cost(i) = fobj(X(i,:));      % Calculate the Value of Objective Function
end
% NFE = NFE + nP;
[~,Ind] = sort(Cost);  
[~,ind]=sort(Cost);
Best_Cost2 = Cost(ind(2));Best_X2 = X(ind(2),:);
Best_Cost3 = Cost(ind(3));Best_X3 = X(ind(3),:);
Best_Cost = Cost(Ind(1));        % Determine the vale of Best Fitness
Best_X = X(Ind(1),:);
Worst_Cost=Cost(Ind(end));       % Determine the vale of Worst Fitness
Worst_X=X(Ind(end),:);
%% Main Loop
it = 0;
LC=0.7;
while it<MaxIt
    it = it+1;

    CR = [];
    ro = [];ro1 = [];
    [~,reindex]=sort(Cost);
    for i=1:nP
        uF(reindex(i))=i/nP;
        uCR(reindex(i))=i/nP;
    end

    for i=1:nP             
        A1 = randperm(nP);
        
        A1(A1==i)=[];
        r1 = (A1(1));r2 = (A1(2));r4 = (A1(3));
        r3 = (A1(4));
        Xr1 = X(r1,:);Xr2 = X(r2,:);
        Xr3 = X(r3,:);Xr4 = X(r4,:);
         
        if Cost(i)<Best_Cost
            Best_Cost=Cost(i);  Best_X=X(i,:);
        elseif Cost(i)>Best_Cost && Cost(i)<Best_Cost2
            Best_Cost2=Cost(i);  Best_X2=X(i,:);
        elseif Cost(i)>Best_Cost && Cost(i)>Best_Cost2 && Cost(i)<Best_Cost3
            Best_Cost3=Cost(i);  Best_X3=X(i,:);
        end
        
         Xm = (Xr1+Xr2+Xr3+Xr4)/4;                   % Average of Four positions randomly selected from population
         eps = 5e-20*rand;                                            % Randomization Epsilon

         if rand<0.5
             ro(i)=uF(r1)+0.1*randn;
             ro1(i)=uF(r2)+0.1*randn;
         else
             ro(i)=uF(i)+0.1*randn;
             ro1(i)=uF(i)+0.1*randn;
         end
         
        DM = 1*rand.*ro(i).*(Best_X-Xr1);Flag = 1;                   
        GSR=GradientSearchRule(ro1(i),Best_X,Worst_X,X(i,:),Xr1,DM,eps,Xm,Flag);      
        DM = 1*rand.*ro(i).*(Best_X-Xr1);
        X1 = X(i,:) - GSR + DM;                                     
        
        DM = 1*rand.*ro(i).*(Xr1-Xr2);Flag = 2;
        GSR=GradientSearchRule(ro1(i),Best_X,Worst_X,X(i,:),Xr1,DM,eps,Xm,Flag); 
        DM = 1*rand.*ro(i).*(Xr1-Xr2);
        X2 = Best_X - GSR + DM;                                                
        
        Xnew=zeros(1,nV);
        jrand=randi([1,dim]);
        CR(i)=(uCR(i)+0.1*randn);
   
        for j=1:nV
            if rand<CR(i) || j==jrand
                if rand<0.5
                    Xnew(j) = X1(j); 
                else
                    Xnew(j)=  X2(j);
                end
            else
                Xnew(j) = X(i,j);
            end
        end

        % Modified local escaping operator(MLEO)                              

        LC = 4*LC*(1-LC);
        if rand<LC                
            k = fix(rand*nP)+1;
            L2=rand<0.5;            
            Xp = (1-L2).*Best_X2+(L2).*X(k,:);                          
             
            if rand<0.5*(1-(it/MaxIt))
                Xnew = Best_X3 + ((ro(i)).*(Best_X-Xp)+(ro1(i)).*(Xr1-Xr2));    
            else
                Xnew = Best_X +((ro(i)).*(Best_X-Xp)+(ro1(i)).*(Xr1-Xr2));  
            end
        end
        
        % Check if solutions go outside the search space and bring them back
        for j=1:dim
            if Xnew(j)<lb(j)
                Xnew(j) = lb(j)+rand()*(ub(j)-lb(j));
            end
            
            if Xnew(j)>ub(j)
                Xnew(j) = lb(j)+rand()*(ub(j)-lb(j));
            end
        end
        Xnew_Cost = fobj(Xnew);
%         NFE = NFE + 1;
        % Update the Best Position        
        if Xnew_Cost<Cost(i)
            X(i,:)=Xnew;
            Cost(i)=Xnew_Cost;
            if Cost(i)<Best_Cost
                Best_X=X(i,:);
                Best_Cost=Cost(i);
            end
        end
       % Update the Worst Position 
        if Cost(i)>Worst_Cost
            Worst_X= X(i,:);
            Worst_Cost= Cost(i);
        end               
    end
    

    
%     Convergence_curve(it) = Best_Cost;
%     % Show Iteration Information
%     disp(['Iteration ' num2str(it) ': Best Fitness = ' num2str(Convergence_curve(it))]);
end
end
% _________________________________________________
% Gradient Search Rule
function GSR=GradientSearchRule(ro1,Best_X,Worst_X,X,Xr1,DM,eps,Xm,Flag)
    nV = size(X,2);
    Delta = rand.*abs(Xm-X);                            
    Step = ((Best_X-Xr1)+Delta)/2;                        
    DelX = rand(1,nV).*(abs(Step));                        
       
    GSR = ro1.*(2*DelX.*X)./(Best_X-Worst_X+eps);   % Gradient search rule  Eq.(15)
    if Flag == 1
      Xs = X - GSR + DM;                                   
    else
      Xs = Best_X - GSR + DM;
    end    
    yp = rand.*(0.5*(Xs+X)+rand.*DelX);                   
    yq = rand.*(0.5*(Xs+X)-rand.*DelX);                    

    GSR = ro1.*(2*DelX.*X)./(yp-yq+eps);                   
end

