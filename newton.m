f=@(x) (2*sin(x)) - exp(x) + (5*x)-1;
df=@(x) (2*cos(x))- exp(x) +5;
fplot(f,[-6 6]);
grid on

dokl=10^-6;
[startuj1,koncz1]=comp(f,-5,5);
[zerowe1,iteracje1]=newton_solver(f,df,startuj1,koncz1,dokl);


fn=@(x)f(x)./(x-zerowe1);
[startuj2,koncz2]=comp(fn,koncz1,5);
[zerowe2,iteracje2]=newton_solver(f,df,startuj2+0.8,koncz2,dokl);

disp(f(zerowe1));
disp(f(zerowe2));