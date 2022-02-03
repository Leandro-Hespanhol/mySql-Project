SELECT 
    u.usuario,
    CASE
        WHEN MAX(REP.data_reproducao) > '2021-01-01 00:00:00' THEN 'Usuário ativo'
        ELSE 'Usuário inativo'
    END AS condicao_usuario
FROM
    reproducoes REP
        JOIN
    usuarios u ON u.id_usuario = REP.id_usuario
GROUP BY u.id_usuario
ORDER BY u.usuario;