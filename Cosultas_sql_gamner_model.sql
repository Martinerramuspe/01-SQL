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
SELECT COUNT(poroto.conteo_por_grupo) as conteo_sin_repetidos
FROM ( 
	SELECT game.name, COUNT(name) as conteo_por_grupo
    FROM game
    GROUP BY name
    ) AS poroto;


SELECT game.id_game,game.name as jeje,game.description
FROM game
WHERE  description <> ""; # Aquellas filas donde la description NO esta vacia

SELECT game.id_game, game.name, game.description
FROM game
WHERE description = ""; # Aquellas filas donde la description  esta vacia

-- Hay solo 81 game con descripciones.
SELECT COUNT(GORDON.jeje) as Conteo_sin_repetir
FROM(
   SELECT game.id_game,game.name as jeje,game.description
   FROM game
   WHERE  description <> ""
   ) as GORDON;
   
   
-- De los names que se repiten, algun tiene descripcion nula? 
-- Creo que estamos en presencia de un join entre una tabla y una cosulta 



