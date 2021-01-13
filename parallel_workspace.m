clear all;
close all;
clc;
alpha = pi/6; %t4
x = 0; %x is taken as a counter
for xc = -250:250 % values in x
    for yc = -250:250 %values in y
        try   %try used to handle the error with the following piece of code since we dont know if it will give an error or not for the above values
            ws = parallel_inverse(xc, yc, alpha) ; %ws=workspace
        catch  %if it catches an error in the above code, the following code works
            ws = []; %This code completely empties the ws
        end
        if isempty(ws) == 0 %when there is value passed in ws
            x=x+1; %plotting of the workspace when the values are correct
            valx(x) = ws(1); %the values of centroid BC(1) and BC(2) for plotting the workspace, in 1st and 2nd position of the written variable of the parallel_inverse function
            valy(x) = ws(2);
        end
    end
end
plot(valx,valy,'.')
