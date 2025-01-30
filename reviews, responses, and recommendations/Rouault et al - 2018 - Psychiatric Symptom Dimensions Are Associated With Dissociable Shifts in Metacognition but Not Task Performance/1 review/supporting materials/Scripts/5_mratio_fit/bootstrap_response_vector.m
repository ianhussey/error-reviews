function bootstrap_nR = bootstrap_response_vector(nR)

    % Create pseudo-population
    values = 1:length(nR);
    population = repelem(values, nR); 

    % Sample from it with replacement
    n_samples = length(population);
    sampled_population = randsample(population, n_samples, true);

    % Compile counts
    bootstrap_nR = histcounts(sampled_population, [values, max(values)+1]);

end