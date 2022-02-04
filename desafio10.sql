-- Desafio 10 - Exiba quantidade de reproduções de cada música
SELECT 
    rep.historico_de_reproducoes AS nome,
    COUNT(rep.id_musica) AS reproducoes
FROM
    reproducoes rep
INNER JOIN usuarios u ON u.id_usuario = rep.id_usuario
WHERE u.id_plano IN(1, 4)
GROUP BY rep.historico_de_reproducoes
order by reproducoes DESC, nome;