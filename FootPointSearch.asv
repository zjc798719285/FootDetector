function [draw_img,FP]=FootPointSearch(img)
%FP:pad_left;heel_left;pad_right;heel_right
[~,rect,pad_left,pad_right,heel_left,heel_right]=foot_bbox(img);
UPOINT=getVertex(img,rect);
[FP,~]=convexLine(pad_left, heel_left, pad_right, heel_right);
[DPOINT, line]=getLVertex(img,FP);
FP=[FP;UPOINT;DPOINT];
draw_img=drawConvexLine(img,FP);
%point=[pad_left; heel_left; pad_right; heel_right];
% pointSet=point(hashTab,:);
% % draw_img=draw_point(draw_img, pointSet);
%     function draw_img=draw_point(img, point)
%         for i=1:length(point)
%             img(point(i,1)-2:point(i,1)+2,point(i,2)-2:point(i,2)+2)=255;
%         end
%         draw_img = img;
%     end
end