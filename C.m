function [value] = C(x)
% flow set

x1 = x(1);
x2 = x(2);
uc = x(3);  % input to the flow map
ud = x(4);  % input to the jump map

if x1 >= 0 && uc==0     % flow condition
    value = 1;          % report flow
else
    value = 0;          % do not report flow
end

end