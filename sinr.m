function snr =sinr(gain_cahnnel_user,power_mini,noise_density,band_width_channel)
for q =1:length(gain_cahnnel_user)
    snr(q) = 0.64 *(gain_cahnnel_user(q))^2*power_mini(q)/(noise_density * band_width_channel) ;
    snr(q)= 10* log10(snr(q));
end
end