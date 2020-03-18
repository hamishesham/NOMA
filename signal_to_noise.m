m = 1;
radius = 1*10^-2;
area = pi * radius^2;
FOV = 56;
P_opt = 10;
p_elect = P_opt ^ 2  ;
g = m /(sin(pi/6))^2;
recieved_power_near = p_elect * 0.2;
recieved_power_far =  p_elect * 0.8;
dimention = 150;
near = 50;
far = 120;
alpha = 0.7;
alpha_1 = 0.4;
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
    if j <= near
        powers(j) = recieved_power_near;
    elseif near < j < far
            powers(j) = p_elect * 0.5 ;
            powers(far + 1 :end) = recieved_power_far;
    end
end

for v = 1:20
   separate = h([130:end]);
   power_seprate = powers([130:end]);  
end



for q =1:length(h)
    snr(q) = 0.64 *(h(q)^2)*powers(q)/((0.64 * sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end]))) + 10.^-14);
    snr_1(q) = 0.64 *(h(q)^2)*powers(q)/((0.64 * sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end]))) + 10.^-14);
    if q == near
        snr(near) = 0.64 * powers(near) *(h(near)^2)/((0.64 * sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end])))+ (powers(far) *(h(far)^2)*(1-alpha))+ 10.^-14)
            domentatnt_3 = (powers(far) *(h(far)^2)*(1-0.7));
        snr_1(near) = 0.64 * powers(near) *(h(near)^2)/((0.64 * sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end])))+ (powers(far) *(h(far)^2)*(1-alpha_1))+ 10.^-14)

    elseif q == far
     snr(far) = 0.64 * powers(far) *(h(far)^2)/((0.64 * sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end])))+ (powers(near) *(h(near)^2)*(1-alpha))+ 10.^-14)
    domentat_4 = (powers(near) *(h(near)^2)*(1-0.7));
     snr_1(far) = 0.64 * powers(far) *(h(far)^2)/((0.64 * sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end])))+ (powers(near) *(h(near)^2)*(1-alpha_1))+ 10.^-14)

    elseif q >=130
        snr(q) = 0.64 *(h(q)^2)*powers(q)/((0.64 * (sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end]))) + sum(((separate([1:end]).^2) .* power_seprate([1:end])))  )+ 10.^-14);
        snr_1(q) = 0.64 *(h(q)^2)*powers(q)/((0.64 * (sum((h([1:q-1, q+1:end]).^2) .* powers([1:q-1, q+1:end]))) + sum(((separate([1:end]).^2) .* power_seprate([1:end])))  )+ 10.^-14);

    end
        
        domenatn_1(q) =0.64 * (sum((h([1:q-1, q+1:end]).^2.* powers([1:q-1, q+1:end]))));
        domentant_2(q) =sum(((separate([1:end]).^2) .* power_seprate([1:end]))) ;
        domentatnt_3(q) = (powers(far) *(h(far)^2)*(1-0.7))
end
hold on

plot(snr_1,'r')

plot(snr,'b')
grid on
set(gca,'xtick',[0:10:150])

hold off


