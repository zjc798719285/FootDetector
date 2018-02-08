function [draw_img,FP]=FootPointSearch(img)
%FP:pad_left;heel_left;pad_right;heel_right
[draw_img,pad_left,pad_right,heel_left,heel_right]=foot_bbox(img);
[FP,hashTab]=convexLine(pad_left, heel_left, pad_right, heel_right);
draw_img=drawConvexLine(draw_img,FP);
point=[pad_left; heel_left; pad_right; heel_right];
pointSet=point(hashTab,:);
% draw_img=draw_point(draw_img, pointSet);
    function draw_img=draw_point(img, point)
        for i=1:length(point)
            img(point(i,1)-2:point(i,1)+2,point(i,2)-2:point(i,2)+2)=255;
        end
        draw_img = img;
    end
end