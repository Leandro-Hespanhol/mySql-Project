-- Desafio 6 - Acerca dos planos, exiba 4 colunas com: 
--1º) Faturamento_minimo
--2º) faturamento_maximo
--3º) faturamento_medio
--4º) Faturamento total

SELECT 
    MIN(P.valor_plano) AS faturamento_minimo,
    MAX(P.valor_plano) AS faturamento_maximo,
    ROUND(AVG(CASE
 		WHEN P.id_plano = 1 THEN 0 
         WHEN P.id_plano = 2 THEN 7.99
         WHEN P.id_plano = 3 THEN 5.99
       WHEN P.id_plano = 4 THEN 6.99
    END), 2) AS faturamento_medio,
    SUM(CASE
 		WHEN P.id_plano = 1 THEN 0 
         WHEN P.id_plano = 2 THEN 7.99
         WHEN P.id_plano = 3 THEN 5.99
       WHEN P.id_plano = 4 THEN 6.99
    END) AS faturamento_total
FROM
    planos P
JOIN usuarios U ON U.id_plano = P.id_plano;



