SELECT 
    COUNT(DISTINCT id_musica) AS cancoes,
    COUNT(DISTINCT id_artista) AS artistas,
    COUNT(DISTINCT id_album) AS albuns
FROM
    musicas;