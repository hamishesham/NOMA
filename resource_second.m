function no_blocks = resource_second(N,powerss)

gain_cahnnel_user = [9.998000299960010e-05 8.276120507951384e-05 6.967359797487697e-05 6.348852624897864e-05 5.745955448624539e-05 9.619230827834082e-05 9.536277519827666e-05 8.980693121262409e-05 8.816178917730188e-05 8.730715100608441e-05 8.462933636772388e-05 8.083783889049129e-05 7.225867078036243e-05 7.533896450405445e-05 6.554021387543831e-05 6.145453768543487e-05 5.795270614102107e-05 5.599213995777387e-05 5.795270614102107e-05 4.852137514079934e-05];%[2 61 85 101 113]
disp(length(gain_cahnnel_user))
R = [1*10^6 18*10^6];
P_opt = 20;
p_elect = P_opt ^ 2  ;
band_width = 10^6;
gain_cahnnel_user =sort(gain_cahnnel_user(1:N));  
[value,indx] = min(gain_cahnnel_user);
%power = [0.148833543740286 0.120640805049526 0.120471969394453 0.0884149398985707 0.0882978927455475 0.0858997082669201 0.0744285790448497 0.0669095038445164 0.0610354190325326 0.0424867354704991 0.0374224701736566 0.0352712410504979 0.0298871922881441];
%powers =p_elect.*power(1:N);
%powerss = powers(N,p_elect);
reource_block = 10^6 ;
no_resource = 100;
bandwidth_channel =10^6;
noise_density = 10^-14;

data_require= rand(N,1)*range(R)+min(R);
bandwidth = 128*10^3;
band_width_channel =10^6;

snr =sinr(gain_cahnnel_user,powerss,noise_density,band_width_channel);
for j =1:length(data_require)
no_block(j)= int32(real(data_require(j)/band_width));
end
total_block = sum(no_block);

if total_block > no_resource
no_blocks =length(blocks(no_block,no_resource));

else
    no_blocks = length(no_block);
    end
   

    end