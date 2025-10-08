use music_trends;

create table json_import(
chart_date DATE,
chart_rank INT,
song VARCHAR(255),
artist VARCHAR(255),
last_week INT,
peak_rank INT,
weeks_on_board INT);

select count(*) from json_import;
select * from json_import LIMIT 10;

-- integrate json chart data with other tables
INSERT IGNORE INTO artists(artist_name)
SELECT DISTINCT artist from json_import where artist is not null;

insert into songs(title,artist_id)
select distinct j.song, a.artist_id
from json_import j
join artists a ON j.artist = a.artist_name
where j.song is NOT NULL;

insert into chart_performance (song_id, chart_date, song_rank, peak_position, weeks_on_chart)
select s.song_id, j.chart_date, j.chart_rank, j.peak_rank, j.weeks_on_board
from json_import j
join songs s on j.song = s.title
join artists a on s.artist_id = a.artist_id and a.artist_name = j.artist;




