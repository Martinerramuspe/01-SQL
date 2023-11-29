use gammers_model;
select *
from game;

# investigamos cantida de filas
select count(id_game) conteo
from game;

#  BUSCAMOS ANOMALIAS EN TABLA
-- Nombres repetidos:
select game.name, count(name) as conteo_por_grupo
from game
group by name
order by conteo_por_grupo desc;


-- Realizamos el conteo de juegos no repetidos.
SELECT COUNT(poroto.name)
FROM ( 
	SELECT game.name, COUNT(name) as conteo_por_grupo
    FROM game
    GROUP BY name
    ) AS poroto;

SELECT game.id_game,game.name,game.description
FROM game
WHERE  description <> "";

-- Hay solo 81 game con descripciones.
SELECT COUNT(GORDON.name)
FROM(
   SELECT game.id_game, game.name, game.description
   FROM game
   WHERE description <> ""
   ) as GORDON;
   
   
-- De los names que se repiten, algun tiene descripcion nula? 


select game.name, count(name) as conteo_por_grupo
from game
group by name
having conteo_por_grupo > 1
order by conteo_por_grupo desc;

select game.name
from game
group by name
having 

