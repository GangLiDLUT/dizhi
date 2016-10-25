clear;
load preMTL;
training_percent = 0.3;
[X_tr, Y_tr, X_te, Y_te] = mtSplitPerc(X, Y, training_percent);

nfeat = size(X_te{1},2);

lm=fitlm(X_tr{1},Y_tr{1});
w=lm.Coefficients.Estimate;
mse=mean(Y_te{1}-X_te{1}*w(2:nfeat+1)-w(1));
fprintf('lm :%.4f\n',mse);
