function [draw_img,FP,lines]=footDetector(img)
%FP:pad_left;heel_left;pad_right;heel_right
[~,rect,pad_left,pad_right,heel_left,heel_right]=getFootBoundary(img);
UPOINT=getVertex(img,rect);
[FP,~]=convexLine(pad_left, heel_left, pad_right, heel_right);
[DPOINT, ~]=getLVertex(img,FP);
FP=[FP;UPOINT;DPOINT];   %FP:foot key point
[draw_img,lines]=drawConvexLine(img,FP);
end