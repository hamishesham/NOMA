N =[3 4 5 6 7 8 9 10 11 12 13];
iterate = 50;
power =[5 10 15 20 25 30 40 50];
for q =1:length(N)
for i = 1:iterate
    x_1(i,q) =proportional_fairness(N(q),5);
    x_2(i,q) =proportional_fairness(N(q),10);
    x_3(i,q) =proportional_fairness(N(q),15);
    x_4(i,q) =proportional_fairness(N(q),20);
    x_5(i,q) =proportional_fairness(N(q),25);
    x_6(i,q) =proportional_fairness(N(q),30);
    x_7(i,q) =proportional_fairness(N(q),40);
    x_8(i,q) =proportional_fairness(N(q),50);
    y_1(i,q) =resource_average(N(q),5);
    y_2(i,q) =resource_average(N(q),10);
    y_3(i,q) =resource_average(N(q),15);
    y_4(i,q) =resource_average(N(q),20);
    y_5(i,q) =resource_average(N(q),25);
    y_6(i,q) =resource_average(N(q),30);
    y_7(i,q) =resource_average(N(q),40);
    y_8(i,q) =resource_average(N(q),50);

end
end

for n =1:length(N)
average_1(n) =int16(sum(x_1(:,n))/iterate);
average_2(n) =int16(sum(x_2(:,n))/iterate);
average_3(n) =int16(sum(x_3(:,n))/iterate);
average_4(n) =int16(sum(x_4(:,n))/iterate);
average_5(n) =int16(sum(x_5(:,n))/iterate);
average_6(n) =int16(sum(x_6(:,n))/iterate);
average_7(n) =int16(sum(x_7(:,n))/iterate);
average_8(n) =int16(sum(x_8(:,n))/iterate);

average_11(n) =int16(sum(y_1(:,n))/iterate);
average_21(n) =int16(sum(y_2(:,n))/iterate);
average_31(n) =int16(sum(y_3(:,n))/iterate);
average_41(n) =int16(sum(y_4(:,n))/iterate);
average_51(n) =int16(sum(y_5(:,n))/iterate);
average_61(n) =int16(sum(y_6(:,n))/iterate);
average_71(n) =int16(sum(y_7(:,n))/iterate);
average_81(n) =int16(sum(y_8(:,n))/iterate);


end

z = max(average_1);
z(end + 1) = max(average_2);
z(end + 1) = max(average_3);
z(end + 1) = max(average_4);
z(end + 1) = max(average_5);
z(end + 1) = max(average_6);
z(end + 1) = max(average_7);
z(end + 1) = max(average_8);

q =max(average_11);

q(end + 1) =max(average_21);
q(end + 1) =max(average_31);
q(end + 1) =max(average_41);
q(end + 1) =max(average_51);
q(end + 1) =max(average_61);
q(end + 1) =max(average_71);
q(end + 1) =max(average_81);


hold on 

plot(power,z,'-o')
plot(power,q,'-o')
xlabel('power')
ylabel('served users')
legend('propational fairness','max-min')

hold off