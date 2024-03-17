function [X3,n,F3] = mullermm1_solver(f,dokl,x0,x1,x2,n)

f0 = f(x0);
f1 = f(x1);
f2 = f(x2);
iteracje=0;
for i=1:n
    if i>n
        break
    end
    z01=x0-x1;
    z02=x0-x2;
    z12=x1-x2;
    y02=f0-f2;
    y12=f1-f2;
    %wspolczynniki paraboli
    a= (y02/z02 - y12/z12)/z01;
    b= y12/z12 - a*(x1 + x2);
    c= f2 - x2 * (a * x2 + b);
    d= b * b - 4 * a * c;
    d=sqrt(d);
    %pierwiastki
    zplus=(-2*c)/(b+d);
    zminus=(-2*c)/(b-d);
    
    if(abs(zplus-x2)<abs(zminus-x2))
        X3=zplus;
    else
        X3=zminus;
    end
    F3=f(X3);
    if(abs(F3)<dokl)||(abs(X3-x2)<dokl)
        break
    end
    x0=x1;
    x1=x2;
    x2=X3;
    f0=f1;
    f1=f2;
    f2=F3;
    iteracje=iteracje+1;
end
