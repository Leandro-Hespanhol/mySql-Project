SELECT 
    u.usuario,
    COUNT(REP.id_usuario) AS qtde_musicas_ouvidas,
    -- SUM(round(CEIL((mu.duracao_segundos * 100) / 60)/ 100, 2)) AS total_minutos
    -- ROUND(SUM(ROUND((mu.duracao_segundos / 60) * 100))/100, 2) AS total_minutos
    -- truncate(SUM(mu.duracao_segundos / 60 ), 2) AS total_minutos
    ROUND(ROUND(SUM(mu.duracao_segundos / 60 ) * 100) /100, 2) AS total_minutos
FROM
    reproducoes REP
JOIN usuarios u ON u.id_usuario = REP.id_usuario
JOIN musicas mu ON mu.id_musica = REP.id_musica
GROUP BY REP.id_usuario
ORDER BY u.usuario;
