% clear all
% close all
% clc

dev=sample';
pid=network1_predictions';

for run=1:5

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

                         
% Kp1=-9.2616;
% Ki1=-19.2426;
% Kd1=-3.7380;
% Kp2=-9.1923;
% Ki2=-20.0000;
% Kd2=-3.6833;
                         

Kp1=pid(run,1);
Ki1=pid(run,2);
Kd1=pid(run,3);
Kp2=pid(run,4);
Ki2=pid(run,5);
Kd2=pid(run,6);

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

w1=dev(run,1);
w2=dev(run,2);

LFC = @(t,x) [((Kps1/Tps1)*(x(2)-x(7)-w1))-((1/Tps1)*x(1));
    ((1/Tt1)*(x(3)-x(2)));
    ((1/Tsg1)*(x(8)-(x(1)/R1)-x(3)));
    (((Kps2/Tps2)*(x(5)+(a12*x(7))-w2))-((1/Tps2)*x(4)));
    ((1/Tt2)*(x(6)-x(5)));
    ((1/Tsg2)*(x(9)-(x(4)/R2)-x(6)));
    ((2*pi*T12)*(x(1)-x(4)));
    ((e1*x(1))+(e2*x(2))+(e3*x(3))+(e4*x(4))+(e5*x(5))+(e6*x(6))+(e7*x(7))+(e8*w1)+(e9*w2));
    ((f1*x(1))+(f2*x(2))+(f3*x(3))+(f4*x(4))+(f5*x(5))+(f6*x(6))+(f7*x(7))+(f8*w1)+(f9*w2))];

tf=50;
x0=[0 0 0 0 0 0 0 0 0];
[t,y]=ode45(LFC,[0 tf],x0);




% for i=1:3:7
% 
%     figure(i);
%     plot(t,y(:,i))
%     S(i)=stepinfo(y(:,i),t)
% end

in_itae=((abs(y(:,1)))+(abs(y(:,4)))+(abs(y(:,7))));
itae=trapz(t, times(t,in_itae));
fitness(run,1)=itae;

end
