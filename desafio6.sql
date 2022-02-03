SELECT 
    MIN(P.valor_plano) AS faturamento_mínimo,
    MAX(P.valor_plano) AS faturamento_máximo,
    AVG(P.valor_plano) AS faturamento_medio,
    SUM(P.valor_plano) AS faturamento_total
 --    CASE
-- 		WHEN P.id_plano = 1 THEN SUM(0) 
--         WHEN P.id_plano = 2 THEN SUM(7.99) 
--         WHEN P.id_plano = 3 THEN SUM(5.99) 
--         WHEN P.id_plano = 4 THEN SUM(6.99)
--     END AS faturamento_total
FROM
    planos P;