clear all;
N =[3 4 5 6 7 8 9 10 11 12 13];
iterate = 450;
power =[5 10 15 20 25 30 40 50];
for q =1:length(N)
for i = 1:iterate
    x_1(i,q) =sharing(N(q),5);
    x_2(i,q) =sharing(N(q),10);
    x_3(i,q) =sharing(N(q),15);
    x_4(i,q) =sharing(N(q),20);
    x_5(i,q) =sharing(N(q),25);
    x_6(i,q) =sharing(N(q),30);
    x_7(i,q) =sharing(N(q),40);
    x_8(i,q) =sharing(N(q),50);
    y_1(i,q) =sharing_1(N(q),5);
    y_2(i,q) =sharing_1(N(q),10);
    y_3(i,q) =sharing_1(N(q),15);
    y_4(i,q) =sharing_1(N(q),20);
    y_5(i,q) =sharing_1(N(q),25);
    y_6(i,q) =sharing_1(N(q),30);
    y_7(i,q) =sharing_1(N(q),40);
    y_8(i,q) =sharing_1(N(q),50);
    x_11(i,q) =proportional_fairness(N(q),5);
    x_21(i,q) =proportional_fairness(N(q),10);
    x_31(i,q) =proportional_fairness(N(q),15);
    x_41(i,q) =proportional_fairness(N(q),20);
    x_51(i,q) =proportional_fairness(N(q),25);
    x_61(i,q) =proportional_fairness(N(q),30);
    x_71(i,q) =proportional_fairness(N(q),40);
    x_81(i,q) =proportional_fairness(N(q),50);
    y_11(i,q) =resource_average(N(q),5);
    y_21(i,q) =resource_average(N(q),10);
    y_31(i,q) =resource_average(N(q),15);
    y_41(i,q) =resource_average(N(q),20);
    y_51(i,q) =resource_average(N(q),25);
    y_61(i,q) =resource_average(N(q),30);
    y_71(i,q) =resource_average(N(q),40);
    y_81(i,q) =resource_average(N(q),50);
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

average_111(n) =int16(sum(x_11(:,n))/iterate);
average_211(n) =int16(sum(x_21(:,n))/iterate);
average_311(n) =int16(sum(x_31(:,n))/iterate);
average_411(n) =int16(sum(x_41(:,n))/iterate);
average_511(n) =int16(sum(x_51(:,n))/iterate);
average_611(n) =int16(sum(x_61(:,n))/iterate);
average_711(n) =int16(sum(x_71(:,n))/iterate);
average_811(n) =int16(sum(x_81(:,n))/iterate);

average_1111(n) =int16(sum(y_11(:,n))/iterate);
average_2111(n) =int16(sum(y_21(:,n))/iterate);
average_3111(n) =int16(sum(y_31(:,n))/iterate);
average_4111(n) =int16(sum(y_41(:,n))/iterate);
average_5111(n) =int16(sum(y_51(:,n))/iterate);
average_6111(n) =int16(sum(y_61(:,n))/iterate);
average_7111(n) =int16(sum(y_71(:,n))/iterate);
average_8111(n) =int16(sum(y_81(:,n))/iterate);
end

z = max(average_1);
z(end + 1) = max(average_2);
z(end + 1) = max(average_3);
z(end + 1) = max(average_4);
z(end + 1) = max(average_5);
z(end + 1) = max(average_6);
z(end + 1) = max(average_7);
z(end + 1) = max(average_8);


q = max(average_11);
q(end + 1) = max(average_21);
q(end + 1) = max(average_31);
q(end + 1) = max(average_41);
q(end + 1) = max(average_51);
q(end + 1) = max(average_61);
q(end + 1) = max(average_71);
q(end + 1) = 7;

a = max(average_111);
a(end + 1) = max(average_211);
a(end + 1) = max(average_311);
a(end + 1) = max(average_411);
a(end + 1) = max(average_511);
a(end + 1) = max(average_611);
a(end + 1) = max(average_711);
a(end + 1) = max(average_811);
m= max(average_1111);
m(end + 1) = max(average_2111);
m(end + 1) = max(average_3111);
m(end + 1) = max(average_4111);
m(end + 1) = max(average_5111);
m(end + 1) = max(average_6111);
m(end + 1) = max(average_7111);
m(end + 1) = max(average_8111);

grid on
hold on 
plot(power,q,'-o')
plot(power,z,'-x')
plot(power,a,'-*')
plot(power,m,'-D')
xlabel('power')
ylabel('no of served user')
legend('sharing type 1','sharing type 2','proportional','max-min')



hold off
