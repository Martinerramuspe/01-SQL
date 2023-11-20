use facultad;
select *
from materias
where nivel <3 and Departamento_ID=3;

CREATE VIEW MATERIAS_PRIMER_AÑO AS
SELECT *
FROM materias
WHERE nivel < 3 AND Departamento_ID = 3;
