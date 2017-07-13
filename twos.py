with open("apertium/apertium-ces-rus/apertium-ces-rus.ces-rus.dix", 'r') as dic, \
open("apertium/apertium-ces-rus/apertium-ces-rus.ces-rus2.dix", 'w') as dic2:
	for line in dic.readlines():
		if '1<' in line:
			dic2.write(line.replace('1<', '<'))
		if '2<' in line:
			dic2.write(line.replace('2<', '<'))

		else:
			dic2.write(line)