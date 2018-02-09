function [draw_img,rect,pad_left,pad_right,heel_left,heel_right]=getFootBoundary(img)
[rect,~]=footRectDetector(img);
img=rectFilter(img,rect);
[pad_up_left,...
 pad_down_left,...
 pad_up_right,...
 pad_down_right,...
 heel_up,...
 heel_down]=getPadHeelRegion(img);
padLeft=img(pad_up_left:pad_down_left,:);
padRight=img(pad_up_right:pad_down_right,:);
heel=img(heel_up:heel_down,:);
[pad_left,~]=boundry_search(padLeft,pad_up_left);
[~,pad_right]=boundry_search(padRight,pad_up_right);
[heel_left,heel_right]=boundry_search(heel,heel_up);
pad_left=check_box(pad_left);
pad_right=check_box(pad_right);
heel_left=check_box(heel_left);
heel_right=check_box(heel_right);
draw_img=draw_boundry(img, pad_left);
draw_img=draw_boundry(draw_img, pad_right);
draw_img=draw_boundry(draw_img, heel_right);
draw_img=draw_boundry(draw_img, heel_left);
end