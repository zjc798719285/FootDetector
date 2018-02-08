function [LowPoint, line]=getLVertex(img,FP)
line=[];
eps=1e-6;
[h,~,~]=size(img);
thresh=get_thresh(img);
p1=[FP(1,2),h-FP(1,1)];
p2=[FP(2,2),h-FP(2,1)];
p3=[FP(3,2),h-FP(3,1)];
p4=[FP(4,2),h-FP(4,1)];
a_left=(p2(2)-p1(2))/(p2(1)-p1(1));
a_right=(p3(2)-p4(2))/(p3(1)-p4(1));
b_left=(p1(2)*p2(1)-p2(2)*p1(1))/(p2(1)-p1(1));
b_right=(p3(2)*p4(1)-p4(2)*p3(1))/(p4(1)-p3(1));
x0=round((b_right-b_left)/(a_left-a_right)+eps);
y0=round((a_left*b_right-a_right*b_left)/(a_left-a_right)+eps);
angle=0.5*(get_angle(a_left)+get_angle(a_right));
for y=1:h
    line_x=(y-y0)/tan(angle)+x0;
    if isnan(round(line_x))
        line_x = x0;
    end
    line_y=y;
    line(end+1,:)=[round(h-line_y+1),round(line_x)];
end
for i=1:length(line)
    if isnan(line(i,2))
    line(i,2)=1;
    end
    if img(line(i,1),line(i,2))>thresh
        LowPoint=[line(i,1),line(i,2)];
        break;
    end
end
    function angle = get_angle(a)
        if atan(a)<0
            angle = 3.1415926+atan(a);
        else
            angle = atan(a);
        end
    end
end