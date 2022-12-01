event_time= 0.00
with open('log.txt') as f:
    for line in f:
        word=line.split()
        if word[0]=='cudaMemcpyAsync:':
            if float(word[1])<1 and float(word[1])>0:
                event_time+=float(word[1])
            # print(event_time)
print(event_time)