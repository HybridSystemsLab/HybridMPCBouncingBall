% Bouncing ball example with disturbance, NMPC 2018

clear all
close all
clc

%% initial conditions
x11_0 = [3 2 1];
x21_0 = [1 2 0]; 
uc1_0 = zeros(1,3);
ud1_0 = zeros(1,3);
color = ['k' 'r' 'b'];

global noise i

% vector of disturbances
noise = [0.05 0.03 0.01];

for i = 1:3
    x1_0 = x11_0(i);
    x2_0 = x21_0(i);
    uc_0 = 0;
    ud_0 = 0;
    
    x0 = [x1_0; x2_0; uc_0; ud_0];
    
    % simulation horizon
    TSPAN = [0 10];
    JSPAN = [0 10];
    
    % rule for jumps
    % rule = 1 -> priority for jumps
    % rule = 2 -> priority for flows
    rule = 1;
    options = odeset('RelTol',1e-6,'MaxStep',.01);
   
    % constants
    global gamma lambda h;
    gamma  = 9.8; %# gravity constant
    lambda = 0.8; % restitution coefficient
    h=2;

    %% simulate
    [t,j,x] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

    %% plot modification 

    modificatorF{1} = color(i);
    modificatorJ{1} = color(i);
    modificatorJ{1} = '*';
    modificatorJ{8} = 'MarkerFaceColor';
    modificatorJ{9} = color(i)
    modificatorJ{6} = 'MarkerEdgeColor';
    modificatorJ{7} = color(i)
    modificatorF{2} = 'Linewidth';
    modificatorF{3} = 2;
    modificatorF{4} = 'DisplayName';
    modificatorF{5} = num2str(i)

    plotHarc(t,j,x(:,1),[],modificatorF,modificatorJ);
    grid on;
    ylabel('x1')
    hold on 

    xlabel('$t$','Interpreter','latex','FontName','Times','FontSize',8)
    ylabel('$x_1$','Interpreter','latex','FontName','Times','FontSize',8)
    set(gca,'FontName','Times','FontSize',8)

end
