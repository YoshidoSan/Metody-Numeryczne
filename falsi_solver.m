function [X0,n] = falsi_solver(f,a,b,dokl)
n=0;
X0=[];
x0=0;
for i=1:1000
    n=n+1;
    c=((a*f(b)-b*f(a))/(f(b)-f(a)));
    if abs(f(c))<dokl
        if (a<c) && (c<b)
            old=x0;
            x0=c;
            if abs(x0-old)>dokl
                X0(end+1)=x0;
            end
            if abs(x0-old)<dokl
                break
            end
         end
     elseif f(a)*f(c)>0
        a=c;
     elseif f(b)*f(c)>0
        b=c;
    end
end
end


    


