use gammers_model;
select* 
from game;

select *
from commentary;

# Cual juego tiene mas comnetarios y como se llama esos juegos?
select commentary.id_game,count(id_game) conteo_comentarios_juego
from commentary
group by id_game
order by conteo_comentarios_juego desc;

select commentary.id_game, commentary.commentary
from commentary
where id_game= 73;



SELECT game.name, commentary.id_game, commentary.commentary
FROM commentary
INNER JOIN game ON commentary.id_game = game.id_game;

