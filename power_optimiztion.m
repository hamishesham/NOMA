function no_of_block = power_optimiztion(no_of_block,powers,power_users,pow_elect)
for i = 1:3 
if power_users > pow_elect
    [value,indx] = max(powers);
    powers(indx) = [];
    no_of_block(indx) = [];
if sum(powers) > pow_elect
        power_optimiztion(no_of_block,powers,sum(powers),pow_elect);
        
else
     no_of_block = no_of_block;

end
end
 
end   
end