% data prepare script
clear;
load processed

%% delve into the data

% look into label F
Fzero = (labs.F==0); fprintf('F label zero count:%d\n',sum(Fzero));
% look into label T
Tzero = (labs.T==0); fprintf('T label zero count:%d\n',sum(Tzero));
% look into label V
Vzero = (labs.V==0); fprintf('V label zero count:%d\n',sum(Vzero));

% summary of zero label
FTzero = Fzero & Tzero; fprintf('FT label zero count:%d\n',sum(FTzero));
FVzero = Fzero & Vzero; fprintf('FV label zero count:%d\n',sum(FVzero));
VTzero = Vzero & Tzero; fprintf('VT label zero count:%d\n',sum(VTzero));
FTVzero = Fzero & Tzero & Vzero; fprintf('FTV label zero count:%d\n',sum(FTVzero));

%% seperate data for diffent labels
%hist(labs.T(abs(labs.T)<100))
%hist(labs.F(abs(labs.F)<5000))
%hist(labs.V(abs(labs.V)<1)) 
% we found Vzero may be normal data, but Tzero and Fzero must be some
% outlier data
featF = feats(~Fzero,:);
labF = labs(~Fzero,:);
featT = feats(~Tzero,:);
labT = labs(~Tzero,:);
featV = feats;
labV = labs;
%% 参数对应表处理
fname = '../Data/参数对应表.csv';
fid = fopen(fname);
line = textscan(fid,'%s',1);
feat_meaning = strsplit(line{1}{1},',');
line = textscan(fid,'%s',1);
feat_token = strsplit(line{1}{1},',');
fclose(fid);
% hack!!!
% 缺失 PZDR % 数据中则缺失FRB4
feat_token{82}='PZDR';
feat_meaning{82}='右下注浆压力';
feat_meaning{32}='左下注浆压力';
%% 保存
save('prepared.mat','featF','featV','featT','labF','labT','labV','feat_meaning','feat_token');
