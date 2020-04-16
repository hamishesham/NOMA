no_of_block =[6 13 25 50 75 100];
N =[3 4 5 6 7 8 9 10 11 12 13];
iterate = 100;
for q =1:length(N)

for i = 1:iterate
    x_6(i,q)  = resource_second(N(q),no_of_block(1));
    x_13(i,q)  = resource_second(N(q),no_of_block(2));
    x_25(i,q)  = resource_second(N(q),no_of_block(3));
    x_50(i,q)  = resource_second(N(q),no_of_block(4));
    x_75(i,q)  = resource_second(N(q),no_of_block(5));
    x_100(i,q)  = resource_second(N(q),no_of_block(6));
end
end
for n =1:length(N)
average_6(n) =int16(sum(x_6(:,n))/iterate);
average_13(n) =int16(sum(x_13(:,n))/iterate);
average_25(n) =int16(sum(x_25(:,n))/iterate);
average_50(n) =int16(sum(x_50(:,n))/iterate);
average_75(n) =int16(sum(x_75(:,n))/iterate);
average_100(n) =int16(sum(x_100(:,n))/iterate);
end

z = max(average_6);
z(end + 1) = max(average_13);
z(end + 1) = max(average_25);
z(end + 1) = max(average_50);
z(end + 1) = max(average_75);
z(end + 1) = max(average_100);

plot(no_of_block,z);
xlabel('no_of block')
ylabel('no of serving user')
