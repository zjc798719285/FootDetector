clc
clear
source_dir='E:\PROJECT\Foot_Height\data_Foot_Height\barefoot_standard\RCNN\V1.0.0.0\';
output_dir='E:\PROJECT\Foot_Height\data_Foot_Height\barefoot_standard\RCNN\KeyPoints\';
doc_name_struct=dir(source_dir);
file_path=[];file_output=[];
for i=3:1:length(doc_name_struct)
    doc_name=doc_name_struct(i).name;
    file_name=dir([source_dir,doc_name,'\*jpg']);
    mkdir([output_dir,doc_name])
    for j=1:length(file_name)
        file_path=[source_dir,doc_name,'\',file_name(j).name];
        img=imread(file_path);
        file_out_path=[output_dir,doc_name,'\',file_name(j).name];
        try
            [draw_img,FP,lines,rect]=footDetector(img);
            ISCUT=isCutFoot(img,lines,rect);
            if ISCUT ==0 
                 imwrite(draw_img, file_out_path);
            end
        catch
            
        end
    end
    i
end
