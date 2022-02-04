-- Desafio 2 - Exiba o valor total de musicas, artistas e albuns

SELECT 
    COUNT(DISTINCT id_musica) AS cancoes,
    COUNT(DISTINCT id_artista) AS artistas,
    COUNT(DISTINCT id_album) AS albuns
FROM
    musicas;