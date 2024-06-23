
import json
data = None
with open('data/data.json', 'r') as f:
  data = json.load(f)

print(data)

# name of enterprises
enterprises = []

for i in data:
  print(i['name'])
  for j in i['tools']:
    if j not in enterprises:
      enterprises.append(j)

print(enterprises)