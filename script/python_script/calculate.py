from itertools import count


times=0
with open("log.txt") as f:
    lines = f.readlines()
    for line in lines:
        times+=line.count("^")
print(times)