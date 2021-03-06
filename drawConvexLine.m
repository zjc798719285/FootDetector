function [draw_img,lines]=drawConvexLine(img,p)
[h,w,~]=size(img);
lines={};
lineRight=zeros(h,2);lineLeft=zeros(h,2);
pl=p(1,:);hl=p(2,:);
pr=p(3,:);hr=p(4,:);
for x=1:h
    yl=(hl(2)-pl(2))/(hl(1)-pl(1))*(x-pl(1))+pl(2);
    yr=(hr(2)-pr(2))/(hr(1)-pr(1))*(x-pr(1))+pr(2);
    yl=max(round(yl),1);yl=min(yl,w);
    yr=max(round(yr),1);yr=min(yr,w);
    img(x,yl)=255;
    img(x,yr)=255;
    lineRight(x,1)=x;lineRight(x,2)=yr;
    lineLeft(x,1)=x;lineLeft(x,2)=yl;
end
lines{1}=lineLeft;lines{2}=lineRight;
img(p(1,1)-5:p(1,1)+5,p(1,2)-5:p(1,2)+5)=255;
img(p(2,1)-5:p(2,1)+5,p(2,2)-5:p(2,2)+5)=255;
img(p(3,1)-5:p(3,1)+5,p(3,2)-5:p(3,2)+5)=255;
img(p(4,1)-5:p(4,1)+5,p(4,2)-5:p(4,2)+5)=255;
img(p(5,1)-5:p(5,1)+5,p(5,2)-5:p(5,2)+5)=255;
img(p(6,1)-5:p(6,1)+5,p(6,2)-5:p(6,2)+5)=255;
img(p(5,1),:)=255;
draw_img=img;
end