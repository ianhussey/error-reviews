% settings
erate1 = 9; % error percentage for rater 1
erate2 = 13; % error percentage for rater 2
ratings = 241; % number of ratings made (in this case, papers)
iterations = 10000; % for the simulation
error_options = 4; % how many different error values can raters realistically come up with
% preassign
both_wrong = zeros(iterations,1); % instances (out of the number of [iterations]) where both raters make ANY mistake
both_wrong_with_same_value = zeros(iterations,1); % instances (out of the number of [iterations]) where both raters make the SAME mistake

% iterate
for it = 1:iterations

    % make vectors with errors for rater 1
    errors1 = zeros(ratings,1); % start with a vector of zeros (1 x [ratings]), zero meaning no mistake
    randomorder = randperm(ratings); % generate a vector with the values from 1 to [ratings] in random order
    how_many_errors = round(ratings*erate1/100); % this is how many errors a rater with [erate1] would make in [ratings] amount of papers
    exemplars_with_errors = randomorder(1:how_many_errors); % select the first [how_many_errors] exemplars out of [randomorder], these are the error exemplars
    errors1(exemplars_with_errors,1) = ceil(error_options*rand([1 how_many_errors])); % insert error possibilities (from uniform distribution) into [errors1] at [exemplars_with_errors]

    % make vectors with errors for rater 2
    errors2 = zeros(ratings,1); % start with a vector of zeros (1 x [ratings]), zero meaning no mistake
    randomorder = randperm(ratings); % generate a vector with the values from 1 to [ratings] in random order
    how_many_errors = round(ratings*erate2/100); % this is how many errors a rater with [erate2] would make in [ratings] amount of papers
    exemplars_with_errors = randomorder(1:how_many_errors); % select the first [how_many_errors] exemplars out of [randomorder], these are the error exemplars
    errors2(exemplars_with_errors,1) = ceil(error_options*rand([1 how_many_errors])); % insert error possibilities (from uniform distribution) into [errors2] at [exemplars_with_errors]

    % identify instances where both raters made errors
    both_wrong(it,1) = sum(errors1 > 0 & errors2 > 0) > 0; % any mistake
    both_wrong_with_same_value(it,1) = sum(errors1 == errors2 & errors1 > 0); % same mistake (same non-zero value in [error1] and [error2])

end
% display
disp([['Number of instances of at least one paper where both raters made a mistake: ' num2str(sum(both_wrong>0))] ...
    ['/' num2str(iterations) '; ' num2str(100*sum(both_wrong>0)/iterations) '%']]);
disp([['Number of instances of at least one paper where both raters made the same mistake: ' num2str(sum(both_wrong_with_same_value>0))] ...
    ['/' num2str(iterations) '; ' num2str(100*sum(both_wrong_with_same_value>0)/iterations) '%']]);