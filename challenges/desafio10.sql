USE SpotifyClone;

CREATE TABLE Favorites (
    user_id INT,
    fav_song_id INT,
    PRIMARY KEY (user_id, fav_song_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (fav_song_id) REFERENCES Songs(id)
) ENGINE = InnoDB;

INSERT INTO Favorites (user_id, fav_song_id)
VALUES
    (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
    (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);