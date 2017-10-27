import sys
import os
import shutil

folder = sys.argv[1]
files = os.listdir(folder)
for file in files:
	if os.path.isdir(folder + "/" + file):
		continue
	with open(folder + "/" + file) as f:
		lines = f.readlines()
		lines = [x.strip() for x in lines]
		folderName = file.split(".")[0]
		if not os.path.exists(folder + folderName):
			os.makedirs(folder + folderName)
		for line in lines:
			if line.split(",")[0] == 'id':
				filename = line.split(",")[1]
			with open(folder + folderName + filename, 'a+') as tempFile:
				tempFile.write(line + "\n");
	continue
	games = os.listdir(folder + "/temp")
	for game in games:
		os.system("pig -D tez.counters.max=1000 -x tez_local -param input='{}' -param gameId='{}' -param year='{}' -f goThroughEachGame.pig".format(folder + "/temp/" + game, game, sys.argv[2]))
