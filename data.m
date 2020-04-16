function capacity_per_block = data(snr,bandwidth)
for i = 1:length(snr)
    capacity_per_block(i) = bandwidth * log2(1+snr(i));
    
end
end