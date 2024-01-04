# ETL N°2
import pandas as pd
from sqlalchemy import create_engine

# Conectamos a la base de datos
coneccion = create_engine('mysql+pymysql://root:administrador@localhost/facultad')

# CONSULTA
query = """
    SELECT C.Curso_ID, I.Inscripcion_ID, E.Estudiante_ID, E.nombre, E.apellido, M.asignatura, 
        Cal.Evaluacion_N°1, Cal.Evaluacion_N°2, Cal.Recuperatorio_N°1, Cal.Recuperatorio_N°2, Cal.Practica_integradora
    FROM FACULTAD.CURSO C
    INNER JOIN FACULTAD.INSCRIPCIONES_CURSADA I ON C.Curso_ID = I.Curso_ID
    INNER JOIN FACULTAD.ESTUDIANTES E ON I.Estudiante_ID = E.Estudiante_ID
    INNER JOIN FACULTAD.MATERIAS M ON C.Materia_ID = M.Materia_ID
    INNER JOIN FACULTAD.CALIFICACIONES Cal ON I.Inscripcion_ID = Cal.Inscripcion_ID
"""
# Extraemos la consulta en un df 
calificaciones_df = pd.read_sql_query(query, coneccion)

# Creamos funcion_N°1
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

# Aplicamos funcion_N°1 
calificaciones_df['Promedio_Calificaciones'] = calificaciones_df.apply(calcular_promedio, axis=1)

# Creamos funcion_N°2
def Condicion (fila):
    if fila['Promedio_Calificaciones'] >6:
        return "PROMOCIONADO"
    elif fila['Promedio_Calificaciones'] >3 and fila['Promedio_Calificaciones'] <7:
        return "REGULAR"
    else:
        return "LIBRE"

# Aplicamos funcion_N°2, para crear tabla
calificaciones_df['Condicion_final'] = calificaciones_df.apply(Condicion, axis=1)
df= calificaciones_df[['Estudiante_ID','nombre','apellido','Inscripcion_ID','asignatura','Evaluacion_N°1','Evaluacion_N°2','Recuperatorio_N°1','Recuperatorio_N°2','Practica_integradora','Promedio_Calificaciones','Condicion_final']]

# Crear tabla nueva o actualizamos la existente con replace.
df.to_sql('Condicion_alumnos', coneccion, if_exists='replace', index=False)

# Creamos tabla con promedio del total de las materias por alumno.
df1 = df.groupby(['Estudiante_ID'])['Promedio_Calificaciones'].mean().reset_index()

# Creamos tabla con promedio del total de las materias por alumno O actualizamos la existente con replace. 
df1.to_sql('Promedio_total_materias', coneccion, if_exists='replace', index=False)
# Cerrar la conexión
coneccion.dispose()


