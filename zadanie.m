X=[-5 -4 -3 -2 -1 0 1 2 3 4 5];
Y=[-20.5411 -9.3720 -3.7894 -0.6924 0.2672 0.0239 1.6401 1.2870 3.1747 1.3525 -3.8802];
n=12;

disp('Układ równań normalnych');
[a1,e1,cz1]=normal_solver(X,Y,n);
disp('Układ rónań liniowych z rozkładem QR');
[a2,e2,cz2]=qr_solver(X,Y,n);

hold on
x = linspace(-6,6,120);
plot(x, polyval(flip(a1'), x), 'r');
plot(x, polyval(flip(a2'), x), 'b');
scatter(X,Y,'filled');
xlim([-7 7]);
ylim([-25 5]);
hold off