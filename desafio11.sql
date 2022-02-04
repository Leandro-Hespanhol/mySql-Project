-- Desafio 11 - Troque os nomes de algumas músicas da seguinte forma:
-- 1)Trocar a palavra "Streets" no final do nome de uma música por "Code Review"
-- 2)Trocar a palavra "Her Own" no final do nome de uma música por "Trybe"
-- 3)Trocar a palavra "Inner Fire" no final do nome de uma música por "Project"
-- 4)Trocar a palavra "Silly" no final do nome de uma música por "Nice"
-- 5)Trocar a palavra "Circus" no final do nome de uma música por "Pull Request"

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