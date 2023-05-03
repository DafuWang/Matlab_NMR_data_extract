close all
clear
clc

Address_original_data=strcat('D:\大论文\投稿\后面要写的小论文\电导率测试水泥水化\nmr\重新反演\8','\');%原始数据存储位置
New_Address_original_data=strcat('D:\大论文\投稿\后面要写的小论文\电导率测试水泥水化\nmr\重新反演\80','\');
mkdir(New_Address_original_data)

folder = Address_original_data;
folder1 = New_Address_original_data;
old_ext='.Inv';
file_list = dir(fullfile(folder, strcat('*',old_ext)));
new_ext = '.txt';

for i = 1:length(file_list)
    old_name = file_list(i).name;
    new_name = strrep(old_name, old_ext, new_ext);
    copyfile(fullfile(folder, old_name),fullfile(folder1, new_name)); %  复制
end

file_list1 = dir(fullfile(folder1, strcat('*',new_ext)));
for i = 1:length(file_list1)
    txt_name = file_list1(i).name;
    txt_address=strcat(New_Address_original_data,txt_name);
    date=load(txt_address);

    if i==1
        date_x=date(:,1);
    end

    date_Y(:,i)=date(:,2);
    figure(1)
    semilogx(date_x,date_Y(:,i))
    hold on
end



































