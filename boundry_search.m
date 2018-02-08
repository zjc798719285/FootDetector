function [left, right]=boundry_search(img, pos_h)
thresh=get_thresh(img);
left=zeros(1,2);
right=zeros(1,2);
[h,w]=size(img);
for i=1:h
    for j=1:w
        if img(i,j) >thresh
            left(i,1)=i+pos_h;
            left(i,2)=j;
            break
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:h
    for j=1:w
        if img(i,j) > thresh
            right(i,1)=i+pos_h;
            right(i,2)=j;
        end
    end
end
end