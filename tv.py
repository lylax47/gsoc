import sys

def new_func(s):
	o = s
	lem = o.split('<')[0]
	tags = '<'.join(o.split('<')[1:])

	tags = tags.replace('><', '"/><s n="')
	# o = o.replace('<', '<s n="')
	# o = o.replace('>', '"/>')
	return lem + '<s n="' + tags[0:-1] + '"/>'

table = {}
for line in open(sys.argv[1]).readlines():
	if line.strip()=='':
		continue
	row = line.split('\t')
	print(row)
	table[new_func(row[0])] = row[1]

for line in sys.stdin.readlines():
	if line.count('<e')>0 and line.count('"vblex"')>0:
		k = line.replace('<r>', '@').replace('</r>', '@').split('@')[1]
		# print(line, k)
		if k in table:
			if table[k].count('<tv>')>0:
				print(line.replace('</r>', '<s n="tv"/></r>').strip('\n'))
			else:
				print(line.replace('</r>', '<s n="iv"/></r>').strip('\n'))
		else:
			print(line.strip('\n'))
	else:
		print(line.strip('\n'))
# print(table)


