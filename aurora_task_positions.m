%assigning transformation matrix for task with positions and  obstacle
%avoidance positions
%positions are progressive for smooth task implementation
task1_post1 = aurora_fwd(0*pi,0*pi,0.5*pi,-0.5*pi,0*pi);
task1_post2 = aurora_fwd(0.5*pi,0.77*pi,0.6*pi,0.13*pi,-0.5*pi);
task1_post3 = aurora_fwd(0.25*pi,0.3*pi,0.6*pi,-0.2*pi,0*pi);

%Obstacles position
task1_obstacle1 = aurora_fwd(0.5*pi,0.3*pi,0.6*pi,-0.2*pi,0*pi);
task1_obstacle2 = aurora_fwd(0.4*pi,0.3*pi,0.3*pi,-0.2*pi,0*pi);

task1_post4 = aurora_fwd(-0.25*pi,0.7*pi,0.28*pi,-0.21*pi,-0.5*pi);
task1_post5 = aurora_fwd(0.3*pi,0*pi,0.3*pi,0*pi,0*pi);
