-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

-- Query all of the entries in the Genre table
SELECT * FROM genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist(ArtistName, YearEstablished);
VALUES ('Curren$y', 2009);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES('Pilot Talk III', 2015/09/09, 2268, 'Jet Life', 29, 13);

-- Using the INSERT statement, add some songs that are on that album to the Song table
INSERT INTO Song(Title, SongLength, ReleaseDate, ArtistId, AlbumId, GenreId)
VALUES('Get Down', 358, 2015/09/09, 29, 24, 13);

-- Write a SELECT query that provides the song titles, album title,
-- and artist name for all of the data you just entered in.
-- Use the LEFT JOIN keyword sequence to connect the tables,
-- and the WHERE keyword to filter the results to the album and artist you added.
SELECT song.title, album.title, artist.artistName
FROM Song
LEFT JOIN Album ON album.AlbumId = song.AlbumId
LEFT JOIN Artist ON artist.ArtistId = album.ArtistId
WHERE artist.ArtistName = 'Curren$y';

-- Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT album.title,
COUNT(song.title)
FROM Album, Song
ON album.AlbumId = song.AlbumId
GROUP BY album.Title;

-- Write a SELECT statement to display how many songs exist for each artist.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Artist.ArtistName,
Count(Song.Title)
FROM Artist, Song
ON Artist.Artistid = Song.ArtistId
GROUP BY Artist.ArtistName;

-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Genre.Label,
COUNT(Song.Title)
FROM Genre, Song
ON Genre.GenreId = Song.GenreId
GROUP BY Genre.Label

-- Using MAX() function, write a select statement to find the album with the longest duration.
-- The result should display the album title and the duration.

SELECT MAX(AlbumLength), Title
FROM Album;
SELECT MAX(AlbumLength)
AS Duration, Title
FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration.
-- The result should display the song title and the duration.
SELECT MAX(SongLength), Title
FROM Song;
SELECT MAX(SongLength)
AS 'Song Length', Title
FROM Song;

-- Modify the previous query to also display the title of the album.
SELECT MAX(SongLength), Song.Title, Album.Title
FROM Song
LEFT JOIN Album ON Album.AlbumId = Song.AlbumId;
