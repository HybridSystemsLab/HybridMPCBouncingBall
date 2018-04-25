function [xdot] = f(x)
% flow map

global gamma;
 
% state
x1 = x(1);
x2 = x(2);
uc = x(3);  % input to the flow map
ud = x(4);  % input to the jump map

xdot = [x2 ; -gamma; 0 ;0];

end