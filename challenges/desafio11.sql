SELECT 
    a.album_name AS album, COUNT(f.fav_song_id) AS favoritadas
FROM
    Albums a
        INNER JOIN
    Songs s ON a.id = s.album_id
        LEFT JOIN
    Favorites f ON s.id = f.fav_song_id
GROUP BY a.id
ORDER BY COUNT(f.fav_song_id) DESC , a.album_name ASC
LIMIT 3;
