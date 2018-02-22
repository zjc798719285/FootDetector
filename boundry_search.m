function [left, right]=boundry_search(img, pos_h)
thresh=get_thresh(img);
bwImg=im2bw(img, thresh/255);
bwImg=bwareaopen(bwImg, 200);
left=zeros(1,2);
right=zeros(1,2);
[h,w]=size(bwImg);
for i=1:h
    for j=1:w
        if bwImg(i,j) > 0
            left(i,1)=i+pos_h;
            left(i,2)=j;
            break
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:h
    for j=1:w
        if bwImg(i,j) > 0
            right(i,1)=i+pos_h;
            right(i,2)=j;
        end
    end
end
end