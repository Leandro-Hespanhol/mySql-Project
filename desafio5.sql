-- Desafio 5 - Exiba as duas músicas mais tocadas e a quantidade de reproduções, ordene em ordem alfabética

select historico_de_reproducoes AS cancao, COUNT(*) AS reproducoes from reproducoes

group by historico_de_reproducoes
ORDER BY reproducoes DESC, historico_de_reproducoes
limit 2;