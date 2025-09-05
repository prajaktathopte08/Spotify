create database Spotify;
use Spotify;

-- 1. Artists Table
CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- 2. Albums Table
CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(100) NOT NULL,
    release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- 3. Tracks Table
CREATE TABLE tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(100) NOT NULL,
    album_id INT,
    duration_ms INT,
    danceability DECIMAL(3,2),
    energy DECIMAL(3,2),
    tempo DECIMAL(6,2),
    popularity INT,
    streams BIGINT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- 4. Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    country VARCHAR(50),
    subscription_type VARCHAR(50)
);

-- Simple Queries

-- 1.Show the album names and their release years.
     select album_name, release_year
     from albums;

-- 2.Show all tracks where tempo > 120.
     select *
     from tracks
     where tempo >120;

-- 3.Show all albums released after 2015.
     select album_id,album_name
     from albums
	 where release_year >2015;

-- 4.Retrieve the duration (in minutes) of all tracks.
     select duration_ms
	 from tracks;

-- 5.Get the total number of artists in the dataset.
     select count(artist_id)
     from artists;
 
-- 6.Find users who belong to India.
	 select user_id,country
     from users
	 where country='India';

-- Intermediate Queries
 
-- 1.Find the average popularity of tracks per album.
     select album_id,avg(popularity) AS Average_Popularity
	 from tracks
	 group by album_id;
 
-- 2.Show the top 5 artists with the highest number of albums. 
     select artist_id,count(*) as Album_count 
     from albums
     group by artist_id
     order by album_count desc
     limit 5;

-- 3.Count how many albums each artist has released.
     select artist_id,count(*) as Released_Album
     from albums
     group by artist_id;
     
-- 4.Show users grouped by subscription type and count them.
     select subscription_type,count(*)
     from users
     group by subscription_type;

-- 5.Find artists who have at least 2 albums in the dataset.
     select artist_id,count(*) as Album_count
     from albums
     group by artist_id
     having count(*)=2;
     
-- 6.Get the top 5 tracks by energy level.
     select track_name, Energy
     from tracks
     order by energy desc
     limit 5;

 --  Advanced Queries
 
 -- 1.Find the most popular track for each artist. 
    select tra.track_id, art.artist_name, tra.popularity
    from tracks tra, albums alb, artists art
    where art.artist_id = alb.artist_id AND alb.album_id = tra.album_id
    order by tra.popularity desc
    limit 10;
    
-- 2.Show the album with the highest average track popularity.
    select alb.album_name,avg(popularity) as avge
    from albums alb,tracks tra
    where alb.album_id = tra.album_id
    group by alb.album_name
    order by avge desc;
    
-- 3.Find the user country with the maximum number of Premium users.
    SELECT country, COUNT(*) AS premium_users
    FROM users
    WHERE subscription_type = 'Premium'
    GROUP BY country
    ORDER BY premium_users DESC  
    LIMIT 1;
   
-- 4.Show the top 3 tracks with the longest duration.
     select track_name,duration_ms 
     from tracks
     order by duration_ms desc
     limit 3;

-- 5.Find the artist whose tracks have the highest total streams.
     SELECT ar.artist_name, SUM(tr.streams) AS total_streams
     FROM artists ar,albums al, tracks tr  
     where  ar.artist_id = al.artist_id and al.album_id = tr.album_id
     GROUP BY ar.artist_name
     ORDER BY total_streams DESC
     LIMIT 10;

-- 6.Get the artist and track details for the top 10 most-streamed tracks.
	 SELECT ar.artist_name, tr.*
     FROM artists ar,tracks tr, albums al
     where tr.album_id = al.album_id and  al.artist_id = ar.artist_id
     ORDER BY tr.streams DESC
     LIMIT 10;

    
 
 