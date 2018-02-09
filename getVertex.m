function point=getVertex(img,rect)
SEARCH_DEPTH=300;
[h,w,~]=size(img);
upImg=img(round(rect(1)*h)+1:round(rect(1)*h)+SEARCH_DEPTH,:);
thresh=get_thresh(img);
for i=1:SEARCH_DEPTH
    for j=1:w
        if upImg(i,j)>=thresh
            point=[round(rect(1)*h)+i,j];
            return;
        end
    end
end
end