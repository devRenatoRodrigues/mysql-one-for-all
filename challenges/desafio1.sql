DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE Plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(255),
    plan_value DECIMAL(8, 2)
) ENGINE = InnoDB;

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255),
    age INT,
    subscribed DATE,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES Plans(id)
) ENGINE = InnoDB;

CREATE TABLE Artists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255)
) ENGINE = InnoDB;

CREATE TABLE Albums (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    album_name VARCHAR(255),
    release_year INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(id)
) ENGINE = InnoDB;

CREATE TABLE Songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT,
    song_name VARCHAR(255),
    length INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
) ENGINE = InnoDB;

CREATE TABLE Followers (
    follower_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    user_id INT,
    artist_name VARCHAR(300),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    UNIQUE KEY unique_followers (user_id, artist_id)
) ENGINE = InnoDB;

CREATE TABLE History (
    user_id INT,
    song_id INT,
    playback_date DATETIME,
    playback_history VARCHAR(300),
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (song_id) REFERENCES Songs(id)
) ENGINE = InnoDB;

INSERT INTO Plans (plan_name, plan_value) VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

INSERT INTO Users (user_name, age, subscribed, plan_id) VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO Artists (artist_name) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');


INSERT INTO Albums (artist_id, album_name, release_year) VALUES
(1, 'Renaissance', 2022),
(2, 'Jazz', 1978),
(2, 'Hot Space', 1982),
(3, 'Falso Brilhante', 1998),
(3, 'Vento de Maio', 2001),
(4, 'QVVJFA?', 2003),
(5, 'Somewhere Far Beyond', 2007),
(6, 'I Put A Spell On You', 2012);

INSERT INTO Songs (album_id, song_name, length) VALUES
(1, 'BREAK MY SOUL', 279),
(1, 'VIRGO''S GROOVE', 369),
(1, 'ALIEN SUPERSTAR', 116),
(2, 'Don''t Stop Me Now', 203),
(3, 'Under Pressure', 152),
(4, 'Como Nossos Pais', 105),
(5, 'O Medo de Amar é o Medo de Ser Livre', 207),
(6, 'Samba em Paris', 267),
(7, 'The Bard''s Song', 244),
(8, 'Feeling Good', 100);


INSERT INTO Followers (user_id, artist_id, artist_name)
VALUES
(1, 1, 'Beyoncé'), (1, 2, 'Queen'), (1, 3, 'Elis Regina'),
(2, 1, 'Beyoncé'), (2, 3, 'Elis Regina'),
(3, 2, 'Queen'),
(4, 4, 'Baco Exu do Blues'),
(5, 5, 'Blind Guardian'), (5, 6, 'Nina Simone'),
(6, 6, 'Nina Simone'), (6, 1, 'Beyoncé'),
(7, 6, 'Nina Simone'),
(8, 3, 'Elis Regina'),
(9, 2, 'Queen');

INSERT INTO History (user_id, song_id, playback_date, playback_history)
VALUES
    (1, 8, '2022-02-28 10:45:55', 'Samba em Paris'),
    (1, 2, '2020-05-02 05:30:35', 'VIRGO''S GROOVE'),
    (1, 10, '2020-03-06 11:22:33', 'Feeling Good'),
    (2, 10, '2022-08-05 08:05:17', 'Feeling Good'),
    (2, 7, '2020-01-02 07:40:33', 'O Medo de Amar é o Medo de Ser Livre'),
    (3, 10, '2020-11-13 16:55:13', 'Feeling Good'),
    (3, 2, '2020-12-05 18:38:30', 'VIRGO''S GROOVE'),
    (4, 8, '2021-08-15 17:10:10', 'Samba em Paris'),
    (5, 8, '2022-01-09 01:44:33', 'Samba em Paris'),
    (5, 5, '2020-08-06 15:23:43', 'Under Pressure'),
    (6, 7, '2017-01-24 00:31:17', 'O Medo de Amar é o Medo de Ser Livre'),
    (6, 1, '2017-10-12 12:35:20', 'BREAK MY SOUL'),
    (7, 4, '2011-12-15 22:30:49', 'Don''t Stop Me Now'),
    (8, 4, '2012-03-17 14:56:41', 'Don''t Stop Me Now'),
    (9, 9, '2022-02-24 21:14:22', 'The Bard''s Song'),
    (10, 3, '2015-12-13 08:30:22', 'ALIEN SUPERSTAR');