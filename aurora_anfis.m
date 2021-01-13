clear all;
clc;

%Code based on piece of code from:
% https://uk.mathworks.com/help/fuzzy/modeling-inverse-kinematics-in-a-robotic-arm.html

l1 = 50; % length of base
l2 = 160; % length of first arm
l3 = 160; %length of second arm
l4 = 50; %length of end effector

theta1 = 0:0.1:pi; % all possible theta1 values
theta2 = 0:0.1:pi; % all possible theta2 values
theta3 = 0:0.1:pi; % all possible theta3 values
theta4 = 0:0.1:pi; % all possible theta4 values
theta5 = 0:0.1:pi; % all possible theta5 values

t05 = [];
X = [];
Y = [];
Z = [];


count = 0;
for i = 1:32
    count = count+1;
    t05(count,:,:) = aurora_fwd(theta1(i),theta2(i),theta3(i),theta4(i),theta5(i));
    X(count) = t05(count,1,4);
    Y(count) = t05(count,2,4);
    Z(count) = t05(count,3,4);
end

% transform = aurora_fwd(theta1,theta2,theta3,theta4,theta5);
% 
% X = transform(1,4); % compute x coordinates
% Y = transform(2,4); % compute y coordinates
% Z = transform(3,4); % compute z coordinates

data1 = [X(:) Y(:) Z(:) theta1(:)]; % create x-y-theta1 dataset
data2 = [X(:) Y(:) Z(:) theta2(:)]; % create x-y-theta2 dataset
data3 = [X(:) Y(:) Z(:) theta3(:)]; % create x-y-theta3 dataset
data4 = [X(:) Y(:) Z(:) theta4(:)]; % create x-y-theta4 dataset
data5 = [X(:) Y(:) Z(:) theta5(:)]; % create x-y-theta5 dataset

opt = anfisOptions;
opt.EpochNumber = 150;
opt.DisplayANFISInformation = 0;
opt.DisplayErrorValues = 0;
opt.DisplayStepSize = 0;
opt.DisplayFinalResults = 0;

disp('--> Training anfis network for theta1');
fis1 = anfis(data1,opt);

disp('--> Training anfis network for theta2');
fis2 = anfis(data2,opt);

disp('--> Training anfis network for theta3');
fis3 = anfis(data3,opt);

disp('--> Training anfis network for theta4');
fis4 = anfis(data4,opt);

disp('--> Training anfis network for theta5');
fis5 = anfis(data5,opt);

%test file--actual result
t_test = aurora_fwd(pi/3,pi/4,pi/3,pi/4,pi/2);
x_test = t_test(1,4);
y_test = t_test(2,4);
z_test = t_test(3,4);

xyz_test = [x_test y_test z_test];

%predicted result
theta1_pred = evalfis(fis1,xyz_test);
theta2_pred = evalfis(fis2,xyz_test);
theta3_pred = evalfis(fis3,xyz_test);
theta4_pred = evalfis(fis4,xyz_test);
theta5_pred = evalfis(fis5,xyz_test);

theta1diff = (pi/3) - theta1_pred;
theta2diff = (pi/4) - theta2_pred;
theta3diff = (pi/3) - theta3_pred;
theta4diff = (pi/4) - theta4_pred;
theta5diff = (pi/2) - theta5_pred;

disp('The difference in predicted values (in radians) is:');
disp([theta1diff theta2diff theta3diff theta4diff theta5diff]);

disp('The difference in predicted values (in degrees) is:');
disp([rad2deg(theta1diff) rad2deg(theta2diff) rad2deg(theta3diff) rad2deg(theta4diff) rad2deg(theta5diff)]);