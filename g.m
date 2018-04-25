function [xplus] = g(x)
% jump map
global lambda h gamma noise i;
 
% state
x1 = x(1);
x2 = x(2);
uc = x(3);                      % input to the flow map
ud = lambda*x2+sqrt(2*gamma*h); % input to the jump map

xplus = [0;-(lambda+noise(i))*x2+ud; 0; ud];

end