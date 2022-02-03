SELECT 
    u.usuario,
    COUNT(REP.id_usuario) AS qtde_musicas_ouvidas,
    SUM(mu.duracao_segundo) AS total_minutos
FROM
    reproducoes REP
JOIN usuarios u ON u.id_usuario = REP.id_usuario
JOIN musicas mu ON mu.id_musica = REP.id_musica
GROUP BY id_usuario
ORDER BY u.usuario;