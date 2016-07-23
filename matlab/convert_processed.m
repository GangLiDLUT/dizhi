% converter written by crackhopper
%ʹ�÷�ʽ: ���ö����data_dir����,Ȼ�����д˽ű�.
%���н��:
% ���ݱ�����processed.mat�ļ���.
% feats������,labs��Ԥ��ֵ,��66067������
%
% this file is used to convert csv file into matlab .mat datafile 
% so that we can load directly into matlab.
% 
% the data is converted into matlab table format and matrix format
% http://cn.mathworks.com/help/matlab/matlab_prog/create-a-table.html
%
clear
data_dir = '../Data/���루����+���ʲ�����-�����FTV��/';

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

README='�����ļ���,feats������,labs��Ԥ��ֵ,_head�����Ӧ�ı��,��66067������';
save('processed.mat','feats','featsmat','labs','labsmat','README');

clear;

