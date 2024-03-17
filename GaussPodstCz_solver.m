%imx - indeks liczby największej
%lmx - liczba największa
% dA/dB - wiersze które będą zamieniane

function [X] = GaussPodstCz_solver(A,B)
n=length(B);    %ilość równań 
X=zeros(n,1);   %utworzenie macierzy z rozwiązaniami
for j=1:n
    imx=j;
    lmx=abs(A(j,j));  %wybranie początkowej największej wartości w kolumnie
    for i=j+1:n
        if abs(A(i,j)) > lmx    %sprawdzamy czy jest największa w kolumnie, jeśli nie podmieniamy indeks
            lmx=abs(A(i,j));  
            imx=i;
        end
        if imx ~= j   %zamieniamy wiersze tak aby z największą wartością (indeksem) znajdował się na przekątnej           
            dA=A(j,:);
            dB=B(j,:);
            A(j,:)=A(imx,:);
            B(j,:)=B(imx,:);
            A(imx,:)=dA;
           B(imx,:)=dB;
        end
    end
    for i2=j+1:n    %zerujemy wartości pod przekątną (odejmowanie wierszy)
        l = A(i2,j)/A(j,j);
        A(i2,:)=A(i2,:)-l*A(j,:);
        B(i2,:)=B(i2,:)-l*B(j,:);
    end
end
X(n,1)=B(n,1)/A(n,n);   %wyliczamy ostatni x
for m=n-1:-1:1  %rozwiązujemy układ z macierzą trójkątną (postępowanie odwrotne)
    X(m,1)=B(m,1);
    for q=1:n-m
        X(m,1)=X(m,1)-A(m,(n+1-q))*X((n+1-q),1);
    end
    X(m,1) = X(m,1)/A(m,(n-q));
end
end