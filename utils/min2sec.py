"""
INPUT
xxmxxs

OUTPUT
xxx
"""
# input: 

import sys

#lookup_tbl = {}
#lookup_tbl['real'] = []
#lookup_tbl['user'] = []
#lookup_tbl['sys'] = []
for line in sys.stdin:
	time_str = line
	min = int(time_str.split('m')[0])
	sec = float(time_str.split('m')[1].split('s')[0])
	t = 60*min + sec
	print t
#lookup_tbl[tuple[0]].append(t)


#for prefix in ('real', 'user', 'sys'):
#    str = ''
#    for val in lookup_tbl[prefix]:
#        str += '%.3f, ' % val
#    print prefix + ', ' + str
