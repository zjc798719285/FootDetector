function img = boundary_prop(img,BOUNDARY_RATE)
%BOUNDARY_RATE=0.02;
[r,c,~]=size(img);
b_r=round(r*BOUNDARY_RATE);
b_c=round(c*BOUNDARY_RATE);
img(1:b_r,:)=0;
img(r-b_r:r,:)=0;
img(:,1:b_c)=0;
img(:,c-b_c:c)=0;
end