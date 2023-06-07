SELECT 
    a.artist_name AS artista,
    CASE
        WHEN COUNT(f.fav_song_id) >= 5 THEN 'A'
        WHEN COUNT(f.fav_song_id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(f.fav_song_id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
    END AS ranking
FROM
    Artists a
        LEFT JOIN
    Albums al ON a.id = al.artist_id
        LEFT JOIN
    Songs s ON al.id = s.album_id
        LEFT JOIN
    Favorites f ON s.id = f.fav_song_id
GROUP BY a.id
ORDER BY COUNT(f.fav_song_id) DESC , a.artist_name ASC;
