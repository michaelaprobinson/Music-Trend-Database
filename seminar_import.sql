CREATE DATABASE music_trends;
USE music_trends;

CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name TEXT
);

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    title TEXT,
    artist_id INT,
    release_year INT,
    genre TEXT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE chart_performance (
    id INT PRIMARY KEY,
    song_id INT,
    chart_date DATE,
    song_rank INT,
    peak_position INT,
    weeks_on_chart INT,
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE spotify_features (
    id INT PRIMARY KEY,
    song_id INT REFERENCES songs(song_id),
    danceability FLOAT,
    energy FLOAT,
    tempo FLOAT,
    valence FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    speechiness FLOAT
);

CREATE TABLE kaggle_billboard (
    chart_date DATE,
    chart_rank INT,
    song TEXT,
    artist TEXT,
    last_week INT,
    peak_rank INT,
    weeks_on_board INT
);

select
