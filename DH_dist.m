function [dh_table] = DH_dist(th,d,al,a)
dh_table = [cos(th) -cos(al)*sin(th) sin(al)*sin(th) a*cos(th);
            sin(th) cos(th)*cos(al) -sin(al)*cos(th) a*sin(th);
            0 sin(al) cos(al) d;
            0 0 0 1];
end