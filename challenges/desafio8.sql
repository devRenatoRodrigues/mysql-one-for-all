SELECT 
    a.artist_name AS artista, al.albun_name AS album
FROM
    Artists a
        JOIN
    Albums al ON a.id = al.artist_id
WHERE
    a.artist_name = 'Elis Regina'
ORDER BY artista;
