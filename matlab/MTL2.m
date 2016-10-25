clear;
load preMTL;

% preprocessing data
for t = 1: length(X)
    X{t} = [X{t} ones(size(X{t}, 1), 1)]; % add bias. 
end

% split data into training and testing.
training_percent = 0.3;
[X_tr, Y_tr, X_te, Y_te] = mtSplitPerc(X, Y, training_percent);

% the function used for evaluation.
eval_func_str = 'eval_MTL_mse';
higher_better = false;  % mse is lower the better.

% cross validation fold
cv_fold = 5;

% optimization options
opts = [];
opts.maxIter = 1e5;


% build model using the optimal parameter 
W = Least_Lasso(X_tr, Y_tr, 0, opts);

% show final performance
X1=X_te{1};
Y1=Y_te{1};
W1=W(:,1);
mse=std(Y1-X1*W1);
fprintf('mtl:%.4f\n',mse);

nfeat = size(X1,2);
lm=fitlm(X_tr{1}(:,1:nfeat-1),Y_tr{1});
w=lm.Coefficients.Estimate;
mse=std(Y1-X1(:,1:nfeat-1)*w(2:nfeat)-w(1));
fprintf('lm :%.4f\n',mse);

fprintf('zero w: %d\n',size(w,1)-nnz(w));