use music_trends;

INSERT IGNORE INTO artists (artist_name)
SELECT DISTINCT artist
FROM kaggle_billboard
WHERE artist IS NOT NULL;

select * from artists limit 10;


SHOW CREATE TABLE songs;



INSERT INTO songs (title, artist_id)
SELECT DISTINCT kaggle_billboard.song,
       artists.artist_id
FROM kaggle_billboard
JOIN artists
  ON kaggle_billboard.artist = artists.artist_name
WHERE kaggle_billboard.song IS NOT NULL
  AND artists.artist_id IS NOT NULL;
  
  




  INSERT INTO chart_performance (song_id, chart_date, song_rank, peak_position, weeks_on_chart)
SELECT s.song_id,
       k.chart_date,
       k.chart_rank,
       k.peak_rank,
       k.weeks_on_board
FROM kaggle_billboard k
JOIN songs s
  ON k.song = s.title
JOIN artists a
  ON s.artist_id = a.artist_id
WHERE a.artist_name = k.artist;
  

-- verification tests


-- SELECT COUNT(*) FROM artists;
-- SELECT COUNT(*) FROM songs;
-- SELECT COUNT(*) FROM chart_performance;

-- SELECT s.title, a.artist_name, c.chart_date, c.song_rank
-- FROM chart_performance c
-- JOIN songs s ON c.song_id = s.song_id
-- JOIN artists a ON s.artist_id = a.artist_id
-- LIMIT 10;
