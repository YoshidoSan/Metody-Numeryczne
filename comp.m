function [a,b]=comp(f,start,max)
x1=start;
x2=start+0.05;
for j=1:1000
    if f(x1)*f(x2)<0
        a=x1;
        b=x2;
    elseif (abs(f(x1))<abs(f(x2)))
        x1=x1+1.001*(x1-x2);
    elseif x2+1.001*(x2-x1)<max
        x2=x2+1.001*(x2-x1);
    end
end

        