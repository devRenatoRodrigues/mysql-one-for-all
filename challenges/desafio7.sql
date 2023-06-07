SELECT 
    a.artist_name AS artista,
    al.albun_name AS albums,
    COUNT(f.follower_id) AS pessoas_seguidoras
FROM
    Artists a
        JOIN
    Albums al ON a.id = al.artist_id
        JOIN
    Followers f ON a.id = f.artist_id
GROUP BY a.artist_name , al.albun_name
ORDER BY pessoas_seguidoras DESC , artista , albums;
