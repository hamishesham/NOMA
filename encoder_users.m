n = 15;                % Code length
k = 11; 
beta_near = 0.3;
p = 4*10^-3;
beta_far = 0.7;

user_near = randi([0 1],k,1);
enc_user_near = encode(user_near,n,k,'hamming/binary');
csvwrite('D:\Codes\Data\user_near.csv',user_near)
csvwrite('D:\Codes\Data\enc_user_near.csv',enc_user_near)

user_far = randi([0 1],k,1);
enc_user_far = encode(user_far,n,k,'hamming/binary');
disp(user_far)
disp(enc_user_far)
csvwrite('D:\Codes\Data\user_far.csv',user_near)
csvwrite('D:\Codes\Data\enc_user_far.csv',enc_user_far)

all_data = (sqrt(p* beta_near)).*enc_user_near +  (sqrt(p* beta_far)).*enc_user_far;
csvwrite('D:\Codes\Data\all_data.csv',all_data)









