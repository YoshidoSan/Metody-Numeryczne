function [X0,n] = newton_solver(f,df,x1,x2,dokl)
n=0;
X0=[];
x0=0;
for i=1:1000    
    while abs(f(x1))>dokl
        n=n+1;
        x1=x1-(f(x1)/df(x1));
    end
    old=x0;
    x0=x1;
    if abs(x0-old)<dokl
        break
    end
    if (x0>=x1 && x0<=x2)
        X0(end+1)=x0;
    end
end
end

