import sys

disc_fn = sys.argv[1]

same = 0
diff = 0
total = 0

with open(disc_fn) as f, open(disc_fn + '_same', 'w') as fsame, open(disc_fn + '_diff', 'w') as fdiff:
    for line in f:
        total += 1
        items = line.strip().split()
        speaker1 = items[1].split('_')[0]
        speaker2 = items[2].split('_')[0]

        if speaker1 == speaker2:
            same += 1
            fsame.write(line)
        else:
            diff += 1
            fdiff.write(line)

print("Total: %d, same: %d (%.2f), diff: %d" % (total, same, same / float(total), diff))
