dx1 = @(x1,x2) x2 + x1*(0.9-(x1)^2-(x2)^2);
dx2 = @(x1,x2) -x1 + x2*(0.9-(x1)^2-(x2)^2);
epsw=0.1;
epsb=0.01;
hmax=0.001;
hmin=0.0001;
s=0.9;


h=0.09;
x1=-0.03;
x2=0.02;
%x1=0;
%x2=7;
%x1=7;
%x2=0;
%x1=0.001;
%x2=0.001;

%Rungego–Kutty:
%y=rk4(dx1,dx2,x1,x2,h);


%Predyktor–korektor Adamsa:
y=pca4(dx1,dx2,x1,x2,h);

%Rungego–Kutty ze zmiennym krokiem:
%y=rk4z(dx1, dx2, x1, x2, h, epsw, epsb, hmax, hmin, s);
tic
%ode45
[t, Y] = ode45('ode', [0:0.001:20], [x1 x2]);


%wykresy
hold on
plot(Y(:,1),Y(:,2),'c',y(1,:),y(2,:), 'r')
%plot(y(1,:),y(2,:), 'r')
hold off
toc