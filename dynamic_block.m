function no_of_user = sharing(N,p_opt)

R = [1*10^6 18*10^6];
data_require= rand(N,1)*range(R)+min(R);
x_cordinate = rand(N,1)*range([0 2.25]);
y_cordinate = rand(N,1)*range([0 2.25]);
data_require = flip(sort(data_require));
channel = gain(x_cordinate,y_cordinate);

no_resource = 100;

p_elect = p_opt^2;
power= zeros(1,length(data_require));


bandwidth_channel =10^6;
band_width =(11.138274769407617910357424084655)*(187 * (10^3) * (10^-14));
for j = 1:length(data_require)
    no_block(j) = int16(data_require(j) / bandwidth_channel) ;
    power(j) =p_elect /N;
end
power(1) = (band_width)/(0.64*(channel(1))^2);
[value,indx]= max(no_block(2:end));
[value_min,idx] = min(no_block(1:end-1));
if value == max(no_block) 
    power(2) = power(1);
    power(end)= power(end)+(power(end)-power(1));
else
    power(end)= power(end)+(power(end)-power(1));
if value_min == min(no_block)
    power(end)= power(end)+(power(end)-power(1));
    power(end - 1) = power(end);
end
end

[no_of_block,powers] = number_block(no_block,no_resource,power); %no_of_block and data_req
if length(powers)>0
for n = 1:length(powers)
power_users(n) = no_of_block(n) .* powers(n); 
end
else
    power_users =0;
end

power_users = sum(power_users);

no_of_user =length(power_optimiztion(no_of_block,powers,power_users,p_elect));

end