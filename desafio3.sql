-- Desafio 3 - Exiba a Quantidade de músicas ouvidas por usuário e a o tempo em minutos

SELECT 
    u.usuario,
    COUNT(REP.id_usuario) AS qtde_musicas_ouvidas,
    ROUND(ROUND(SUM(mu.duracao_segundos / 60 ) * 100) /100, 2) AS total_minutos
FROM
    reproducoes REP
JOIN usuarios u ON u.id_usuario = REP.id_usuario
JOIN musicas mu ON mu.id_musica = REP.id_musica
GROUP BY REP.id_usuario
ORDER BY u.usuario;
