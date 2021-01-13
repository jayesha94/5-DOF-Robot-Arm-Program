for a=0:0.5:pi
    for b = 0:0.5:pi
        for c = 0:0.5:pi
            for d = 0:0.5:pi
                t01 = DH_dist(a,50,sym(-pi/2),0);
                t12 = DH_dist(b,0,0,160);
                t23 = DH_dist(c,0,0,160);
                t34 = DH_dist(d,0,sym(pi/2),0);
                t45 = DH_dist(sym(pi/4),50,0,0);
                
                t05 = t01*t12*t23*t34*t45;
                
                scatter3(t05(1,4),t05(2,4),t05(3,4),'.');
                hold on
            end
        end
    end
end
