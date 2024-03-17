function [y] = rk4z(dx1, dx2, x1, x2, h, epsw, epsb, hmax, hmin, s)
tic;
t=21/h;
y(:,1) = [x1 x2];
yd(:,1) = [x1 x2];
for i=1:t
    %pełny krok
    k11=dx1(x1,x2);
    k12=dx2(x1,x2);   
    k21=dx1(x1+0.5*h,x2+0.5*h*k11);
    k22=dx2(x1+0.5*h,x2+0.5*h*k12);  
    k31=dx1(x1+0.5*h,x2+0.5*h*k21);
    k32=dx2(x1+0.5*h,x2+0.5*h*k22);  
    k41=dx1(x1+h,x2+h*k31);
    k42=dx2(x1+h,x2+h*k31);
    xfull1=x1+(1/6)*h*(k11+2*k21+2*k31+k41);
    xfull2=x2+(1/6)*h*(k12+2*k22+2*k32+k42);
    y(:,i+1) = [xfull1 xfull2];  
    %pierwszy półkrok
    h2 = h/2;
    khf21=dx1(x1+0.5*h2,x2+0.5*h2*k11);
    khf22=dx2(x1+0.5*h2,x2+0.5*h2*k12);  
    khf31=dx1(x1+0.5*h2,x2+0.5*h2*khf21);
    khf32=dx2(x1+0.5*h2,x2+0.5*h2*khf22);  
    khf41=dx1(x1+h2,x2+h2*khf31);
    khf42=dx2(x1+h2,x2+h2*khf31);
    xhalf1=x1+(1/6)*h2*(k11+2*khf21+2*khf31+khf41);
    xhalf2=x2+(1/6)*h2*(k12+2*khf22+2*khf32+khf42);
    %drugi półkrok
    khs11 = dx1(xhalf1, xhalf2);
    khs12 = dx2(xhalf1, xhalf2);
    khs21=dx1(x1+h2,x2+h2*k11);
    khs22=dx2(x1+h2,x2+h2*k12);  
    khs31=dx1(x1+h2,x2+h2*khs21);
    khs32=dx2(x1+h2,x2+h2*khs22);  
    khs41=dx1(x1+h2,x2+h2*khs31);
    khs42=dx2(x1+h2,x2+h2*khs31);
    xhalfsec1=xhalf1+(1/3)*h2*(khs11+2*khs21+2*khs31+khs41);
    xhalfsec2=xhalf2+(1/3)*h2*(khs12+2*khs22+2*khs32+khs42);
    yd(:,i+1) = [xhalfsec1 xhalfsec2];
   
    d1 = (1/15)*(abs(xhalfsec1-x1));
    d2 = (1/15)*(abs(xhalfsec2-x2));
    e1 = abs(xhalfsec1)*epsw + epsb;
    e2 = abs(xhalfsec2)*epsw + epsb;
    alfa = min((e1/d1)^(1/5), ((e2/d2)^(1/5)));
    h=h*alfa*s;
    if h<hmin
        h=hmin;
    end
    if h>hmax
        h=hmax;
    end
    x1 = xfull1;
    x2 = xfull2;
end
toc
end