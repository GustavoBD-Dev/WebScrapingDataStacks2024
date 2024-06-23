from load import *
import json

def JSON_Read():
  # read JSON file data
  data = None
  with open('data/data.json', 'r') as f:
    data = json.load(f)
  return data 

# data from list
def get_enterprises(data):
  # name of enterprises
  enterprises = []
  for i in data:
    # print(i['name'])
    if i['name'] not in enterprises:
      enterprises.append(i['name'])
  return enterprises

def get_tools(data):
  tools = []
  for i in data:
    for j in i['tools']:
      for k in i['tools'][j]:
        if k not in tools:
          tools.append(k)
  return tools

def get_categories(data):
  groups = []
  for i in data:
    for j in i['tools']:
      if j not in groups:
        groups.append(j)
  return groups

def enterprise_tool(data):
  enterprise_tools = []
  for i in data:
    # print(i['name']) # enterprise
    for j in i['tools']:
      # print(j)
      for k in i['tools'][j]:
        # print(k) # tool
        enterprise_tools.append([i['name'], k])
  return enterprise_tools

# connect to database
var_conn = create_connection_db()

# get data from file
data = JSON_Read()
enterprises = get_enterprises(data)
tools = get_tools(data)
categories = get_categories(data)
enterprise_tool_rels = enterprise_tool(data)

# upload into database
#load_enterprise(enterprises=enterprises, cur=var_conn)
#load_categories(categories=categories, cur=var_conn)
#load_tools(tools=tools, cur=var_conn)
load_enterprise_tool(rels=enterprise_tool_rels, cur=var_conn)

# close connection database
close_connection_db(var_conn)


print('end success!!')