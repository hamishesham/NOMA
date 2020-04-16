function[power_users,no_blocks] =qam_user(snr,band_width,p_opt,data_require,channel,no_resource)
p_elect =p_opt^2;
for i =1:length(channel)
    power(i) =(band_width)/(0.64*(channel(i))^2);
end
for j = 1:length(data_require)
    no_block_per_user(j) = int16(data_require(j) /((0.2*10^6)*log2(1 +snr))) ;
end
[no_of_block,powers] = number_block(no_block_per_user,no_resource,power); %no_of_block and data_req
if length(powers)>0
for n = 1:length(powers)
power_users(n) = no_of_block(n) .* powers(n); 
end
else
    power_users =0;
end
power_user = sum(power_users);
no_blocks =power_optimiztion(no_of_block,powers,power_user,p_elect);
no_of_user =length(power_optimiztion(no_of_block,powers,power_user,p_elect));

end