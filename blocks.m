function no_of_block= blocks(no_of_block,no_resource)
no_of_blocks = no_of_block;
for i = 1:20
    
if sum(no_of_block)> no_resource
    [value,id_x] = min(no_of_block);
    no_of_block(id_x)=[];
if sum(no_of_block) > no_resource
    blocks(no_of_block,no_resource)
else 
    no_of_block=no_of_block; 

end
[value_min,idx] = min(no_of_blocks);
    if sum(no_of_block) < no_resource
        unused_block = no_resource - sum(no_of_block) ;
        if value_min <= unused_block
            no_of_block(end + 1) = value_min;
        end
    end
end

        
end