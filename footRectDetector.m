function [rect,draw_img]=footRectDetector(img)
[~,~,channel]=size(img);
if channel>1
    img=img(:,:,1);
end
img=boundary_prop(img);
[img_x,img_y]=size(img);
x1=img(1:fix(img_x/2),:);
x2=img(fix(img_x/2):end,:);
th1 = get_thresh(x1);
th2 = get_thresh(x2);
th_b = max(th1, th2);
th_r = min(th1, th2);
max_col = max(img); max_row = max(img');
max_col_b = max2b(max_col,th_b);
max_row_b = max2b(max_row,th_r);
key_col = search_point(max_col_b);
key_col = max_key(key_col);
key_row = search_point(max_row_b);
w = double((key_col(end)-key_col(1))/img_y);
h = double((key_row(end)-key_row(1))/img_x);
sc = double(key_col(1)/img_y);
sr = double(key_row(1)/img_x);
rect = [sr,sc,w,h];
draw_img = draw_rect(img, rect);
    function img = draw_rect(img,label)
        [r,c,l]=size(img);
        p_col = round(c*label(2));
        p_row = round(r*label(1));
        p_w = round(c*label(3));
        p_h = round(r*label(4));
        img(p_row,p_col:p_col+p_w) = 255;
        img(p_row+p_h,p_col:p_col+p_w) = 255;
        img(p_row:p_row+p_h,p_col) = 255;
        img(p_row:p_row+p_h,p_col+p_w) = 255;
    end
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
    function th=get_thresh(img)
        h=imhist(img);
        dh=diff(h);
        th1 = 5;
        for i=1:length(dh)-1
            if abs(dh(length(dh)-i))>2000
                th1=length(dh)-i+5;
                break;
            end
        end
        th2 = graythresh(img)*255/2;
        th = (th1 + th2)/2;
    end
    function y=max2b(x,threshold)
        for i=1:length(x)
            if x(i)>threshold
                x(i) = 1;
            else
                x(i) = 0;
            end
        end
        y=x;
    end
    function key_point=search_point(max_col_b)
        key_point=[];
        for i=1:length(max_col_b)-1
            if max_col_b(i)+max_col_b(i+1)==1
                key_point(end+1)=i;
            end
        end
        if length(key_point)<2
            key_point = [1,key_point,length(max_col_b)];
        end
    end
    function key=max_key(key_point)
        max_l=0;
        for i=1:length(key_point)-1
            LL=key_point(i+1)-key_point(i);
            if LL>max_l
                index=i;
                max_l=LL;
            end
        end
        key=[key_point(index),key_point(index+1)];
    end
end