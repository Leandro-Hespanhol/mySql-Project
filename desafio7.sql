-- Desafio 7 - Exiba todos os albuns produzidos informando o artista e a quantidade de seguidores do artista.
SELECT 
    SEG.seguindo_artistas AS artistas,
    ALB.album,
    COUNT(SEG.seguindo_artistas) AS seguidores
FROM
    albums ALB
        INNER JOIN
    usuario_seg_artistas SEG ON SEG.id_artista = ALB.id_artista
GROUP BY ALB.album , SEG.seguindo_artistas
ORDER BY seguidores DESC , SEG.seguindo_artistas , ALB.album;