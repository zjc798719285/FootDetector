function draw_img=draw_boundry(img, boundry)
for i=1:length(boundry)
    img(boundry(i,1),boundry(i,2))=255;
end
draw_img=img;
end