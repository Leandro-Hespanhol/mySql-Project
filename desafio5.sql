select historico_de_reproducoes AS cancao, COUNT(*) AS reproducoes from reproducoes

group by historico_de_reproducoes
ORDER BY reproducoes DESC, historico_de_reproducoes
limit 2;