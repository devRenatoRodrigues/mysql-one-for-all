SELECT 
    COUNT(*) AS musicas_no_historico
FROM
    History h
        JOIN
    Users u ON h.user_id = u.id
WHERE
    u.user_name = 'Barbara Liskov';
