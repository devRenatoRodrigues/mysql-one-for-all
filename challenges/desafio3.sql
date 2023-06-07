SELECT u.user_name AS pessoa_usuaria, 
COUNT(h.playback_history) AS musicas_ouvidas,
CAST(ROUND(SUM(s.length) / 60, 2) AS DECIMAL(10,2)) AS total_minutos
FROM Users u
JOIN History h ON u.id = h.user_id 
JOIN Songs s ON h.song_id = s.id
GROUP BY u.user_name
ORDER BY u.user_name;