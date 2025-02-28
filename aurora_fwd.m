function [final_transform] = aurora_fwd(q1, q2, q3, q4, q5)
  
syms len1 len2 len3 len4;
     
     %Using Distal
     t01 = DH_dist(q1,len1,-pi/2,0);
     t12 = DH_dist(q2,0,0,len2);
     t23 = DH_dist(q3,0,0,len3);
     t34 = DH_dist(q4,0,pi/2,0);
     t45 = DH_dist(q5,len4,0,0);
    
    %for plotting
    t02 = t01*t12;
    t03 = t02*t23;
    t04 = t03*t34;
    t05 = t04*t45;
    
    %converting to numerical value
    t01_num = double(subs(t01,[len1 len2 len3 len4],[50 160 160 50]));
    t02_num = double(subs(t02,[len1 len2 len3 len4],[50 160 160 50]));
    t03_num = double(subs(t03,[len1 len2 len3 len4],[50 160 160 50]));
    t04_num = double(subs(t04,[len1 len2 len3 len4],[50 160 160 50]));
    t05_num = double(subs(t05,[len1 len2 len3 len4],[50 160 160 50]));
    
    final_transform = t05_num;
    
    %plotting the robot
    close all;
    figure(1);
    axis([-500 500 -500 500 -500 500])
    %plotting base
    plot3([t01_num(1,4) t02_num(1,4)],[t01_num(2,4) t02_num(2,4)],[t01_num(3,4) t02_num(3,4)])
    hold on
    
    %plotting shoulder
    plot3([t02_num(1,4) t03_num(1,4)],[t02_num(2,4) t03_num(2,4)],[t02_num(3,4) t03_num(3,4)])
    
    %plotting elbow
    plot3([t03_num(1,4) t04_num(1,4)],[t03_num(2,4) t04_num(2,4)],[t03_num(3,4) t04_num(3,4)])
    
    %plotting wrist
    plot3([t04_num(1,4) t05_num(1,4)],[t04_num(2,4) t05_num(2,4)],[t04_num(3,4) t05_num(3,4)])
    hold off
end