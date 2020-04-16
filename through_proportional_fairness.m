function throughput = through_proportional_fairness(N,p_opt)
R = [1*10^6 18*10^6];
data_require= rand(N,1)*range(R)+min(R);
x_cordinate = rand(N,1)*range([0 2.25]);
y_cordinate = rand(N,1)*range([0 2.25]);
channel = flip(sort(gain(x_cordinate,y_cordinate)));
p_elect = p_opt^2;
no_resource =100;
bandwidth_channel =10^6;
band_width =(11.138274769407617910357424084655)*(187 * (10^3) * (10^-14));
for i =1:length(channel)
    power(i) =(band_width)/(0.64*(channel(i))^2);
end
for j = 1:length(data_require)
    no_block_per_user(j) = int16(data_require(j) / bandwidth_channel) ;
end
[no_of_block,powers] = number_block(no_block_per_user,no_resource,power); %no_of_block and data_req
if length(powers)>0
for n = 1:length(powers)
power_users(n) = no_of_block(n) .* powers(n); 
end
else
    power_users =0;
end

power_users = sum(power_users);
throughput =length(power_optimiztion(no_of_block,powers,power_users,p_elect));
end