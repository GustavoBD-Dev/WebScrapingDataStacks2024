import psycopg2

# Conexión a la base de datos
conexion = psycopg2.connect(
    host="localhost",
    port=5432,
    database="data_stack",
    user="gblasd",
    password="msd9bn45"
)

# Cursor para ejecutar consultas
cursor = conexion.cursor()

# Consulta SQL para insertar datos
sql = "INSERT INTO enterprise VALUES (nextval('enterprise_id_sequence'), 'hola_mundo')"

# Ejecutar la consulta para cada fila de datos
cursor.execute(sql)

# Guardar los cambios en la base de datos
conexion.commit()

# Cerrar la conexión
conexion.close()