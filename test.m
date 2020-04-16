clear all;
N =[3 4 5 6 7 8 9 10 11 12 13];
iterate = 1000;
power =linspace(1,25,25);
for j =1:length(power)
for c =1:length(N)
for i = 1:iterate
    x_1(i,c,j) =sharing(N(c),power(j));
    y_1(i,c,j) =sharing_1(N(c),power(j));
    x_11(i,c,j) =proportional_fairness(N(c),power(j));
    y_11(i,c,j) =resource_average(N(c),power(j));
end
end
end
for j =1:length(power)
for n =1:length(N)
average_1(n,j) =int16(sum(x_1(:,n,j))/iterate);
average_2(n,j) =int16(sum(y_1(:,n,j))/iterate);
average_3(n,j) =int16(sum(x_11(:,n,j))/iterate);
average_4(n,j) =int16(sum(y_11(:,n,j))/iterate);
end 
end
for j =1:length(power)
    z(j) =max(average_1(:,j)) ;
    a(j) = max(average_2(:,j));
    s(j) = max(average_3(:,j));
    m(j) = max(average_4(:,j));
end
grid on
hold on 
plot(power,z,'-o')
plot(power,a,'-x')
plot(power,s,'-*')
plot(power,m,'-D')
xlabel('power')
ylabel('throughput')
legend('sharing ratio ','sharing','proportional','max-min')



hold off

