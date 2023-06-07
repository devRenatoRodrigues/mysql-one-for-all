SELECT 
    CASE
        WHEN age <= 30 THEN 'Até 30 anos'
        WHEN age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN age > 60 THEN 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT u.id) AS total_pessoas_usuarias,
    COUNT(f.user_id) AS total_favoritadas
FROM
    Users u
        LEFT JOIN
    Favorites f ON u.id = f.user_id
GROUP BY faixa_etaria
ORDER BY CASE faixa_etaria
    WHEN 'Até 30 anos' THEN 1
    WHEN 'Entre 31 e 60 anos' THEN 2
    WHEN 'Maior de 60 anos' THEN 3
END
