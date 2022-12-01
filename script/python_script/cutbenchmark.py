start=0
with open("log.txt") as f:
    with open("log_cut.txt", "w") as f_out:
        for line in f:
            if "benchmark" in line and start==1:
                f_out.write(line)
                break
            if "benchmark" in line:
                start=1
            if start==1:
                f_out.write(line)

