function ratio =rat(no_block_per_user)

for i =1:length(no_block_per_user)
    ratio(i) = ((no_block_per_user(1)/no_block_per_user(i)));
end
end