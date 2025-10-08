use music_trends;

SELECT s.title, a.artist_name, c.chart_date, c.song_rank
FROM songs s
JOIN artists a ON s.artist_id = a.artist_id
JOIN chart_performance c ON s.song_id = c.song_id
ORDER BY c.chart_date DESC
LIMIT 30;


-- artist table verification and cleaning
select *
from artists where artist_name is null;

delete from artists
where artist_name is null or artist_id is null;

select title and artist_id, release_year, COUNT(*) as count_dups
from songs
group by title, artist_id, release_year
having count_dups > 1;

select artist_id, artist_name
from artists 
where artist_id IN (Select artist_id from songs);

select *
from songs limit 20;

-- chart performance
select * from chart_performance limit 30;

-- test query
-- most frequent charted artists 
SELECT a.artist_name, COUNT(DISTINCT s.song_id) AS total_songs
FROM artists a
JOIN songs s ON a.artist_id = s.artist_id
JOIN chart_performance c ON s.song_id = c.song_id
GROUP BY a.artist_name
ORDER BY total_songs DESC
LIMIT 10;

-- longest charting songs
SELECT s.title, a.artist_name, MAX(c.weeks_on_chart) AS longest_run
FROM chart_performance c
JOIN songs s ON c.song_id = s.song_id
JOIN artists a ON s.artist_id = a.artist_id
GROUP BY s.title, a.artist_name
ORDER BY longest_run DESC
LIMIT 10;

select floor(year(c.chart_date)/10)*10 AS decade,
AVG(c.song_rank) as avg_rank
from chart_performance c
group by decade
order by decade;




