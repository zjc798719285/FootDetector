function [y,hashTab]=convexLine(padLeft, heelLeft, padRight, heelRight)
point=[padLeft;heelLeft;padRight;heelRight];
hashSeg=[length(padLeft),...
    length(padLeft)+length(heelLeft),...
    length(padLeft)+length(heelLeft)+length(padRight)];
dt=DelaunayTri(point(:,1),point(:,2));
hashTab=convexHull(dt);
ind1=max(hashTab(hashTab>=1 & hashTab<=hashSeg(1)));
ind2=min(hashTab(hashTab>hashSeg(1) & hashTab<=hashSeg(2)));
ind3=max(hashTab(hashTab>hashSeg(2) & hashTab<=hashSeg(3)));
ind4=min(hashTab(hashTab>hashSeg(3)));
if isempty(ind4)
    ind4=hashSeg(3);
end
y=[point(ind1,:);point(ind2,:);point(ind3,:);point(ind4,:)];
end