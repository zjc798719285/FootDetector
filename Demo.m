clc
clear
test_data='E:\PROJECT\Data_annotation\FootDetector\test_data\';
test_result='E:\PROJECT\Data_annotation\FootDetector\test_result\';
file_name=dir(test_data);
for i=3:length(file_name)
    i
    file_path=[test_data, file_name(i).name];
    file_out_path=[test_result, file_name(i).name];
    img=imread(file_path);
    try
        [draw_img,FP,lines,rect]=footDetector(img);
        ISCUT=isCutFoot(img,lines,rect);
        if ISCUT == 1
            draw_img(1:30,1:30)=255;
        end
        imwrite(draw_img, file_out_path);
    catch
        draw_img(1:30,1:30)=255;
    end
end
