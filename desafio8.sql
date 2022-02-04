-- Desafio 8 - Exiba o artista Walter Phoenix e seus albuns
select art.nome AS artista, alb.album from albums alb
INNER JOIN artistas art ON art.id_artista = alb.id_artista
where art.nome = 'Walter Phoenix';