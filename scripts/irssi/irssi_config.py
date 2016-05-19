#!/usr/bin/python

import json
from os.path import expanduser
from string import Template

vars_config_file = 'vars.json'
HOME_DIR = expanduser("~")
irssi_config_file = '{}/.irssi/config'.format(HOME_DIR)
irssi_template_file = "config"

with open(vars_config_file) as data_file:
  data = json.load(data_file)

with open(irssi_template_file) as f:
  irssi_template = f.read()

#print irssi_template
s = Template(irssi_template)

status = True
for k in data.keys():
  v = data[k]
  if (v is None):
    status = False
    break
  data['_{}'.format(k)] = data[k]
  del data[k]

if (status is True):
  result = s.safe_substitute(data)
  with open(irssi_config_file, 'w') as f:
    f.write(result)
  print "Updated irssi config"
else:
  print "Unable to get all values in config correctly"

#dd = {}
#dd['\$who'] = 'Monkey'
#print Template('$$who likes me').substitute(dd)
