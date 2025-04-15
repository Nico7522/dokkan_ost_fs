import csv
mypath = "E:\\DEV\\CPK\\CPK-Extract\\bin\\Release\\net8.0-windows10.0.22621.0\\effect"
import os
all_file = os.listdir(mypath)
import time
import shutil

with open('filename.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        name = ', '.join(row)[1:-1]
        for f in all_file:
            if f == name:
                print('fichier en commun ', name)
                shutil.copytree(f'{mypath}/{name}', f'./remaining_copy/{name}')
                time.sleep(2)




    
