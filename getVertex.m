function point=getVertex(img,rect)
[h,w,~]=size(img);
upImg=img(round(rect(1)*h)+1:round(rect(1)*h)+300,:);
thresh=get_thresh(img);
for i=1:300
    for j=1:w
        if upImg(i,j)>=thresh
            point=[round(rect(1)*h)+i,j];
%             img(point(1)-5:point(1)+5,point(2)-5:point(2)+5)=255;
%             imshow(img)
            return;
        end
    end
end
end