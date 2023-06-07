SELECT 
    MIN(p.plan_value) AS faturamento_minimo,
    MAX(p.plan_value) AS faturamento_maximo,
    CAST(ROUND(AVG(p.plan_value), 2) AS DECIMAL(10, 2)) AS faturamento_medio,
    SUM(p.plan_value) AS faturamento_total
FROM
    Plans p
        JOIN
    Users u ON p.id = u.plan_id;
