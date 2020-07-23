import json
import sys
import os

### Read File Name Arguments ###
file1 = str(sys.argv[1])
file2 = str(sys.argv[2])
file1 = file1.replace(os.path.sep,'/')
file2 = file2.replace(os.path.sep,'/')
f_name = file1.split('/')
tile_name = f_name[len(f_name)-1].strip("_stats.txt")

### Open Metadata File for Each Tile ###
with open(file1) as f:
	data = json.load(f)
	f_return = (data["stages"]["filters.stats"]["statistic"][0]["counts"][0]).split("/") #### First Return
	t_returns = (data["stages"]["filters.stats"]["statistic"][0]["count"]) #### Total Returns
	class1 = '0'
	class2 = '0'
	class7 = '0'
	class8 = '0'
	class18 = '0'
	n = len(data["stages"]["filters.stats"]["statistic"][1]["counts"])
	for i in range(n):
		x = (data["stages"]["filters.stats"]["statistic"][1]["counts"][i]).split("/")
		if x[0].strip(".0") == '1': ### Class 1
			class1 = x[1]
		elif x[0].strip(".0") == '2': ### Class 2
			class2 = x[1]
		elif x[0].strip(".0") == '7': ### Class 7
			class7 = x[1]
		elif x[0].strip(".0") == '8': ### Class 8
			class8 = x[1]
		elif x[0].strip(".0") == '18': ### Class 18
			class18 = x[1]

### Append Metadata ###
with open (file2,'a') as dfile:
	dfile.write(tile_name + ' ' + f_return[1] + ' ' + str(t_returns) + ' ' + class1 + ' ' + class2 + ' ' + class7 + ' ' + class8 + ' ' + class18 + ' ' +'\n')