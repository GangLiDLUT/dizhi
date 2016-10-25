clear;
load prepared

% use matrix in our program
featFmat = table2array(featF); labFmat = labF.F;
featTmat = table2array(featT); labTmat = labT.T;
featVmat = table2array(featV); labVmat = labV.V;

% meanfeatFmat = mean(featFmat); stdfeatFmat = std(featFmat);
% meanfeatTmat = mean(featTmat); stdfeatTmat = std(featTmat);
% meanfeatVmat = mean(featVmat); stdfeatVmat = std(featVmat);

X_F = zscore(featFmat);
X_T = zscore(featTmat);
X_V = zscore(featVmat);
Y_F = (labFmat);
Y_T = (labTmat);
Y_V = (labVmat);
% Y_F = standardize(labFmat);
% Y_T = standardize(labTmat);
% Y_V = standardize(labVmat);
X{1}=X_F;X{2}=X_T;X{3}=X_V;
Y{1}=Y_F;Y{2}=Y_T;Y{3}=Y_V;
save('preMTL.mat','X','Y');



