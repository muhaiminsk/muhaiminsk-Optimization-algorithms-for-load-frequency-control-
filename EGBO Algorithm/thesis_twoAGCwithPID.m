clear all
close all
clc

Tps1=20;
Tps2=20;
Kps1=100;
Kps2=100;
Tt1=0.5;
Tt2=0.5;
Tsg1=0.4;
Tsg2=0.4;
R1=3;
R2=3;
a12=1;
T12=0.05/(2*pi);
B1 = 0.425;
B2 = 0.425;
				
            					
Kp1=0;
Ki1=0;
Kd1=0;
Kp2=0;
Ki2=0;
Kd2=0;

e1=(2*pi*T12*Kp1)+(Ki1*B1)-((Kp1*B1)/Tps1);
e2=((Kp1*B1*Kps1)/Tps1)-((Kd1*B1*Kps1)/(Tps1*Tt1))-((Kd1*B1*Kps1)/(Tps1^2))+((Kd1*Kps1*2*pi*T12)/Tps1);
e3=((Kd1*B1*Kps1)/(Tps1*Tt1));
e4=(-Kp1*2*pi*T12)+((Kd1*B1*Kps1*2*pi*T12)/(Tps1))+((Kd1*2*pi*T12)/Tps2);
e5=(-(Kd1*Kps2*2*pi*T12)/Tps2);
e6=0;
e7=(Ki1)-((Kp1*B1*Kps1)/Tps1)+((Kd1*B1*Kps1)/(Tps1^2))-((Kd1*Kps1*2*pi*T12)/Tps1)-((Kd1*Kps2*2*pi*T12*a12)/Tps2);
e8=-((Kp1*B1*Kps1)/Tps1)-((Kd1*2*pi*T12*Kps1)/Tps1)+((Kd1*B1*Kps1)/(Tps1^2));
e9=(Kd1*2*pi*T12*Kps2)/Tps2;

f1=(-Kp2*2*pi*T12*a12)+((Kd2*B2*Kps2*2*pi*T12*a12)/(Tps2))+((Kd2*a12*2*pi*T12)/Tps1);
f2=(-(Kd2*Kps1*2*pi*T12*a12)/Tps1);
f3=0;
f4=(-(Kp2*B2)/Tps2)+(Kp2*2*pi*T12*a12)+(Ki2*B2)-((Kd2*B2*Kps2*2*pi*T12*a12)/(Tps2))+((Kd2*B2)/(Tps2^2))-((Kd2*2*pi*T12*a12)/Tps2);
f5=((Kp2*B2*Kps2)/Tps2)-((Kd2*B2*Kps2)/(Tps2*Tt2))-((Kd2*B2*Kps2)/(Tps2^2))+((Kd2*Kps2*2*pi*T12*a12)/Tps2);
f6=((Kd2*B2*Kps2)/(Tps2*Tt2));
f7=((Kp2*B2*Kps2*a12)/Tps2)-((Kd2*B2*Kps2*a12)/(Tps2^2))+((Kd2*Kps1*2*pi*T12*a12)/Tps1)-(Ki2*a12)+((Kd2*Kps2*2*pi*T12*a12*a12)/Tps2);
f8=(Kd2*2*pi*T12*Kps1*a12)/Tps1;
f9=-((Kp2*B2*Kps2)/Tps2)-((Kd2*2*pi*T12*Kps2*a12)/Tps2)+((Kd2*B2*Kps2)/(Tps2^2));

A = [(-1/(Tps1)) (Kps1/Tps1) 0 0 0 0 (-Kps1/(Tps1)) 0 0;
    0 (-1/Tt1) (1/Tt1) 0 0 0 0 0 0;
    (-1/(R1*Tsg1)) 0 (-1/(Tsg1)) 0 0 0 0 (1/(Tsg1)) 0;
    0 0 0 (-1/(Tps2)) (Kps2/(Tps2)) 0 ((Kps2*a12)/Tps2) 0 0;
    0 0 0 0 (-1/Tt2) (1/Tt2) 0 0 0;
    0 0 0 (-1/(R2*Tsg2)) 0 (-1/Tsg2) 0 0 (1/Tsg2);
    (2*pi*T12) 0 0 -(2*pi*T12) 0 0 0 0 0;
    e1 e2 e3 e4 e5 e6 e7 0 0;
    f1 f2 f3 f4 f5 f6 f7 0 0];

ei= eig(A)
% B1=[(-(Kps1)/(Tps1));0;0;0;0;0;0;e8;f8]; % disturbance 1
% B2=[0;0;0;(-(Kps2)/(Tps2));0;0;0;e9;f9]; % distrubance 2
% B3=[(-(Kps1)/(Tps1));0;0;(-(Kps2)/(Tps2));0;0;0;e8+e9;f8+f9]; % both disturbance
% C1=[1 0 0 0 0 0 0 0 0];
% C2=[0 0 0 1 0 0 0 0 0];
% C3=[0 0 0 0 0 0 1 0 0];
% D=0;
% 
% [num1,den1]=ss2tf(A,B2,C1,D);
% sys1=tf(num1,den1)
% step(sys1)
% 
% hold on
% [num2,den2]=ss2tf(A,B2,C2,D);
% sys2=tf(num2,den2)
% step(sys2)
% 
% hold on
% [num3,den3]=ss2tf(A,B2,C3,D);
% sys3=tf(num3,den3)
% step(sys3)