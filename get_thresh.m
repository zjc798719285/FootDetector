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