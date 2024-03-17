function xprim =ode(~,x)

xprim = zeros(2,1); 
xprim(1) = x(2) + x(1)*(0.9 - x(1)^2 - x(2)^2);
xprim(2) = -x(1) + x(2)*(0.9 - x(1)^2 - x(2)^2); 

end
