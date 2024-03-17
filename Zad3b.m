E2=1e-14;
n=5;
[A,B] = zad2b_generacja(n);
X = Jacobi_solver(A,B,E2);
E1=norm(A*X-B);

function [A,B] = zad2b_generacja(n)
for i=1:n
    for j=1:n
        if i==j
        A(i,j)=1/3;
        else
        A(i,j)=3*(i-j)+3;
        end
    end
end
for i=1:n
B(i,1)=0.5-0.6*i;
end
end