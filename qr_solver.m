function [a,euk,czeb] = qr_solver(x, y , n)
A = zeros(length(x),n+1);
for j=1:n+1
    for i=1:length(x)
        A(i,j)=x(i)^(j-1);
    end
end
[Q,R] = qr(A);
Qt= Q';
a= linsolve(R , Qt * y');
disp('Współczynniki wielomianu wynoszą=')
disp(a);
euk= norm(A*a-y');
disp('Norma euklidesowa wynosi=');
disp(euk);
czeb= max(abs(A*a-y'));
disp('Norma czebyszewa wynosi=');
disp(czeb);
end
