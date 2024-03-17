function [X] = Jacobi_solver(A,B,E2)
n=length(B);
L=zeros(n);
D=zeros(n);
U=zeros(n);
error=E2+1; %na wejściu ustawione byleby był większy od E2, do którego będziemy dążyć
X=zeros(n,1);
for i=1:n % tworzymy macierze L,D,U
    for j=1:n
        if i == j
            D(i,j)=A(i,j);
        end
        if j > i
            U(i,j)=A(i,j);
        end
        if i > j
            L(i,j)=A(i,j);
        end
    end
end
while E2<=error
    pX=X;
    X=-D^(-1)*(L+U)*X+D^(-1)*B; %obliczamy X
    error=norm(X-pX);
end
end

            
            
        



        



            