-- Desafio 9 - Exiba quantidade de músicas escutadas pelo usuário "Bill"
select COUNT(id_usuario) AS quantidade_musicas_no_historico from reproducoes
where id_usuario = 3;