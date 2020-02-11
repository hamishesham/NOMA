import numpy 
import pandas as pd
import csv


def reading_data(file_name,numb,data_var):
    with open(file_name, 'r') as csvfile:
        globals()['string%s' % numb]= []
        for row in csv.reader(csvfile, delimiter=';'):
            if numb == 'all_data':
                globals()['string%s' % numb].append(float(row[0]))
            else:
                globals()['string%s' % numb].append(int(row[0]))            
    # print(str(data_var) +"_user_"+str(numb) + " =",globals()['string%s' % numb])
    return globals()['string%s' % numb]

def threshold_reciever(data,typing):
    threshold_all = max(data)
    threshold_near = min(filter(lambda i: i > 0, data))  
    threshold_far = threshold_all - threshold_near    
    if typing == "non_zero":  
        data =[1 if y > 0 else 0 for y in data]
    elif typing == "ones":
        data =[1 if y == threshold_all else 0 for y in data]
    elif typing == "near": #user far decoding
        data =[1 if y > threshold_near else 0 for y in data]    
    return(data)

 
           
        
def main():   
    data_user_near = reading_data("D:\\Codes\\Data\\user_near.csv",1,"data")
    data_user_far = reading_data("D:\\Codes\\Data\\user_far.csv",2,"data")
    encoding_user_near  = reading_data("D:\\Codes\\Data\\enc_user_near.csv",1,"encoding")
    encoding_user_far = reading_data("D:\\Codes\\Data\\enc_user_far.csv",2,"encodeing")
    all_data_transmitted = reading_data("D:\\Codes\\Data\\all_data.csv","all_data","transmitted")
    data_ones = threshold_reciever(all_data_transmitted,"ones")
    data_far = threshold_reciever(all_data_transmitted,"non_zero")
    data_near = threshold_reciever(all_data_transmitted,"near")
    data = []
    for i in range(len(data_ones)):
        data.append(data_ones[i] + data_far[i] - data_near[i])

if __name__ == "__main__" :
    main()