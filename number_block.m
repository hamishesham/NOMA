function [no_of_block powers]= number_block(no_of_block,no_resource,powers)
no_of_blocks = no_of_block;
for i = 1:20
    
if sum(no_of_block)> no_resource
    [value,id_x] = min(no_of_block);
    no_of_block(id_x)=[];
    powers(id_x) =[];
if sum(no_of_block) > no_resource
   number_block(no_of_block,no_resource,powers)
else 
    no_of_block = no_of_block;
    powers = powers ; 
end
end
end
end
