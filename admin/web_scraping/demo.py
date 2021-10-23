import json
import sys
import os

D = {'foo':sys.argv[2], 'baz': 2}

# print (sys.argv[1])

# os.system('python news18.py '+sys.argv[1]+' '+sys.argv[2])
print json.dumps(D)