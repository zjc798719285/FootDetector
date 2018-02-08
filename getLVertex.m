function LowPoint=getLVertex(img)
[h,~,~]=size(img);
[draw_img,FP]=FootPointSearch(img);
p1=[FP(1,2),h-FP(1,1)];
p2=[FP(2,2),h-FP(2,1)];
p3=[FP(3,2),h-FP(3,1)];
p4=[FP(4,2),h-FP(4,1)];
a_left=(p2(2)-p1(2))/(p2(1)-p1(1));
a_right=(p3(2)-p4(2))/(p3(1)-p4(1));
b_left=(p1(2)*p2(1)-p2(2)*p1(1))/(p2(1)-p1(1));
b_right=(p3(2)*p4(1)-p4(2)*p3(1))/(p4(1)-p3(1));
x=round((b_right-b_left)/(a_left-a_right));
y=round((a_left*b_right-a_right*b_left)/(a_left-a_right));
LowPoint=[x,y];
imshow(draw_img)
end