Spotify SQL Project

 Project Overview

This project analyzes Spotify music data using SQL. The goal is to uncover insights about artists, albums, tracks, and users by building a relational database and writing queries ranging from simple selections to advanced analysis.

 Objectives

* Create a structured relational database for Spotify data.
* Write SQL queries (simple → intermediate → advanced).
* Analyze track popularity, artist performance, and album trends.
* Study subscription patterns and user behavior.
* Generate meaningful insights for decision-making.

 Database Schema

* Artists → artist\_id, artist\_name, country
* Albums → album\_id, album\_name, release\_year, artist\_id
* Tracks → track\_id, track\_name, album\_id, duration\_ms, danceability, energy, tempo, popularity, streams
* Users → user\_id, username, country, subscription\_type


 SQL Queries Included

* Simple Queries → filtering tracks, albums, artists
* Intermediate Queries → aggregates, GROUP BY, HAVING
* Advanced Queries → joins, subqueries, ranking, insights

 Key Insights

* Pop music dominates streaming numbers.
* Some artists consistently release top-performing albums.
* Premium users are concentrated in specific countries.
* Danceability & energy strongly influence track popularity.

 Deliverables

* Spotify.sql → Database schema & queries
* CSV files → Dataset (artists, albums, tracks, users)
* ER Diagram → Database design visualization
* Presentation → Project summary & insights

 How to Run

1. Open MySQL Workbench.
2. Import `Spotify.sql`.
3. Run queries on the dataset.
4. View insights & results.
   
Acknowledgement

This project was created for SQL learning and data analysis practice using a Spotify-themed dataset.


