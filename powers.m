function power = powers(N,p_elect)
powe = rand(1, N); 
powe = powe / sum(powe) ;
power =p_elect.*powe;
power =sort(power);
power =flip(power);
end