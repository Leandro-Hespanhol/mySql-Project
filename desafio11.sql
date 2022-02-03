SELECT 
    musica AS nome_musica,
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(musica,
                        'Circus',
                        'Pull Request'),
                    'Silly',
                    'Nice'),
                'Inner Fire',
                'Project'),
            'Her Own',
            'Trybe'),
        'Streets',
        'Code Review') AS novo_nome
FROM
    musicas
WHERE
    musica IN ('Dance With Her Own' , 'Let\'s Be Silly',
        'Magic Circus',
        'Troubles Of My Inner Fire',
        'Without My Streets')
ORDER BY musica , novo_nome;