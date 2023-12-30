from sqlalchemy import create_engine
import pandas as pd

# Establecemos conexion con base de datos.
engine = create_engine('mysql+pymysql://root:administrador@localhost/facultad')
# Consulta SQL.
query = '''
    SELECT estudiantes.Estudiante_ID, estudiantes.nombre, estudiantes.apellido,
    inscripciones_cursada.Inscripcion_ID, Materias.asignatura, materias.N°_clases, inasistencias.N°_clases_inasistidas
    FROM inasistencias
    INNER JOIN inscripciones_cursada ON inscripciones_cursada.Inscripcion_ID = inasistencias.Inscripcion_ID
    INNER JOIN estudiantes ON inscripciones_cursada.Estudiante_ID = estudiantes.estudiante_id
    INNER JOIN curso ON inscripciones_cursada.curso_ID = curso.curso_ID
    INNER JOIN materias ON curso.materia_ID = materias.materia_ID
'''
# Ejecutar la consulta y cargar los datos en un DataFrame.
df = pd.read_sql(query, con=engine)
# Creamos nueva variable con operacion aritmetica.
df['%_asistencias'] = (((df['N°_clases'] - df['N°_clases_inasistidas'])/df['N°_clases'])*100).astype(int)
# Creamos nueva variable con condicion booleana.
df['asistencia>%60'] = df['%_asistencias'] > 60
# Filtramos para mostrar solo lo necesario
df= df[['Estudiante_ID','nombre','apellido','Inscripcion_ID','asignatura','%_asistencias','asistencia>%60']]
# Nombre de la tabla nueva que quieres crear en la base de datos
nombre_tabla_nueva = 'Porcentaje_asistencias'
# Cargar el DataFrame resultante como una nueva tabla en la base de datos
df.to_sql(nombre_tabla_nueva, con=engine, index=False, if_exists='replace')
# Cerrar la conexión.
engine.dispose()