
CREATE DATABASE IF NOT EXISTS music_trends;
USE music_trends;


CREATE TABLE IF NOT EXISTS artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) UNIQUE
);


CREATE TABLE IF NOT EXISTS songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    artist_id INT,
    release_year YEAR NULL,
    genre VARCHAR(100) NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);


CREATE TABLE IF NOT EXISTS chart_performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT,
    chart_date DATE,
    song_rank INT,
    peak_position INT,
    weeks_on_chart INT,
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);


CREATE TABLE IF NOT EXISTS spotify_features (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT,
    danceability FLOAT,
    energy FLOAT,
    tempo FLOAT,
    valence FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    speechiness FLOAT,
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);


CREATE TABLE IF NOT EXISTS kaggle_billboard (
    chart_date DATE,
    chart_rank INT,
    song VARCHAR(255),
    artist VARCHAR(255),
    last_week INT,
    peak_rank INT,
    weeks_on_board INT
);

SHOW TABLES;
