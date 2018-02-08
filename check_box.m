function box2=check_box(box)
box2=[];
[L,~]=size(box);
for i=1:L
    if box(i,1)>0 & box(i,2)>0
        box2(end+1,:)=box(i,:);
    end
end
end