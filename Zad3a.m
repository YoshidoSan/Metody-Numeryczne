E2=1e-14;
n=30;
[A,B] = zad2a_generacja(n);
X = Jacobi_solver(A,B,E2);
E1=norm(A*X-B);

function [A,B] = zad2a_generacja(n)
for i=1:n
    for j=1:n
        if i==j
        A(i,j)=12;
        elseif i==j-1 | i==j+1
        A(i,j) = 3.8;
        else
        A(i,j)=0;
        end
    end
end
for i=1:n
B(i,1)=4.5-0.5*i;
end
end
