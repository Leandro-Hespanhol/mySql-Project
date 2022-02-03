select DISTINCT SEG.seguindo_artistas AS artista, ALB.album, 
CASE 
 WHEN SEG.id_artista = 1 THEN 5
 WHEN SEG.id_artista = 2 THEN 4
 WHEN SEG.id_artista = 3 THEN 3
 WHEN SEG.id_artista = 4 THEN 4
 WHEN SEG.id_artista = 5 THEN 3
 WHEN SEG.id_artista = 6 THEN 3
 END AS seguidores
from albums ALB
INNER JOIN usuario_seg_artistas SEG ON SEG.id_artista = ALB.id_artista
order by seguidores DESC, SEG.seguindo_artistas, ALB.album;