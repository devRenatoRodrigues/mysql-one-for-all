SELECT COUNT(DISTINCT Songs.id) AS cancoes,
       COUNT(DISTINCT Artists.id) AS artistas,
       COUNT(DISTINCT Albums.id) AS albuns
FROM Songs
JOIN Albums ON Songs.album_id = Albums.id
JOIN Artists ON Albums.artist_id = Artists.id;
