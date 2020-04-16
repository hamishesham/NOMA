function  no_block= no_of_block(data_require)
band_width = 10^6;
for j =1:length(data_require)
no_block(j)= int32((data_require(j)/band_width));

end
end