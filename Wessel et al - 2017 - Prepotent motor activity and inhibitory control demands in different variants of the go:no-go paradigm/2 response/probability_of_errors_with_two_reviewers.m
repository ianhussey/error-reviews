% settings
erate1 = 9;
erate2 = 13;
ratings = 241;
iterations = 10000;
error_options = 4;
% preassign
both_wrong = zeros(iterations,1);
both_wrong_with_same_value = zeros(iterations,1);
% iterate
for it = 1:iterations

    errors1 = zeros(ratings,1); randomorder = randperm(ratings); errors1(randomorder(1:erate1)) = ceil(error_options*rand([1 erate1]));
    errors2 = zeros(ratings,1); randomorder = randperm(ratings); errors2(randomorder(1:erate2)) = ceil(error_options*rand([1 erate2]));
    
    both_wrong(it,1) = sum(errors1 > 0 & errors2 > 0) > 0;
    both_wrong_with_same_value(it,1) = sum(errors1 == errors2 & errors1 > 0);

end
% display
disp([['Number of instances of at least one paper where both raters made a mistake: ' num2str(sum(both_wrong>0))] ...
    ['/' num2str(iterations) '; ' num2str(100*sum(both_wrong>0)/iterations) '%']]);
disp([['Number of instances of at least one paper where both raters made the same mistake: ' num2str(sum(both_wrong_with_same_value>0))] ...
    ['/' num2str(iterations) '; ' num2str(100*sum(both_wrong_with_same_value>0)/iterations) '%']]);