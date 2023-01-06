test1 = ITAE;
test2 = ExeTime;

x1 = (test1-mean(test1))/std(test1);
x2 = (test2-mean(test2))/std(test2);

disp('For ITAE: ')
[h1,p1] = kstest(x1)
disp('For Exe. Time: ')
[h2,p2] = kstest(x2)

cdfplot(x1)
hold on
x_values = linspace(min(x1),max(x1));
plot(x_values,normcdf(x_values,0,1),'r-')
legend('Empirical CDF','Standard Normal CDF','Location','best')

figure(2)
cdfplot(x2)
hold on
x_values = linspace(min(x2),max(x2));
plot(x_values,normcdf(x_values,0,1),'r-')
legend('Empirical CDF','Standard Normal CDF','Location','best')