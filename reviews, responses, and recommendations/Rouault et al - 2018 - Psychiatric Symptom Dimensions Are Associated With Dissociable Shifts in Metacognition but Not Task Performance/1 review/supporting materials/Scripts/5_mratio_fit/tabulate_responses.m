function [individual_nR_S1, individual_nR_S2] = tabulate_responses(stimulus, correct, confidence)

    % We extract the responses
    %
    % -5 = "absolutely certain the target was left"
    % ...
    % -1 = "uncertain, maybe the target was left"
    % +1 = "uncertain, maybe the target was right"
    % ...
    % +5 = "absolutely certain the target was right"\
    %
    % by choosing the stimulus direction as a baseline (-1 = left, +1 = right),
    % invert the response if it was incorrect and then scale it by the
    % confidence bin.
    response = (2*(-stimulus)+1) .* (2*correct-1) .* confidence;
    
    % Tabulate number of responses for each stimulus
    individual_nR_S1 = []; % Left stimulus
    individual_nR_S2 = []; % Right stimulus
    response_bins = [-5:-1, +1:+5];
    for i_response_bin = 1:size(response_bins, 2)
        response_bin = response_bins(i_response_bin);
        individual_nR_S1(i_response_bin) = sum(stimulus == 1 & response == response_bin);
        individual_nR_S2(i_response_bin) = sum(stimulus == 0 & response == response_bin);
    end
end