clear;
load preMTL;

lambda = [1 10 100 200 500 1000 2000];

%rng('default');     % reset random generator. Available from Matlab 2011.
opts.init = 0;      % guess start point from data. 
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
opts.tol = 10^-5;   % tolerance. 
opts.maxIter = 1500; % maximum iteration number of optimization.

sparsity = zeros(length(lambda), 1);
log_lam  = log(lambda);

for i = 1: length(lambda)
    [W, funcVal] = Least_Lasso(X, Y, lambda(i), opts);
    % set the solution as the next initial point. 
    % this gives better efficiency. 
    opts.init = 1;
    opts.W0 = W;
    sparsity(i) = nnz(W);
end

% draw figure
h = figure;
plot(log_lam, sparsity);
xlabel('log(\rho_1)')
ylabel('Sparsity of Model (Non-Zero Elements in W)')
title('Sparsity of Predictive Model when Changing Regularization Parameter');
set(gca,'FontSize',12);
print('-dpdf', '-r100', 'LeastLassoExp');