function inside = D(x)
% jump set

x1 = x(1);
x2 = x(2);
uc = x(3);  % input to the flow map
ud = x(4);  % input to the jump map

% The parameter 0.1 in the condition x2 <= 0.1 is a tolerance parameter
% to prevent premature termination of the simulation
if (x1 <= 0 && x2 <= 0.1)   % jump condition
    inside = 1;             % report jump
else
    inside = 0;             % do not report jump
end
end