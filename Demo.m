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
   [draw_img,FP]=FootPointSearch(img);
   imwrite(draw_img, file_out_path); 
end
