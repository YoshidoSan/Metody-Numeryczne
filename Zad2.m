n=5;                      
[A,B] = zad2_generacja(n);     %tworzenie macierzy A i B
X = GaussPodstCz_solver(A,B);    %obliczenie X
E=norm(A*X-B);                  %obliczenie normy

function [A,B] = zad2_generacja(n)
G = 10*rand(n);
B = 30*rand(n,1);
A = G*(G');
end