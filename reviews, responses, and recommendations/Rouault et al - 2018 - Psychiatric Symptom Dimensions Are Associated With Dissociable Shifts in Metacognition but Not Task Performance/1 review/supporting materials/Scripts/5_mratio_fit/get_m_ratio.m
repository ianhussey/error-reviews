function M_ratio = get_m_ratio(individual_nR_S1, individual_nR_S2)

    % Because there can be zero values, adding a small constant is recommended
    % by the script for better fitting.
    individual_nR_S1_adj = individual_nR_S1 + 1/length(individual_nR_S1);
    individual_nR_S2_adj = individual_nR_S2 + 1/length(individual_nR_S2);
   
    m_ratio_fit = fit_meta_d_MLE(individual_nR_S1_adj, individual_nR_S2_adj);
    
    M_ratio = m_ratio_fit.M_ratio;
end