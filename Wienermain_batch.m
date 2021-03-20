% loaded time course: TC1 and TC2. Detect whether TC1 was causally related to TC2. (TC1 to TC2)
function [d_KL,p,f_AR,f_JR,ks_estimation_range] = Wienermain_batch(TC_mat)
[l,n] = size(TC_mat);
d_KL = nan(n,n);
p = nan(n,n);
for i_series = 1:n
    for j_series = [1:(i_series-1),(i_series+1):n]
        fprintf('Calculating Wiener causality between series %.0f and %.0f ...\n',i_series,j_series)
        TC1 = TC_mat(:,i_series);
        TC2 = TC_mat(:,j_series);
        clear y_AR
        clear err_JR
        [d_KL(i_series,j_series),err_JR,y_AR,f_AR{i_series,j_series},f_JR{i_series,j_series},ks_estimation_range{i_series,j_series}] = WienerCausality(TC1,TC2);
        % bootstrap
        for i_bstp = 1:100
            TC2_sim = nan(l,1);    TC2_sim(1) = TC2(1);
            TC2_sim(2:l) = y_AR+err_JR(randsample(l-1,l-1,1));
            [d_KL_bstp(i_bstp),~,~] = WienerCausality(TC1,TC2_sim);
        end
        p(i_series,j_series) = sum(d_KL_bstp>d_KL(i_series,j_series))/100;
    end
end