function index=getImgSecPeak(img)
avgPad=mean(img');
P=polyfit(1:length(avgPad),avgPad,10);
avgVal=polyval(P,1:length(avgPad));
[MaxVal,MaxInd]=getMaxima(avgVal);
[~,indMaxVal] = sort(MaxVal);
if length(indMaxVal)>=2
    index = MaxInd(max(indMaxVal(end-1:end)));
else
    index = indMaxVal;
end
end