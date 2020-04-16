function  no_block= no_of_blocks_second(data_require)

for j =1:length(data_require)
no_block(j)= int16(data_require(j)/1*10^6);

end
end