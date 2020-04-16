function h = gain(x,y)
m = 1;
g = m /(sin(pi/6))^2;
FOV = 56;

radius = 1.5 *10^-2;
area = pi * radius^2;
for i = 1:length(x)
    distance(i) = sqrt(((x(i)-0.75)^2) + ((y(i)-0.75)^2));
end
for j =1:length(distance)
    if acos(3/(sqrt(distance(j)^2 +4 )))<= FOV
        h(j) =((m+1)*area*g * 4)/(2 * pi *(sqrt(distance(j)^2 + 4)^4));
    else
        h(j) = 0;
    end
    
end
end