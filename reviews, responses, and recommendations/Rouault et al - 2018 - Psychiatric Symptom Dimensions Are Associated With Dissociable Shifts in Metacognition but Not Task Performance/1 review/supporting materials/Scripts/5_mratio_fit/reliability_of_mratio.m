%% Experiment 1
disp("Evaluating M-Ratios in Experiment 1")

analyseddata1 = load("../../Input/RouaultSeowGillanFleming-master/ME_phase1_excludanalyseddat_all.mat");

[m_ratios, bootstrapped_m_ratios] = compute_m_ratios(analyseddata1);
writematrix(m_ratios, 'exp_1_m_ratios.csv');
writematrix(bootstrapped_m_ratios, 'exp_1_bootstrapped_m_ratios.csv');

%% Experiment 2
disp("Evaluating M-Ratios in Experiment 2")

analyseddata2 = load("../../Input/RouaultSeowGillanFleming-master/ME_phase2_excludanalyseddat_all.mat");

[m_ratios, bootstrapped_m_ratios] = compute_m_ratios(analyseddata2);
writematrix(m_ratios, 'exp_2_m_ratios.csv');
writematrix(bootstrapped_m_ratios, 'exp_2_bootstrapped_m_ratios.csv');