function ISCUT=isCutFoot(img,lines,rect)
CUT_THRESHOLD=300;
img=boundary_prop(img,0.02);
filtImg=convexFilter(img,lines);
filtImg=rectFilter(filtImg,rect);
cutFoot=img-filtImg;
thresh=get_thresh(img);
cutFootBw=im2bw(cutFoot,thresh/255);
cutFootBw=logical(cutFootBw);
stats = regionprops(cutFootBw,'Area');
area = cat(1,stats.Area);
if max(area)>CUT_THRESHOLD
    ISCUT=1;
else
    ISCUT=0;
end
    function filtImg=convexFilter(img,lines)
        lineLeft=lines{1};lineRight=lines{2};
        for i=1:length(lineLeft)
            img(i,1:lineLeft(i,2))=0;
            img(i,lineRight(i,2):end)=0;
        end
        filtImg=img;
    end
end

