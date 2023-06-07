SELECT
  s.song_name AS cancao,
  COUNT(*) AS reproducoes
  FROM Songs s
JOIN History h ON s.id = h.song_id
GROUP BY s.song_name
ORDER BY reproducoes DESC, s.song_name
LIMIT 2;

