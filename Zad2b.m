% ilość rónań - z
%ilość punktów - h
%kolumna pierwsza - k1
%kolumna druga - k2


z=[5,10,50,100,200];         %kolejno liczba równań które będziemy rozwiązywać
h = length(z);
k1=zeros(1,h);
k2=zeros(1,h);
for n=z(1:end)                       
    [A,B] = zad2b_generacja(n);     %tworzenie macierzy A i B
    X = GaussPodstCz_solver(A,B);          %obliczenie X
    E=norm(A*X-B);                  %obliczenie normy
    k1(1,h)=n;    %kolumny zawierają ilość równań
    k2(1,h)=E;    % a także błędy
    h = h-1;
end
plot(k1,k2);           % wykres pokazuje zależność ilości równań od błędu 
xlabel('Ilośc równań liniowych');
ylabel('Błąd');
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
