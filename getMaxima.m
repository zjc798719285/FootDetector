function [val,index]=getMaxima(x)
d = diff(x);
n = length(d);
d1 = d(1:n-1);
d2 = d(2:n);
index = find(d1.*d2<0 & d1>0)+1;
val=x(index);
end