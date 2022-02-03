SELECT DISTINCT
    u.usuario,
    CASE
        WHEN REP.data_reproducao > '2021-01-01 00:00:00' THEN 'Usuário ativo'
        WHEN
            REP.data_reproducao < '2021-01-01 00:00:00'
                AND u.usuario <> 'Angelina'
                AND u.usuario <> 'Carol'
        THEN
            'Usuário inativo'
        ELSE 'Usuário ativo'
    END AS condicao_usuario
FROM
    reproducoes REP
        JOIN
    usuarios u ON u.id_usuario = REP.id_usuario
ORDER BY u.usuario;