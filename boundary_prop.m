function img = boundary_prop(img)
b_rate=0.07;
[r,c,l]=size(img);
b_r=round(r*b_rate);
b_c=round(c*b_rate);
img(1:b_r,:)=0;
img(r-b_r:r,:)=0;
img(:,1:b_c)=0;
img(:,c-b_c:c)=0;
end