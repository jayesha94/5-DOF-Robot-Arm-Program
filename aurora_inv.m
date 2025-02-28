function [angles] = aurora_inv(t05)

% syms q1 q2 q3 q4 q5 base len1 len2 len3; %Creating symbolic variables to work with in the DH table

%The following is the distal DH table for using in the inverse kinematics
% dh = [q1 base -pi/2 0;
%       q2 0 0 len1;
%       q3 0 0 len2;
%       q4 0 pi/2 0;
%       q5 len3 0 0];

%base = 50
%len1 = 160
%len2 = 160
%len3 = 50

% %Getting transformation matrices using the DH function
% t01 = DH_dist(dh(1,1),dh(1,2),dh(1,3),dh(1,4));
% t12 = DH_dist(dh(2,1),dh(2,2),dh(2,3),dh(2,4));
% t23 = DH_dist(dh(3,1),dh(3,2),dh(3,3),dh(3,4));
% t34 = DH_dist(dh(4,1),dh(4,2),dh(4,3),dh(4,4));
% t45 = DH_dist(dh(5,1),dh(5,2),dh(5,3),dh(5,4));
% 
% angle_values = [pi/2 pi/4 pi/3 pi/6 pi/6];
% 
% t05=simplify(t01*t12*t23*t34*t45);
% t05_num = double(subs(t05,[base len1 len2 len3 q1 q2 q3 q4 q5], [50 160 160 50 angle_values]));

t05_num = t05;

%Calculating theta 1
theta1 = atan2(t05_num(2,4),t05_num(1,4));
%------------------------------------------------------%

%Updating the value of the matrix based on the value of theta1
% t01_num = double(subs(t01,[q1 base],[theta1 50]));
t01_num = DH_dist(theta1,50,-pi/2,0);
t15_num = inv(t01_num)*t05_num;
%------------------------------------------------------%

%Calculating theta 5
theta5 = atan2(t15_num(3,1),t15_num(3,2));
%------------------------------------------------------%

%Updating the value of the matrix based on the value of theta5
t45_num = DH_dist(theta5,50,0,0);
t14_num = t15_num*inv(t45_num);
%------------------------------------------------------%

%Calculating theta3
numerator = t14_num(1,4)^2+t14_num(2,4)^2 - (160^2) - (160^2);
denominator = 2*160*160;
c_new_3 = acos(numerator/denominator);
theta3 = c_new_3;

%Going by the manual calculation method to calculate theta2
a = 160*cos(theta3) + 160;
b = 160*sin(theta3);

x = t14_num(1,4);
y = t14_num(2,4);

c2 = (a*x + b*y)/(a^2 + b^2);
theta2 = acos(c2);
%-------------------------------------------------------%

%Finding the value of theta4:
c234 = t05_num(3,3);
theta4 = acos(c234) - (theta2 + theta3);
%-------------------------------------------------------%
angles = [theta1 theta2 theta3 theta4 theta5];
end
