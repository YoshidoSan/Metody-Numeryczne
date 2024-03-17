function [y] = pca4(dx1,dx2,x1,x2,h)
tic;
t=21/h; %liczba kroków
y(:,1) = [x1 x2]; %początkowe dane do wykresu
for i=1:3
    k11=dx1(x1,x2);
    k12=dx2(x1,x2);
    k21=dx1(x1+0.5*h,x2+0.5*h*k11);
    k22=dx2(x1+0.5*h,x2+0.5*h*k12);
    k31=dx1(x1+0.5*h,x2+0.5*h*k21);
    k32=dx2(x1+0.5*h,x2+0.5*h*k22);
    k41=dx1(x1+h,x2+h*k31);
    k42=dx2(x1+h,x2+h*k31);
    x1=x1+(h/6)*(k11+2*k21+2*k31+k41);
    x2=x2+(h/6)*(k12+2*k22+2*k32+k42);
    y(:,i+1)=[x1 x2]; %zwiększenie bazy danych do wykresu
end
for i = 4:t
    %etap predykcji
    tmp1 = x1 + (h/24)*55*dx1(x1,x2) - 59*(h/24)*dx1(y(1,i-1),y(2,i-1)) + 37*(h/24)*dx1(y(1,i-2),y(2,i-2)) - 9*(h/24)*dx1(y(1,i-3),y(2,i-3));
    tmp2 = x2 + (h/24)*55*dx2(x1,x2) - 59*(h/24)*dx2(y(1,i-1),y(2,i-1)) + 37*(h/24)*dx2(y(1,i-2),y(2,i-2)) - 9*(h/24)*dx2(y(1,i-3),y(2,i-3));
    %etap korekcji
    x1 = x1 + (h/720)*646*dx1(x1,x2) - 264*(h/720)*dx1(y(1,i-1),y(2,i-1)) + 106*(h/720)*dx1(y(1,i-2),y(2,i-2)) - 19*(h/720)*dx1(y(1,i-3),y(2,i-3)) + h*(251/720)*dx1(tmp1, tmp2);
    x2 = x2 + (h/720)*646*dx2(x1,x2) - 264*(h/720)*dx2(y(1,i-1),y(2,i-1)) + 106*(h/720)*dx2(y(1,i-2),y(2,i-2)) - 19*(h/720)*dx2(y(1,i-3),y(2,i-3)) + h*(251/720)*dx2(tmp1, tmp2);
    y(:,i)=[x1 x2]; %wstawienie do bazy danych do wykresu
end
toc;
end