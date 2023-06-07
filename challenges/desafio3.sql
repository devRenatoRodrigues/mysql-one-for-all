SELECT Users.user_name AS pessoa_usuaria, 
COUNT(History.playback_history) AS musicas_ouvidas,
CAST(ROUND(SUM(Songs.length) / 60, 2) AS DECIMAL(10,2)) AS total_minutos
FROM Users
JOIN History ON Users.id = History.user_id
JOIN Songs ON History.song_id = Songs.id
GROUP BY Users.user_name
ORDER BY Users.user_name;