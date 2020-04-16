gain_cahnnel_user = [9.998000299960010e-05 8.276120507951384e-05 6.967359797487697e-05 6.348852624897864e-05 5.745955448624539e-05 9.619230827834082e-05 9.536277519827666e-05 8.980693121262409e-05 8.816178917730188e-05 8.730715100608441e-05 8.462933636772388e-05 8.083783889049129e-05 7.225867078036243e-05 7.533896450405445e-05 6.554021387543831e-05 6.145453768543487e-05 5.795270614102107e-05 5.599213995777387e-05 5.795270614102107e-05 4.852137514079934e-05];%[2 61 85 101 113]
disp(length(gain_cahnnel_user))
R = [1*10^6 20*10^6];
P_opt = 20;
N =5 ;
p_elect = P_opt ^ 2  ;
power_mini = zeros(1,N);
for a = 1: N
    power_mini(a) =p_elect.* (1/ (N -2)) ;
end

 

reource_block = 10^6 ;
no_resource = 100;
bandwidth_channel =10^6;
noise_density = 10^-14;
%data_requirement =[4.210810559791382e+06 1.333319402417259e+07 1.490272532751474e+07 1.330717329958983e+07 9.567550422187954e+06];

gain_cahnnel_user = gain_cahnnel_user(1:N);
data_require= rand(N,1)*range(R)+min(R);
bandwidth = 128*10^3;
band_width_channel =10^6;

%----------------------------------------------------------
snr =sinr(gain_cahnnel_user,power_mini,noise_density,band_width_channel);
capacity_per_block = data(snr,bandwidth);
no_of_block = no_of_blocks_second(data_require);


%-------------------------------------------------------------
total_blocks = sum(no_of_block);





