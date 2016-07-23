% converter written by crackhopper
%使用方式: 设置对你的data_dir变量,然后运行此脚本.
%运行结果:
% 数据保存在processed.mat文件中.
% feats是特征,labs是预测值,共66067个数据
%
% this file is used to convert csv file into matlab .mat datafile 
% so that we can load directly into matlab.
% 
% the data is converted into matlab table format and matrix format
% http://cn.mathworks.com/help/matlab/matlab_prog/create-a-table.html
%
clear
data_dir = '../Data/输入（运行+地质参数）-输出（FTV）/';

feat_file=[data_dir,'INPUT.csv'];
lab_file=[data_dir,'OUTPUT.csv'];

% read features
fid = fopen(feat_file);
line = textscan(fid,'%s',1);
feat_head = strsplit(line{1}{1},',');
fclose(fid);
featsmat = csvread(feat_file,1,0);
feats = array2table(featsmat,'VariableNames',feat_head(:));

% read the label data(FTV)
fid = fopen(lab_file);
line = textscan(fid,'%s %s %s %*s %*s %*s',1,'Delimiter',',');
lab_head = [line{:}];
labsmat = cell2mat(textscan(fid,'%f %f %f %*s %*s %*s','Delimiter',','));
fclose(fid);
labs = array2table(labsmat,'VariableNames',lab_head(:));

README='数据文件中,feats是特征,labs是预测值,_head代表对应的编号,共66067个数据';
save('processed.mat','feats','featsmat','labs','labsmat','README');

clear;

