f=@(x) -2*(x^4) +3*(x^3)+6*(x^2)+2*(x)+3;
dokl=10^-6;
n=70;
x0=-10;
x1=10;
x2=30;

[zerowe1,iteracje1,wartosc1]=mullermm1_solver(f,dokl,x0,x1,x2,n);
%stosuję deflacje czynnikiem liniowym
f2=@(x)f(x)./(x-zerowe1);
[zerowe2,iteracje2,wartosc2]=mullermm1_solver(f2,dokl,x0,x1,x2,n);
%stosuję deflacje czynnikiem liniowym
f3=@(x)f2(x)./(x-zerowe2);
[zerowe3,iteracje3,wartosc3]=mullermm1_solver(f3,dokl,x0,x1,x2,n);
%stosuję deflacje czynnikiem liniowym
f4=@(x)f3(x)./(x-zerowe3);
[zerowe4,iteracje4,wartosc4]=mullermm1_solver(f4,dokl,x0,x1,x2,n);


%f2=@(x) f(x)/(x+0.0427-0.6711i);
%f3=@(x) f2(x)/(x+1.1936);
%fplot(f,[-10 10]);


disp(f(zerowe4))
disp(f(



%f=@(x) a(5)*(x^4) +a(4)*(x^3)+a(3)*(x^2)+a(2)*(x)+a(1);
%a=[3 2 6 3 -2]
%hold on
%x = linspace(-4,10);
%plot(x,f3(x),'k');
%xlim([10 20]);
%ylim([-10 5]);
%grid on

%fplot(f,[-6 6]);
%grid on
