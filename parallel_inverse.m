
function p_inv=parallel_inverse(x1,y1,t4)
close all;      %closes the previous plot image
%Both the triangles are equilateral triangles(each angle 60)%The centre of
%each is at 0,0
%Design parameter of parallel robot(in mm)
Sa=170;
L=130;
r_p=130;%r_platform
r_b=290;%r_base

%Initial Position and orientation of the end effector with respect to the
%base(defined as arguments to function above)
% x1 = 0;
% y1 = 0;
% t4 = pi/6;

xc=x1;
yc=y1;
alpha=t4;

%Angular joint positions
PB1=pi/2;
PB2=pi+(pi/6);
PB3=(2*pi)-(pi/6);

PP1=pi/2;
PP2=pi+(pi/6);
PP3=(2*pi)-(pi/6);

%equation
%BC=BPP-CPP;

Tl_BC = [x1 y1 0]'; %Tranlation_BC[z=0(translation)]
Rot_BC = [cos(t4) -sin(t4) 0; 
         sin(t4) cos(t4) 0; 
         0  0  1];
Tf_BC = Rot_BC*Tl_BC ; %Transformation_BC
Tf_BC_final = [Rot_BC Tl_BC;
                0 0 0 1];

%Considering C as the Centre of the end-effector and coordinates being
%0,0 we find the corresponding coordinates of the 3 corners of the traiangle whose radius is r_p.
%taking the numbering of 1 to 3 in an anti-clockwise direction, starting
%from the left bottom corner.
CPP1 = [-r_p*cos(pi/6);
       -r_p*sin(pi/6);
       0];
CPP2= [r_p*cos(pi/6);
      -r_p*sin(pi/6);
      0];
CPP3= [0;
      r_p;
      0];
  
CPP = [r_p*(cos(pi/2)) r_p*(cos(7*pi/6)) r_p*(cos(11*pi/6));
       r_p*(sin(pi/2)) r_p*(sin(7*pi/6)) r_p*(sin(11*pi/6));
        1 1 1];
   
BPB1= [-r_b*cos(pi/6);
       -r_b*sin(pi/6);
       0];
BPB2 = [r_b*cos(pi/6);
      -r_b*sin(pi/6);
      0];
BPB3 =  [0;
      r_b;
      0];

BPB = [r_b*(cos(pi/2)) r_b*(cos(7*pi/6)) r_b*(cos(11*pi/6));
       r_b*(sin(pi/2)) r_b*(sin(7*pi/6)) r_b*(sin(11*pi/6));
        1 1 1];
    
%Calculating BPP
BPP1 = Rot_BC*CPP1 + Tl_BC;
BPP2 = Rot_BC*CPP2 + Tl_BC;
BPP3 = Rot_BC*CPP3 + Tl_BC;

%Calculating PBiPPi(each corresponding)
PB1PP1 = BPP1 - BPB1;
PB2PP2 = BPP2 - BPB2;
PB3PP3 = BPP3 - BPB3;

%assigning positions of xppi and yppi
xpp1= PB1PP1(1);
ypp1= PB1PP1(2);

xpp2= PB2PP2(1);
ypp2= PB2PP2(2);

xpp3= PB3PP3(1);
ypp3= PB3PP3(2);
     
%For THETA_1 in the first left corner
e1= -2*ypp1*Sa;
e2= -2*xpp1*Sa;
e3= (xpp1)^2 + (ypp1)^2 + (Sa)^2 -(L)^2;

%Substituting the value with x and y
x1 = e3-e2;

%Solution for one angle(1)
y11 = (-e1 +((e1^2 + e2^2 - e3^2)^0.5)) ;  %positive solution
y12 = (-e1 -((e1^2 + e2^2 - e3^2)^0.5)) ; %negative solution

theta_11 = 2*atan2(y11,x1);                         %Value of two solutions of theta
theta_12 = 2*atan2(y12,x1);                         %Value of two solutions of theta

%Solving phy for varying values
phy_11_x = xpp1 - (Sa*cos(theta_11)); 
phy_11_y = ypp1 - (Sa*sin(theta_11));
phy_11 = atan2(phy_11_y,phy_11_x);         %atan=tan^-1 %2 for 2 values

phy_12_x = xpp1 - (Sa*cos(theta_12)); 
phy_12_y = ypp1 - (Sa*sin(theta_12));
phy_12 = atan2(phy_12_y,phy_12_x);

%To plot 1(taking theta)
BM11 = [BPB1(1) + Sa*cos(theta_11); %As per the triangle rule:bpb1+pb1m=mb(wrt to PB as the point so its positive)
          BPB1(2) + Sa*sin(theta_11);
           0];
       
BM12 = [BPB1(1) + Sa*cos(theta_12); 
          BPB1(2) + Sa*sin(theta_12);
           0];
       
%To plot 1(taking phy)
BPP11 = [BM11(1) + L*cos(phy_11);
         BM11(2) + L*sin(phy_11);
          0];
         
BPP12 = [BM12(1) + L*cos(phy_12);
         BM12(2) + L*sin(phy_12);
          0];



%For THETA_2 in the right corner
e1= -2*ypp2*Sa;
e2= -2*xpp2*Sa;
e3= (xpp2)^2 + (ypp2)^2 + (Sa)^2 -(L)^2;

%Substituting the value with x and y
x2 = e3-e2;

%Solution for one angle(1)
y21 = (-e1 +((e1^2 + e2^2 - e3^2)^0.5)) ;  %positive solution
y22 = (-e1 -((e1^2 + e2^2 - e3^2)^0.5)) ; %negative solution

theta_21 = 2*atan2(y21,x2);                         %Value of two solutions of theta
theta_22 = 2*atan2(y22,x2);                         %Value of two solutions of theta

%Solving phy for varying values
phy_21_x = xpp2 - (Sa*cos(theta_21)); 
phy_21_y = ypp2 - (Sa*sin(theta_21));
phy_21 = atan2(phy_21_y,phy_21_x);         %atan=tan^-1 %2 for 2 values

phy_22_x = xpp2 - (Sa*cos(theta_22)); 
phy_22_y = ypp2 - (Sa*sin(theta_22));
phy_22 = atan2(phy_22_y,phy_22_x);

%To plot 2
BM21 = [BPB2(1) + Sa*cos(theta_21); 
          BPB2(2) + Sa*sin(theta_21);
           0];
BM22 = [BPB2(1) + Sa*cos(theta_22); 
          BPB2(2) + Sa*sin(theta_22);
           0];
%To plot 2(taking phy)
BPP21 = [BM21(1) + L*cos(phy_21);
         BM21(2) + L*sin(phy_21);
          0];
         
BPP22 = [BM22(1) + L*cos(phy_22);
         BM22(2) + L*sin(phy_22);
          0];

%For THETA_3 on the top
e1= -2*ypp3*Sa;
e2= -2*xpp3*Sa;
e3= (xpp3)^2 + (ypp3)^2 + (Sa)^2 -(L)^2;

%Substituting the value with x and y
x3 = e3-e2;

%Solution for one angle(1)
y31 = (-e1 +((e1^2 + e2^2 - e3^2)^0.5)) ;  %positive solution
y32 = (-e1 -((e1^2 + e2^2 - e3^2)^0.5)) ; %negative solution

theta_31 = 2*atan2(y31,x3);                         %Value of two solutions of theta
theta_32 = 2*atan2(y32,x3);                         %Value of two solutions of theta

%Solving phy for varying values
phy_31_x = xpp3 - (Sa*cos(theta_31)); 
phy_31_y = ypp3 - (Sa*sin(theta_31));
phy_31 = atan2(phy_31_y,phy_31_x);         %atan=tan^-1 %2 for 2 values

phy_32_x = xpp3 - (Sa*cos(theta_32)); 
phy_32_y = ypp3 - (Sa*sin(theta_32));
phy_32 = atan2(phy_32_y,phy_32_x);

%To plot 3
BM31 = [BPB3(1) + Sa*cos(theta_31); 
          BPB3(2) + Sa*sin(theta_31);
           0];
BM32 = [BPB3(1) + Sa*cos(theta_32); 
          BPB3(2) + Sa*sin(theta_32);
           0 ];
       
%To plot 3(taking phy)
BPP31 = [BM31(1) + L*cos(phy_31);
         BM31(2) + L*sin(phy_31);
          0];
         
BPP32 = [BM32(1) + L*cos(phy_32);
         BM32(2) + L*sin(phy_32);
          0];
%Calculating the position of the Centre with respect to the end effector 
%BC=BPPi+PPiC
%BC = BPP11+PP11C(as point needs to be plotted)
BC = [BPP11(1) + r_p*(cos((pi/6)+t4));
      BPP11(2) + r_p*(sin((pi/6)+t4));
      0];
  
%---------------------Plotting the Robot-----------------------------------

% %-------------------Plotting the Platform/base-----------------------------
plot([BPB1(1),BPB2(1),BPB3(1),BPB1(1)],[BPB1(2),BPB2(2),BPB3(2),BPB1(2)])
hold on;
% %----------------------Plotting the Arms-----------------------------------
plot([BPB1(1),BM11(1),BPP11(1)],[BPB1(2),BM11(2),BPP11(2)])
plot([BPB2(1),BM21(1),BPP21(1)],[BPB2(2),BM21(2),BPP21(2)])
plot([BPB3(1),BM31(1),BPP31(1)],[BPB3(2),BM31(2),BPP31(2)])
% % 
% % %-------------------Plotting the End Effector----------------------------
plot([BPP1(1),BPP2(1),BPP3(1),BPP1(1)],[BPP1(2),BPP2(2),BPP3(2),BPP1(2)])
% % 
% % %-------------------Position of the Neddle(Centre)---------------------
plot( BC(1), BC(2),'o')%Orientation is not considered as the end point is a needle

p_inv=[BC(1) BC(2)];%to optimise the code
%p_inv=[theta_11 theta_21 theta_31 phy_11 phy_21 phy_31 BC(1) BC(2)];
%p_inv defined above returns all the 3 theta values, all the 3 phy values and the Centre position

end