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
# Creamos primera funcion
def calcular_promedio(fila):
    # Si  aprueba evaluación 1, evaluación 2 y la práctica integradora
    if fila['Evaluacion_N°1'] > 6 and fila['Evaluacion_N°2'] > 6 and fila['Practica_integradora'] == 1:
        return fila[['Evaluacion_N°1', 'Evaluacion_N°2']].mean()
    # Si no  aprueba evaluación 1, pero aprueba evaluación 2 y recuperatorio 1
    elif fila['Evaluacion_N°1'] < 6 and fila['Evaluacion_N°2'] > 6 and fila['Recuperatorio_N°1'] > 6:
        return fila[['Evaluacion_N°2','Recuperatorio_N°1']].mean()
    # Si aprueba evaluación 1, pero no aprueba evaluación 2 y aprueba recuperatorio 2
    elif fila['Evaluacion_N°1'] > 6 and fila['Evaluacion_N°2'] < 6 and fila['Recuperatorio_N°2'] > 6:
        return fila[['Evaluacion_N°1','Recuperatorio_N°2']].mean()
    # Si no aprueba evaluación 1, no aprueba evaluación 2, pero aprueba recuperatorio 1 y recuperatorio 2
    elif fila['Evaluacion_N°1'] < 6 and fila['Evaluacion_N°2'] < 6 and fila['Recuperatorio_N°1'] > 6 and fila['Recuperatorio_N°2'] > 6:
        return fila[['Recuperatorio_N°1','Recuperatorio_N°2']].mean()
    # Si no aprueba evaluación 1, no aprueba evaluación 2 y recuperatorio 1 o recuperatorio 2 tienen notas bajas
    else:
        return fila[['Recuperatorio_N°1', 'Recuperatorio_N°2']].mean()

# Aplicamos la primera funcion 
calificaciones_df['Promedio_Calificaciones'] = calificaciones_df.apply(calcular_promedio, axis=1)
# Creamos segunda funcion
def Condicion (fila):
    if fila['Promedio_Calificaciones'] >6:
        return "PROMOCIONADO"
    elif fila['Promedio_Calificaciones'] >3 and fila['Promedio_Calificaciones'] <7:
        return "REGULAR"
    else:
        return "LIBRE"

# Aplicamos segunda funcion al df
calificaciones_df['Condicion_final'] = calificaciones_df.apply(Condicion, axis=1)
df= calificaciones_df[['Estudiante_ID','nombre','apellido','Inscripcion_ID','asignatura','Evaluacion_N°1','Evaluacion_N°2','Recuperatorio_N°1','Recuperatorio_N°2','Practica_integradora','Promedio_Calificaciones','Condicion_final']]
# Crear tabla nueva o actualizamos la existente con replace.
df.to_sql('Condicion_alumnos', engine, if_exists='replace', index=False)

#Creamos dataframe con ...... seguir con esto despues
df1 = df.groupby(['Inscripcion_ID'])['Promedio_Calificaciones'].mean().reset_index()
df1= pd.DataFrame(df1)

df1.index
# Cerrar la conexión
engine.dispose()


