import psycopg2

def create_connection_db():
    # database connection
    connection = psycopg2.connect(
        host="localhost",
        port=5432,
        database="data_stack",
        user="",
        password=""
    )
    connection.autocommit = True
    return connection.cursor()

def load_enterprise(enterprises, cur) -> None:
    for name in enterprises:
        sql = "INSERT INTO enterprise VALUES (nextval('enterprise_id_sequence'), '{}')".format(str(name))
        cur.execute(sql)

def load_categories(categories, cur) -> None:
    for cat in categories:
        sql = "INSERT INTO categories VALUES (nextval('category_id_sequence'), '{}')".format(str(cat))
        cur.execute(sql)

def load_tools(tools, cur) -> None:
    for tool in tools:
        sql = "INSERT INTO tools VALUES (nextval('tool_id_sequence'), '{}', null)".format(str(tool))
        cur.execute(sql)

def load_enterprise_tool(rels, cur) -> None:
    for rel in rels:
        sql = "insert into enterprise_tool values ((select id_tool from tools where name_tool = '{}'),(select id_enterprise from enterprise where name_enterprise = '{}'),(select id_category from categories where name_category = '{}'));".format(str(rel[2]), str(rel[0]), str(rel[1]))
        # print(sql)
        cur.execute(sql)

def load_category_tool(rels, cur) -> None:
    for rel in rels:
        sql = "insert into tool_category values ((select id_tool from tools where name_tool = '{}'),(select id_category from categories where name_category = '{}'));".format(str(rel[1]), str(rel[0]))
        # print(sql)
        cur.execute(sql)
    

def close_connection_db( connection ) -> None:
    # save changes on database
    # connection.commit()
    # close connection
    connection.close()
