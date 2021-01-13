clear all;
clc;
%Plotting%
len_grip = 2; %length of the gripper part of end effector

aurora_task_positions;
tea_hold = [[0 0 -1; -1 0 0;0 -1 0] [30,-209,70]';
            0 0 0 1];

t_an = [];
t_an(:,:,1) = [linspace(0,0.5,20);linspace(0,0.77,20);linspace(0.5,0.6,20);linspace(-0.5,0.13,20);linspace(0,-0.5,20)];
t_an(:,:,2) = [linspace(0.5,0.25,20);linspace(0.77,0.3,20);linspace(0.6,0.6,20);linspace(0.13,-0.2,20);linspace(-0.5,0,20)];
t_an(:,:,3) = [linspace(0.25,-0.25,20);linspace(0.3,0.7,20);linspace(0.6,0.28,20);linspace(-0.2,-0.21,20);linspace(0,0.5,20)];
t_an(:,:,4) = [linspace(-0.25,0.3,20);linspace(0.7,0,20);linspace(0.28,0.3,20);linspace(-0.21,0,20);linspace(0.5,0,20)];
pause(2);

free_plot_x=[];
free_plot_y=[];
free_plot_z=[];
counter = 0;


for count = 1:4
    for pos = 1:20
        t1 = t_an(1,pos,count)*pi; %determining the joint angles for the individual points in the trajectory
        t2 = t_an(2,pos,count)*pi; 
        t3 = t_an(3,pos,count)*pi; 
        t4 = t_an(4,pos,count)*pi;
        t5 = t_an(5,pos,count)*pi;

        t01 = DH_dist(t1,50,-pi/2,0); %theta,d,alpha,a %t is the changing angle for the joint %lengths of the corresponding l1-l4
        t12 = DH_dist(t2,0,0,160);
        t23 = DH_dist(t3,0,0,160);
        t34 = DH_dist(t4,0,pi/2,0);
        t45 = DH_dist(t5,50,0,0);

        t02 = t01*t12;
        t03 = t02*t23;
        t04 = t03*t34;
        t05 = t04*t45;
        
        counter = counter+1;
        free_plot_x(counter) = t05(1,4);
        free_plot_y(counter) = t05(2,4);
        free_plot_z(counter) = t05(3,4);

        x1 = [0,t01(1,4)];
        x2 = [t01(1,4),t02(1,4)];
        x3 = [t02(1,4),t03(1,4)];
        x4 = [t03(1,4),t04(1,4)];
        x5 = [t04(1,4),t05(1,4)];
        x6 = [t05(1,4)+6];

        y1 = [0,t01(2,4)];
        y2 = [t01(2,4),t02(2,4)];
        y3 = [t02(2,4),t03(2,4)];
        y4 = [t03(2,4),t04(2,4)];
        y5 = [t04(2,4),t05(2,4)];
        y6 = [t05(2,4)];

        z1 = [0,t01(3,4)];
        z2 = [t01(3,4),t02(3,4)];
        z3 = [t02(3,4),t03(3,4)];
        z4 = [t03(3,4),t04(3,4)];
        z5 = [t04(3,4),t05(3,4)];
        z6 = [t05(3,4)+ 6];

        %------plotting the robot arm-----%
        axis([-350 350, -300 300,-300 300]); %size of axis
        hold on;
        end_eff_pos1 = t05(1:3,4)+len_grip*t05(1:3,1); %determination of the postion of the end effector/cup while pick and place
        x6=end_eff_pos1(1);
        y6=end_eff_pos1(2);
        z6=end_eff_pos1(3);

        end_eff_pos2 = t05(1:3,4)-len_grip*t05(1:3,1);
        x7=end_eff_pos2(1);
        y7=end_eff_pos2(2);
        z7=end_eff_pos2(3);

        end_eff_pos3 = end_eff_pos1+len_grip*t05(1:3,3);
        x8=end_eff_pos3(1);
        y8=end_eff_pos3(2);
        z8=end_eff_pos3(3);

        end_eff_pos4 = end_eff_pos2+len_grip*t05(1:3,3);
        x9=end_eff_pos4(1);
        y9=end_eff_pos4(2);
        z9=end_eff_pos4(3);
        
        %----Plot arm and the end effector---------%
        plot3(x1,y1,z1,'color','g','linewidth',6)
        hold on;
        plot3(x2,y2,z2,'color','r','linewidth',6)
        plot3(x3,y3,z3,'color','k','linewidth',6)
        plot3(x4,y4,z4,'color','c','linewidth',6)
        plot3(x5,y5,z5,'color','b','linewidth',6)
        plot3([t05(1,4) x6],[t05(2,4) y6],[t05(3,4) z6],'color','b','linewidth',6)
        plot3([t05(1,4) x7],[t05(2,4) y7],[t05(3,4) z7],'color','b','linewidth',6)
        plot3([x6 x8],[y6 y8],[z6 z8],'color','b','linewidth',10)
        plot3([x7 x9],[y7 y9],[z7 z9],'color','b','linewidth',10)
        plot3(free_plot_x, free_plot_y, free_plot_z,'color','b','linewidth',2)

        xlabel('X');
        ylabel('Y');
        zlabel('Z');

        %------For jug----------%
        if count == 1
            aurora_plot_jug(tea_hold);
        else
            aurora_plot_jug(t05);
        end

        %----Tea cup1 @ -25,20---%
        radius_cup = sqrt(linspace(.5,50,2.5));
        [A,B,C]=cylinder(radius_cup);
        C(2,:)= 3;
        surf(A-300,B,C-50);

        %----Tea cup2 @ -10,-5----%
        radius_cup = sqrt(linspace(.5,50,2.5));
        [A,B,C]=cylinder(radius_cup);
        C(2,:)= 3;
        surf(A-200,B-250,C-50);
        pause(0.005);
        if pos < 20
            clf;
        end
    end
    pause(0.5) %pause time 
    clf;  %clear figure after every movement
end
