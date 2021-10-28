create database TheJukeBox;

use TheJukeBox;

create table SongTable (
SongId int primary key auto_increment,
SongName varchar(255) not null,
SongDuration time not null,
AlbumName varchar(255) not null,
ArtistName varchar(255) not null,
Genre varchar(255) not null,
SongPath varchar(255)
)auto_increment 1;

insert into SongTable (SongName, SongDuration, AlbumName, ArtistName, Genre, SongPath) values
('Lost', '00:04:09', 'Time To Talk', 'Tobu', 'Hip Hop', 'src\\resources\\Lost.wav'),
('Numb The Pain', '00:03:02', 'Anikdote', 'Chenda', 'Trap', 'src\\resources\\NumbThePain.wav'),
('Street Lights', '00:04:09', 'Time To Talk', 'Azertion', 'House', 'src\\resources\\Street_Lights.wav'),
('Zero Gravity', '00:04:45', 'Gravity', 'Julian Hamilton', 'Pop', 'src\\resources\\Zero Gravity.wav');


create table PodCast (
podCastId int primary key auto_increment,
podCastName varchar(255) not null,
podCastDuration time not null,
publishedDate date not null,
podCastAlbum varchar(255) not null,
podCastHost varchar(255) not null,
Topic varchar(255) not null,
PodCastPath varchar(255)
)auto_increment 101;

insert into PodCast (podCastName, podCastDuration, publishedDate, podCastAlbum, podCastHost, Topic, PodCastPath) values
('TED Talks', '00:24:29', '2021-09-22', 'TED Talk Science', 'Jaspreet Bindra', 'Blockchain', 'src\\resources\\blockchain.wav'),
('TED Talks', '00:10:29', '2020-11-02', 'TED Talk Science', 'Simona Francese', 'fingerprints', 'src\\resources\\fingerprint.wav');


create table PlayList(
PlayListId int not null primary key auto_increment,
PlaylistName varchar(255) not null,
SongId int,
podCastId int,
foreign key (SongId) references SongTable(SongId),
foreign key (podCastId) references PodCast(podCastId)
)auto_increment 201;


drop table PlayList;
drop table SongTable;
drop table PodCast;


desc PlayList;
desc SongTable;
desc PodCast;

select * from PlayList;
select * from SongTable;
select * from PodCast;

select PodCastPath from PodCast inner join PlayList on PodCast.podCastId = PlayList.podCastId where PlayList.podCastId = 101;

select SongPath from SongTable inner join PlayList on SongTable.SongId = PlayList.SongId where PlayList.SongId = 1;

/*insert into SongTable (SongName, SongDuration, AlbumName, ArtistName, Genre) values
('Hit this hard', '00:04:09', 'Stoney', 'Post Malone', 'Hip Hop'),
('Liggi', '00:03:02', 'Dev', 'Ritviz', 'Hip Hop'),
('Sage', '00:04:09', 'Sage', 'Ritviz', 'Hip Hop'),
('Mirchi', '00:03:13', 'Mirchi', 'DIVINE', 'Hip Hop'),
('Lean On', '00:02:57', 'Lean On', 'DJ Sanke', 'Hip Hop'),
('HOLIDAY', '00:04:28', 'INDUSTRY BABY', 'Lil Nas X', 'Pop'),
('Old Town Road', '00:05:08', '7 EP', 'Lil Nas X', 'Pop'),
('Panini', '00:01:55', '7 EP', 'Lil Nas X', 'Pop'),
('Beautiful Mistakes', '00:03:47', 'Beautiful Mistakes', 'Maroon 5', 'Pop'),
('Thunder', '00:03:07', 'Evolve', 'Imagine Dragons', 'Electronic'),
('STAY', '00:02:21', 'STAY', 'JUstine Bieber', 'Pop'),
('Flight', '00:05:27', 'Man of Steel', 'Hans Zimmer', 'Soundtrack'),
('I have So many Questions', '00:03:47', 'Man of Steel', 'Hans Zimmer', 'Soundtrack'),
('Ignition', '00:01:19', 'Man of Steel', 'Hans Zimmer', 'Soundtrack'),
('You die or I die', '00:03:13', 'Man of Steel', 'Hans Zimmer', 'Soundtrack'),
('Tornedo', '00:02:53', 'Man of Steel', 'Hans Zimmer', 'Soundtrack'),
('Run It', '00:02:43', 'Run It', 'DJ Sanke', 'Electronic'),
('Red Right Hand', '00:02:51', 'Peaky Blinders', 'PJ harvey', 'Rock'),
('Something In the Way', '00:03:52', 'Nevermind', 'Nirvana', 'Rock'),
('In the End', '00:04:09', 'Linkin Park', 'Linkin Park', 'Rock'),
('Superhero In My Sleep', '00:03:06', 'Superhero In My Sleep', 'Natan Chaim', 'Electronic'),
('Rise', '00:03:04', 'Rise', 'Jnathyn', 'Electronic'),
('Love Me Better', '00:02:53', 'Love', 'Vizzen', 'Romance'),
('Donot Bother', '00:03:04', 'Love', 'Emily J', 'Romance');*/

/*insert into PodCast (podCastName, podCastDuration, publishedDate, podCastAlbum, podCastHost, Topic) values
('TED Radio Health', '00:51:09', '2021-10-01', 'TED Radio Hour', 'Hui-wen Sato', 'Heartache'),
('TED Radio Dailys', '00:55:00', '2020-11-02', 'Ted Radio Story', 'Alvin Irby', 'School Of Life'),
('TED Talks', '00:24:29', '2021-09-22', 'TED Talk Science', 'Jaspreet Bindra', 'Blockchain'),
('Wan Show', '01:04:09', '2021-10-25', 'Wan', 'Linus Sabastian', 'Microsft'),
('Wan Show', '01:55:00', '2021-05-12', 'Wan', 'Linus Sabastian', 'PC build'),
('Sunday Suspance', '02:24:24', '2020-11-22', 'Sherlock Holmes', 'Jeremy Brett', 'The Hound of the Baskervilles'),
('Sunday Suspance', '01:04:09', '2021-04-15', 'Sherlock Holmes', 'Jeremy Brett', 'A Study in Scarlet'),
('TED Talks', '00:47:30', '2021-10-24', 'TED Talk Science', 'Chris Bailey', 'How to Get Your Brain to Focus'),
('Harvard Podcast', '00:24:00', '2021-11-05', 'Nature', 'Mick Ross', 'subpoena'),
('Harvard Podcast', '00:35:00', '2021-11-07', 'Nature', 'Harvey spectre', 'Harvard Law');*/

-- select filePath from PlayList where PlayListId =201;

-- select PlaylistName,SongName,SongDuration,ArtistName from SongTable inner join PlayList on SongTable.SongId = PlayList.SongId;

-- select * from SongTable left join PlayList on SongTable.SongId = 201;

-- select * from SongTable inner join PlayList on SongTable.SongId = Playlist.SongId;

-- select PlaylistName,SongName,SongArtist,SongGenre,SongAlbum,SongDuration,PodcastName from Songs inner join Playlist on Songs.SongId = Playlist.SongId inner join Podcast on Podcast.PodcastId = Playlist.PodcastId;

-- select Playlist_name,song_name,Artist_name,Album_name,song_duration,Genre_type from Songlist inner join Playlist on Songlist.song_id = Playlist.song_id;

-- select Playlist_name,Podcast_name,Podcast_Orator,Podcast_Album_name,Genre_Type, Release_date from MyPodcast inner join Playlist on MyPodcast.Podcast_id = Playlist.Podcast_id;

-- select p.Playlist_name,s.song_name,s.Artist_name,s.Album_name,s.song_duration,s.Genre_type, m.Podcast_name, m.Podcast_Orator, m.Podcast_Album_name, m.Genre_Type from Songlist s inner join Playlist p on s.song_id = p.song_id inner join MyPodcast m on m.Podcast_id = p.Podcast_id;

-- select PlaylistName from PlayList where PlaylistName like 'nirvana';