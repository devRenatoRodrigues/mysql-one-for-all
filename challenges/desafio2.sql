SELECT COUNT(DISTINCT s.id) AS cancoes,
       COUNT(DISTINCT ar.id) AS artistas,
       COUNT(DISTINCT al.id) AS albuns
FROM Songs s
JOIN Albums al ON s.album_id = al.id
JOIN Artists ar ON al.artist_id = ar.id;
