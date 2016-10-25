% for prediction of feature F
clear;
load prepared;

%% feature category
featureNames = featF.Properties.VariableNames;
machine_para_idx = arrayfun(@(n) isempty(n{1}),regexp(featureNames,'\d'));
geometry_para_idx = ~machine_para_idx;

%% feature zero count
featFmat=table2array(featF);
featureZeroCount = sum(featFmat==0);
% bar(featureZeroCount);

%% for machinary parameters
sel = (featureZeroCount > 10000) & machine_para_idx;
featuresManyZero = featF(:,sel);
    
for token = featuresManyZero.Properties.VariableNames
    t = token{:};
    fmat = table2array(featuresManyZero(:,t));
    fprintf('%s, %s, %d\n',t,getFeatMeaning(t,feat_meaning,feat_token),sum(fmat==0));
end

%% feature quntiles
ds=table2dataset(featF);
a=summary(ds);
b=[a.Variables(:).Data];
c=[b(:).Quantiles];

%% plot some geometrical feature
% 60, 51, 
featnum=55;
token = featF.Properties.VariableNames{featnum};
fprintf('%s,%s\n',token,getFeatMeaning(token,feat_meaning,feat_token));
plot(1:65981,featFmat(:,featnum));

