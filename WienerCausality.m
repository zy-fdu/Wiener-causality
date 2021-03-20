function [d_KL,err_JR,y_AR,f_AR,f_JR,ks_estimation_range] = WienerCausality(TC1,TC2)
% parsing data

AR_train = TC2(1:end-1);
JR_train = [TC1(1:end-1),TC2(1:end-1)];
label = TC2(2:end);
% using Gaussian Regression to fit Auto-Regression and Joint-Regression model.
AR_mdl = fitrgp(AR_train,label);
JR_mdl = fitrgp(JR_train,label);
% giving predicted value and calculating the error term.
y_AR = predict(AR_mdl,AR_train);
err_AR = y_AR-label;
y_JR = predict(JR_mdl,JR_train);
err_JR = y_JR-label;
% mean and std estimation
miu1 = mean(err_JR);sigma1 = std(err_JR);
miu2 = mean(err_AR);sigma2 = std(err_AR);

d_KL = log(sigma2)-log(sigma1)+((sigma1^2+(miu1-miu2)^2)/(2*sigma2^2))-1/2;
% kernel density used for plot figures
x_min = min(min(err_AR),min(err_JR));
x_max = max(max(err_AR),max(err_JR));
ks_estimation_range = linspace(x_min,x_max,100);
[f_AR,~] = ksdensity(err_AR,ks_estimation_range);
[f_JR,~] = ksdensity(err_JR,ks_estimation_range);

if sum(f_JR==0)
    [~,x_JR] = ksdensity(err_JR);
    int_detect = min(x_JR)-ks_estimation_range;
    int_detect(int_detect<0) = Inf;
    [~,i_JR] = min(int_detect);
    f_JR(i_JR) = 1;
end

f_AR = f_AR/sum(f_AR);
f_JR = f_JR/sum(f_JR);

end
