SELECT
  u.user_name AS pessoa_usuaria, 
  CASE
    WHEN MAX(h.playback_date) >= '2021-01-01' AND MAX(h.playback_date) <= CURDATE()
    THEN 'Ativa'
    ELSE 'Inativa' 
  END AS status_pessoa_usuaria
FROM Users u
JOIN History h ON u.id = h.user_id
GROUP BY u.user_name
ORDER BY u.user_name;
