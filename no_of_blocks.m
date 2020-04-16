function  no_block= no_of_blocks(capacity_per_block,data_require)

for j =1:length(capacity_per_block)
no_block(j)= int16(real(data_require(j)/capacity_per_block(j))) + 1;

end
end
