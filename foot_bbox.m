function [draw_img,pad_left,pad_right,heel_left,heel_right]=foot_bbox(img)
[rect,rect_img]=foot_detector(img);
img=rectFilter(img,rect);
[pad_up,pad_down,heel_up,heel_down]=getPadHeel_v2(img);
pad=img(pad_up:pad_down,:);
heel=img(heel_up:heel_down,:);
[pad_left,pad_right]=boundry_search(pad,pad_up);
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