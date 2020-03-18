m = 1;
radius = 1*10^-2;
area = pi * radius^2;
FOV = 56;
P_opt = 20;
p_elect = P_opt ^ 2  ;
g = m /(sin(pi/6))^2;
recieved_power_near = p_elect * 0.2;
recieved_power_far =  p_elect * 0.8;
dimention = 150;
near_1 = 50;
near = 54;
far = 104;
far_1 = 100;
alpha = 0.7;
alpha_1 = 0.4;
band_width = 10^6;
noise_density = 10^-14;
M_ary = 64;
for d = 1:dimention
    distance(d) = d * 10^-2;
end

for i = 1:length(distance)
    if acos(3/(sqrt(distance(i)^2 + 4)))<= FOV
        h(i) =((m+1)*area*g * 4)/(2 * pi *(sqrt(distance(i)^2 + 4)^4));
    else
        h(i) = 0;
    end
    
end

h_next = h;            

powers =zeros(1,dimention);
for j = 1:dimention
    if j <= near_1
        powers(j) = recieved_power_near;
    elseif near_1 < j < far_1
            powers(j) = p_elect * 0.5 ;
            powers(far_1 + 1 :end) = recieved_power_far;
    end
end

for v = 1:20
   separate = h([130:end]);
   power_seprate = powers([130:end]);  
end



for q =1:length(h)
    if 1 < q < near
    snr(q) = 0.64 *(h(q))^2*powers(q)/(noise_density * band_width) ;

    elseif q == near
        snr(near) = (0.64 * powers(near) *(h(near)^2))/ (0.64 * powers(far) * h(far)^2*(1-alpha))+ (noise_density * band_width);
    
    elseif q == far
     snr(far) = (0.64 * powers(far) *(h(far)^2))/(powers(near) *(h(near)^2)*(1-alpha))+ (noise_density * band_width);
     disp((powers(near) *(h(near)^2)*(1-alpha)))
    elseif far < q < 130
        snr(q) = (0.64 *(h(q).^2) *powers(q))/((noise_density * band_width) + (powers(near) *(h(near)^2)*(1-alpha)));
    elseif q >=130
        snr(q) = 0.64 *(h(q)^2)*powers(q)/ (powers(near) *(h(near)^2 * (1- alpha))+ sum(((separate([1:end]).^2) .* power_seprate([1:end])))  + (noise_density * band_width));
    end
end

%%plot(snr)
%grid on
%set(gca,'xtick',[0:10:150])
ber = zeros(1,length(snr));


for b  = 1:length(snr)
    ber(b) = (2*(sqrt(M_ary)-1)/sqrt(M_ary)*log(M_ary)).* erfc(sqrt(3.*snr(b)*log(M_ary)/(2*(M_ary*1))));
end

subplot(2,1,1)
semilogy(ber)



