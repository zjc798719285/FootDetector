function rect_img=rectFilter(img,rect)
[h,w,c]=size(img);
up=round(h*rect(1));
down=round(h*(rect(1)+rect(4)));
left=round(w*rect(2));
right=round(w*(rect(2)+rect(3)));
img(1:up,:)=0;
img(down:h,:)=0;
img(:,1:left)=0;
img(:,right:w)=0;
rect_img=img;
end