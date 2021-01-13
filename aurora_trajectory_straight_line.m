aurora_task_positions;

x1 = linspace(task1_post1(1,4),task1_post2(1,4),20);
y1 = linspace(task1_post1(2,4),task1_post2(2,4),20);
z1 = linspace(task1_post1(3,4),task1_post2(3,4),20);
T_st_angles = []; %angles needed for straight lines
for i = 1:20
    l_vec = sqrt(x1(i)^2 + z1(i)^2);
    c1 = x1(i)/l_vec;
    s1 = y1(i)/l_vec;
    T_st_angles(:,:,i) = [s1 0 c1 x1(i);-c1 0 s1 y1(i);0 -1 0 z1(i);0 0 0 1];
    ang = aurora_inv(T_st_angles(:,:,i));
    
    axis([-500 500, -500 500, -500 500]);
    hold on
    t01 = DH_dist(ang(1),50,-pi/2,0);
    t12 = DH_dist(ang(2),0,0,160);
    t23 = DH_dist(ang(3),0,0,160);
    t34 = DH_dist(ang(4),0,pi/2,0);
    t45 = DH_dist(ang(5),50,0,0);
    
    t02 = t01*t12;
    t03 = t02*t23;
    t04 = t03*t34;
    t05 = t04*t45;
    
    plot3([0 t01(1,4)],[0 t01(2,4)],[0 t01(3,4)],'linewidth',4)
    hold on
    plot3([t01(1,4) t02(1,4)],[t01(2,4) t02(2,4)],[t01(3,4) t02(3,4)],'linewidth',4)
    
    %plotting shoulder
    plot3([t02(1,4) t03(1,4)],[t02(2,4) t03(2,4)],[t02(3,4) t03(3,4)],'linewidth',4)
    
    %plotting elbow
    plot3([t03(1,4) t04(1,4)],[t03(2,4) t04(2,4)],[t03(3,4) t04(3,4)],'linewidth',4)
    
    %plotting wrist
    plot3([t04(1,4) t05(1,4)],[t04(2,4) t05(2,4)],[t04(3,4) t05(3,4)],'linewidth',4)
    
    plot3(x1(1:i),y1(1:i),z1(1:i),'k')
    
    hold off
    pause(0.10);
    clf;
end

x2 = linspace(task1_post2(1,4),task1_post3(1,4),20);
y2 = linspace(task1_post2(2,4),task1_post3(2,4),20);
z2 = linspace(task1_post2(3,4),task1_post3(3,4),20);
T_st_angles = [];
for i = 1:20
    l_vec = sqrt(x2(i)^2 + z2(i)^2);
    c1 = x2(i)/l_vec;
    s1 = y2(i)/l_vec;
    T_st_angles(:,:,i) = [s1 0 c1 x2(i);-c1 0 s1 y2(i);0 -1 0 z2(i);0 0 0 1];
    ang = aurora_inv(T_st_angles(:,:,i));
    axis([-500 500, -500 500, -500 500]);
    hold on;
    t01 = DH_dist(ang(1),50,-pi/2,0);
    t12 = DH_dist(ang(2),0,0,160);
    t23 = DH_dist(ang(3),0,0,160);
    t34 = DH_dist(ang(4),0,pi/2,0);
    t45 = DH_dist(ang(5),50,0,0);
    
    t02 = t01*t12;
    t03 = t02*t23;
    t04 = t03*t34;
    t05 = t04*t45;
    
    plot3([0 t01(1,4)],[0 t01(2,4)],[0 t01(3,4)],'linewidth',4)
    plot3([t01(1,4) t02(1,4)],[t01(2,4) t02(2,4)],[t01(3,4) t02(3,4)],'linewidth',4)
    
    %plotting shoulder
    plot3([t02(1,4) t03(1,4)],[t02(2,4) t03(2,4)],[t02(3,4) t03(3,4)],'linewidth',4)
    
    %plotting elbow
    plot3([t03(1,4) t04(1,4)],[t03(2,4) t04(2,4)],[t03(3,4) t04(3,4)],'linewidth',4)
    
    %plotting wrist
    plot3([t04(1,4) t05(1,4)],[t04(2,4) t05(2,4)],[t04(3,4) t05(3,4)],'linewidth',4)
    
    plot3(x1,y1,z1,'k')
    
    plot3(x2(1:i),y2(1:i),z2(1:i),'k')
    pause(0.10);
    clf;
end

x3 = linspace(task1_post3(1,4),task1_post4(1,4),20);
y3 = linspace(task1_post3(2,4),task1_post4(2,4),20);
z3 = linspace(task1_post3(3,4),task1_post4(3,4),20);
T_st_angles = [];
for i = 1:20
    l_vec = sqrt(x3(i)^2 + z3(i)^2);
    c1 = x3(i)/l_vec;
    s1 = y3(i)/l_vec;
    T_st_angles(:,:,i) = [s1 0 c1 x3(i);-c1 0 s1 y3(i);0 -1 0 z3(i);0 0 0 1];
    ang = aurora_inv(T_st_angles(:,:,i));
    axis([-500 500, -500 500, -500 500]);
    hold on
    t01 = DH_dist(ang(1),50,-pi/2,0);
    t12 = DH_dist(ang(2),0,0,160);
    t23 = DH_dist(ang(3),0,0,160);
    t34 = DH_dist(ang(4),0,pi/2,0);
    t45 = DH_dist(ang(5),50,0,0);
    
    t02 = t01*t12;
    t03 = t02*t23;
    t04 = t03*t34;
    t05 = t04*t45;
    
    plot3([0 t01(1,4)],[0 t01(2,4)],[0 t01(3,4)],'linewidth',4)
    
    plot3([t01(1,4) t02(1,4)],[t01(2,4) t02(2,4)],[t01(3,4) t02(3,4)],'linewidth',4)
    
    %plotting shoulder
    plot3([t02(1,4) t03(1,4)],[t02(2,4) t03(2,4)],[t02(3,4) t03(3,4)],'linewidth',4)
    
    %plotting elbow
    plot3([t03(1,4) t04(1,4)],[t03(2,4) t04(2,4)],[t03(3,4) t04(3,4)],'linewidth',4)
    
    %plotting wrist
    plot3([t04(1,4) t05(1,4)],[t04(2,4) t05(2,4)],[t04(3,4) t05(3,4)],'linewidth',4)
    
    plot3(x1,y1,z1,'k')
    
    plot3(x2,y2,z2,'k')
    
    plot3(x3(1:i),y3(1:i),z3(1:i),'k')
    pause(0.10);
    clf;
end

x4 = linspace(task1_post4(1,4),task1_post5(1,4),20);
y4 = linspace(task1_post4(2,4),task1_post5(2,4),20);
z4 = linspace(task1_post4(3,4),task1_post5(3,4),20);
T_st_angles = [];
for i = 1:20
    l_vec = sqrt(x4(i)^2 + z4(i)^2);
    c1 = x4(i)/l_vec;
    s1 = y4(i)/l_vec;
    T_st_angles(:,:,i) = [s1 0 c1 x4(i);-c1 0 s1 y4(i);0 -1 0 z4(i);0 0 0 1];
    ang = aurora_inv(T_st_angles(:,:,i));
    axis([-500 500, -500 500, -500 500]);
    hold on
    t01 = DH_dist(ang(1),50,-pi/2,0);
    t12 = DH_dist(ang(2),0,0,160);
    t23 = DH_dist(ang(3),0,0,160);
    t34 = DH_dist(ang(4),0,pi/2,0);
    t45 = DH_dist(ang(5),50,0,0);
    
    t02 = t01*t12;
    t03 = t02*t23;
    t04 = t03*t34;
    t05 = t04*t45;
    
    plot3([0 t01(1,4)],[0 t01(2,4)],[0 t01(3,4)],'linewidth',4)
    
    plot3([t01(1,4) t02(1,4)],[t01(2,4) t02(2,4)],[t01(3,4) t02(3,4)],'linewidth',4)
    
    %plotting shoulder
    plot3([t02(1,4) t03(1,4)],[t02(2,4) t03(2,4)],[t02(3,4) t03(3,4)],'linewidth',4)
    
    %plotting elbow
    plot3([t03(1,4) t04(1,4)],[t03(2,4) t04(2,4)],[t03(3,4) t04(3,4)],'linewidth',4)
    
    %plotting wrist
    plot3([t04(1,4) t05(1,4)],[t04(2,4) t05(2,4)],[t04(3,4) t05(3,4)],'linewidth',4)
    
    plot3(x1,y1,z1,'k')
    
    plot3(x2,y2,z2,'k')
    
    plot3(x3,y3,z3,'k')
    
    plot3(x4(1:i),y4(1:i),z4(1:i),'k')
    pause(0.10);
    clf;
    if i==20
        pause(1)
    end
    clf;
end