% example written by crackhopper 
%ִ����convert_process�ű���,����ֱ�����д˽ű�.
%
% this is an example file for how to handle the data, using linear model
%
% this demo is written by using MATLAB machine learning toolbox
% http://cn.mathworks.com/solutions/machine-learning/
%
% the documentation about linear model see: help fitlm
clear
load processed

lm = fitlm(featsmat,labsmat(:,1));
lm