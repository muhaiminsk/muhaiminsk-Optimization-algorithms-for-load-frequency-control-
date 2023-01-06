function [ LB,UB,Dim ] = Parameter()

Dim=5;
UB=zeros(1,Dim);
UB(1) = 1;
UB(2) = 1e-6;
UB(3) = 0.5;
UB(4) = 100;
UB(5) = 2;

LB=zeros(1,Dim);
LB(5) = 1;

end

