# 
import pandas as pd
from sqlalchemy import create_engine

# Configuración de la conexión a la base de datos
engine = create_engine('mysql+pymysql://root:administrador@localhost/facultad')

# Extraer datos de la tabla de calificaciones con información adicional
query = """
    SELECT C.Curso_ID, I.Inscripcion_ID, E.Estudiante_ID, E.nombre, E.apellido, M.asignatura, 
        Cal.Evaluacion_N°1, Cal.Evaluacion_N°2, Cal.Recuperatorio_N°1, Cal.Recuperatorio_N°2, Cal.Practica_integradora
    FROM FACULTAD.CURSO C
    INNER JOIN FACULTAD.INSCRIPCIONES_CURSADA I ON C.Curso_ID = I.Curso_ID
    INNER JOIN FACULTAD.ESTUDIANTES E ON I.Estudiante_ID = E.Estudiante_ID
    INNER JOIN FACULTAD.MATERIAS M ON C.Materia_ID = M.Materia_ID
    INNER JOIN FACULTAD.CALIFICACIONES Cal ON I.Inscripcion_ID = Cal.Inscripcion_ID
"""

calificaciones_df = pd.read_sql_query(query, engine)

# Definir la función para calcular el promedio con condición
def calcular_promedio(row):
    # Si aprobo evaluacion n°1, evaluacion n°2 y tambien la practica integradora
    if row['Evaluacion_N°1'] > 6 and row['Evaluacion_N°2'] > 6 and row['Practica_integradora'] == 1:
        return row[['Evaluacion_N°1', 'Evaluacion_N°2']].mean()
    elif row['Evaluacion_N°1'] <6 and row['Evaluacion_N°2'] > 6 and row['Recuperatorio_N°1'] > 6:
        return
    else:
        return row[['Recuperatorio_N°1', 'Recuperatorio_N°2']].mean()
# Aplicar la función con apply
calificaciones_df['Promedio_Calificaciones'] = calificaciones_df.apply(calcular_promedio, axis=1)

# Crear tabla nueva o actualizar existente con los resultados transformados
calificaciones_df.to_sql('PROMEDIO_CALIFICACIONES', engine, if_exists='replace', index=False)

# Cerrar la conexión
engine.dispose()


