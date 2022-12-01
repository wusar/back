
sum=0
with open('log_cut.txt') as f:
    lines=f.readlines()
    for line in lines:
        if len(line.split())>3:
            if line.split()[3]=='ncclProxyGetPostedOps':
                sum+=float(line.split()[-1])
print('ncclProxyGetPostedOps time:',sum)

sum=0
with open('log_cut.txt') as f:
    lines=f.readlines()
    for line in lines:
        if len(line.split())>3:
            if line.split()[3]=='progressOps':
                sum+=float(line.split()[-1])
print('progressOps time:',sum)

sum=0
with open('log_cut.txt') as f:
    lines=f.readlines()
    for line in lines:
        if len(line.split())>3:
            if line.split()[3]=='while':
                sum+=float(line.split()[-1])
print('while loop time:',sum)
