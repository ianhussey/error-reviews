function [m_ratios, bootstrapped_m_ratios] = compute_m_ratios(analyseddata)
    n_participants = size(analyseddata.analyseddata, 2);
    m_ratios = zeros(n_participants, 1);
    n_bootstrap = 10;
    bootstrapped_m_ratios = zeros(n_participants, n_bootstrap);
    for i = 1:n_participants
        
        % Extract data
        individual_cell_array = analyseddata.analyseddata(i);
        individual_struct = individual_cell_array{1,1};
        individual_dat = individual_struct.data;
        individual_struct.subjlabel;
        
        stimulus = individual_dat(:, 8); % (1 = left, 0 = right)
        correct = individual_dat(:, 6);
        confidence = individual_dat(:, size(individual_dat, 2));
        
        % Get observed M-Ratio
        [individual_nR_S1, individual_nR_S2] = tabulate_responses(stimulus, correct, confidence);
        m_ratio = get_m_ratio(individual_nR_S1, individual_nR_S2);
        m_ratios(i) = m_ratio;
    
        % Get bootstrapped M-Ratios
        for j = 1:n_bootstrap
            bootstrap_nR_S1 = bootstrap_response_vector(individual_nR_S1);
            bootstrap_nR_S2 = bootstrap_response_vector(individual_nR_S2);
            m_ratio = get_m_ratio(bootstrap_nR_S1, bootstrap_nR_S2);
            bootstrapped_m_ratios(i, j) = m_ratio;
        end
        disp("Done with participant " + i + " / " + n_participants)
    end
end