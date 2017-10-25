import sys
import os
import shutil

folder = sys.argv[1]
files = os.listdir(folder)
for file in files:
	if file == "temp":
		continue
	with open(folder + "/" + file) as f:
		lines = f.readlines()
		lines = [x.strip() for x in lines]
		if os.path.exists(folder + "/temp"):
			shutil.rmtree(folder + "/temp")
		os.makedirs(folder + "/temp")
		for line in lines:
			if line.split(",")[0] == 'id':
				filename = line.split(",")[1]
			with open(folder + "/temp/" + filename, 'a+') as tempFile:
				tempFile.write(line + "\n");
	games = os.listdir(folder + "/temp")
	for game in games:
		os.system("pig -D tez.counters.max=1000 -x tez_local -param input='{}' -param gameId='{}' -param year='{}' -f goThroughEachGame.pig".format(folder + "/temp/" + game, game, sys.argv[2]))
		break
	break
