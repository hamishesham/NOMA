N =[3 4 5 6 7 8 9 10 11 12 13];
iterate = 50;
power = [5 10 15 20 25 30];
for i = 1:iterate
for q =1:length(N)


    x10(i,q)  = resource_second(N(q),powers(N(q),25));
    x20(i,q)  = resource_second(N(q),powers(N(q),100));
    x30(i,q)  = resource_second(N(q),powers(N(q),225));
    x40(i,q)  = resource_second(N(q),powers(N(q),400));
    x50(i,q)  = resource_second(N(q),powers(N(q),625));
    x60(i,q)  = resource_second(N(q),powers(N(q),900));

    %y(i,q) = resource_average(N(q),powers(N(q),10));
end
end
for n =1:length(N)
average_10(n) =int16(sum(x10(:,n))/iterate);
average_20(n) =int16(sum(x20(:,n))/iterate);
average_30(n) =int16(sum(x30(:,n))/iterate);
average_40(n) =int16(sum(x40(:,n))/iterate);
average_50(n) =int16(sum(x50(:,n))/iterate);
average_60(n) =int16(sum(x60(:,n))/iterate);

end

z = max(average_10);
z(end + 1) = max(average_20);
z(end + 1) = max(average_30);
z(end + 1) = max(average_40);
z(end + 1) = max(average_50);
z(end + 1) = max(average_60);



plot(power,z,'-o');
xlabel('power')
ylabel('no of serving user')


