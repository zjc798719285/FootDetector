function [pad_up,pad_down,heel_up,heel_down]=getPadHeel(img)
[h,~,~]=size(img);
[rect,rect_img]=foot_detector(img);
PadImg=img(1:round(h*(rect(1)+rect(4)/2)),:);
avgPad=mean(PadImg');
% figure(1)
% plot(avgPad)
P=polyfit(1:length(avgPad),avgPad,10);
avgVal=polyval(P,1:length(avgPad));
% figure(2)
% plot(avgVal)
[MaxVal,MaxInd]=getMaxima(avgVal);
[~,indMaxVal] = sort(MaxVal);
if length(indMaxVal)>=2
    pad_ind = MaxInd(max(indMaxVal(end-1:end)));
else
    pad_ind = indMaxVal;
end
pad_up=pad_ind-round(h*rect(4)*0.12);
pad_down=pad_ind+round(h*rect(4)*0.13);
heel_down=round((rect(1)+rect(4))*h);
heel_up=heel_down-round(rect(4)*h*0.2);
end