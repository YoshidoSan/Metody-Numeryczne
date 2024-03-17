f=@(x) (2*sin(x)) - exp(x) + (5*x)-1;
%fplot(f,[-6 6]);
%grid on

dokl=10^-6;

[startuj1,koncz1]=comp(f,-5,5);
[zerowe1,iteracje1]=falsi_solver(f,startuj1,koncz1,dokl);

fn=@(x)f(x)./(x-zerowe1);
[startuj2,koncz2]=comp(fn,koncz1,5);
[zerowe2,iteracje2]=falsi_solver(f,startuj2,koncz2,dokl);

disp(f(zerowe1));
disp(f(zerowe2));