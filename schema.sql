drop table Songs cascade;
drop table Bands cascade;
drop table Albums cascade;
drop table AlbumsSongs_Xref cascade;
drop table Musicians cascade;
drop table MusiciansSongs_Xref cascade;
drop table BandsMusicians_Xref cascade;
drop table Genres cascade;
drop table SongGenres_Xref cascade;
drop table Users cascade;
drop table Playlists cascade;
drop table UsersPlaylistsSongs_Xref cascade;

create table Songs (
    sid             bigserial       not null primary key,
    name            varchar(128)    unique not null,
    duration        integer,
    release_date    date
    );
    
insert into Songs (name, duration, release_date) values ('Sgt. Pepper''s Lonely Hearts Club Band', 122, '1967-06-01');
insert into Songs (name, duration, release_date) values ('With a Little Help from My Friends', 164, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Lucy in the Sky with Diamonds', 208, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Getting Better', 167, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Fixing a Hole', 156, '1967-06-01');
insert into Songs (name, duration, release_date) values ('She''s Leaving Home', 215, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Being for the Benefit of Mr. Kite!', 157, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Within You Without You', 305, '1967-06-01');
insert into Songs (name, duration, release_date) values ('When I''m Sixty Four', 157, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Lovely Rita', 162, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Good Morning Good Morning', 161, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Sgt. Pepper''s Lonely Hearts Club Band (Reprise)', 122, '1967-06-01');
insert into Songs (name, duration, release_date) values ('A Day in the Life', 303, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Black Dog', 294, '1971-11-08');
insert into Songs (name, duration, release_date) values ('Rock and Roll', 220, '1967-06-01');
insert into Songs (name, duration, release_date) values ('The Battle of Evermore', 351, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Stairway to Heaven', 482, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Misty Mountain Hop', 278, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Four Sticks', 288, '1967-06-01');
insert into Songs (name, duration, release_date) values ('Going to California', 211, '1967-06-01');
insert into Songs (name, duration, release_date) values ('When the Levee Breaks', 427, '1967-06-01');
insert into Songs (name, duration, release_date) values ('She Has Funny Cars', 194, '1967-02-01');
insert into Songs (name, duration, release_date) values ('Somebody to Love', 180, '1967-02-01');
insert into Songs (name, duration, release_date) values ('Today', 183, '1967-02-01');
insert into Songs (name, duration, release_date) values ('Comin'' Back to Me', 323, '1967-02-01');
insert into Songs (name, duration, release_date) values ('My Best Friend', 184, '1967-02-01');
insert into Songs (name, duration, release_date) values ('3/5 of a Mile in 10 Seconds', 225, '1967-02-01');
insert into Songs (name, duration, release_date) values ('D.C.B.A.-25', 159, '1967-02-01');
insert into Songs (name, duration, release_date) values ('How Do You Feel', 214, '1967-02-01');
insert into Songs (name, duration, release_date) values ('Plastic Fantastic Lover', 159, '1967-02-01');
insert into Songs (name, duration, release_date) values ('Embryonic Journey', 115, '1967-02-01');
insert into Songs (name, duration, release_date) values ('White Rabbit', 152, '1967-02-01');
insert into Songs (name, duration, release_date) values ('Dream On', 268, '1973-06-01');
insert into Songs (name, duration, release_date) values ('Same Old Song and Dance', 184, '1974-03-19');
insert into Songs (name, duration, release_date) values ('Sweet Emotion', 195, '1975-04-01');
insert into Songs (name, duration, release_date) values ('Walk This Way', 213, '1975-06-01');
insert into Songs (name, duration, release_date) values ('Last Child', 208, '1976-06-01');
insert into Songs (name, duration, release_date) values ('Back in the Saddle', 261, '1976-06-01');
insert into Songs (name, duration, release_date) values ('Draw the Line', 204, '1977-06-01');
insert into Songs (name, duration, release_date) values ('Kings and Queens ', 228, '1977-06-01');
insert into Songs (name, duration, release_date) values ('Remember (Walking in the Sand)', 245, '1980-06-01');
insert into Songs (name, duration, release_date) values ('Surfin'' Safari', 125, '1962-06-04');
insert into Songs (name, duration, release_date) values ('County Fair', 135, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Ten Little Indians', 90, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Chug-A-Lug', 120, '1962-06-04');
insert into Songs (name, duration, release_date) values ('409', 118, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Surfin''', 130, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Summertime Blues', 130, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Cuckoo Clock', 128, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Moon Dawg', 120, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Little Girl (You''re My Miss America)', 125, '1962-06-04');
insert into Songs (name, duration, release_date) values ('Prologue', 196, '1995-10-27');
insert into Songs (name, duration, release_date) values ('The Awareness', 396, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Eyes of Time', 305, '1995-10-27');
insert into Songs (name, duration, release_date) values ('The Banishment', 668, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Ye Courtyard Minstrel Boy', 165, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Sail Away to Avalon', 242, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Nature''s Dance', 147, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Computer-Reign (Game Over)', 204, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Waracle', 704, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Listen to the Waves', 298, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Magic Ride', 215, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Merlin''s Will', 200, '1995-10-27');
insert into Songs (name, duration, release_date) values ('The Charm of the Seer', 251, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Swan Song', 164, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Ayreon''s Fate', 415, '1995-10-27');
insert into Songs (name, duration, release_date) values ('Lost', 581, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Raze the Stray', 522, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Burning Flesh in Year of Pig', 97, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Cold Ascending', 224, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Lexicon', 392, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Enemy of the Sun', 453, '1993-08-17');
insert into Songs (name, duration, release_date) values ('The Time of the Beasts', 479, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Cleanse', 953, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Takeahnase', 464, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Cleanse II', 405, '1993-08-17');
insert into Songs (name, duration, release_date) values ('Incomplete', 148, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Leave Mine to Me', 127, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Stranger than Fiction', 140, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Tiny Voices', 156, '1994-09-06');
insert into Songs (name, duration, release_date) values ('The Handshake', 170, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Better Off Dead', 159, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Infected', 248, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Hooray for Me', 170, '1994-09-06');
insert into Songs (name, duration, release_date) values ('Inner Logic', 178, '1994-09-06');
insert into Songs (name, duration, release_date) values ('21st Century', 167, '1994-09-06');


create table Bands (
    bid         bigserial       not null primary key,
    name        varchar(128)    not null,
    founded     date,
    disbanded   date
    );

insert into Bands (name, founded, disbanded) values ('Beatles', '1960-08-15', '1970-12-31');
insert into Bands (name, founded, disbanded) values ('Led Zeppelin', '1968-10-25', '1980-09-25');
insert into Bands (name, founded, disbanded) values ('Jefferson Airplane', '1965-08-13', '1972-09-22');
insert into Bands (name, founded, disbanded) values ('Aerosmith', '1970-11-06', '2017-02-04');
insert into Bands (name, founded, disbanded) values ('Beach Boys', '1961-12-06', '2017-02-04');
insert into Bands (name, founded, disbanded) values ('Ayreon', '1995-01-06', '2017-02-04');
insert into Bands (name, founded, disbanded) values ('Neurosis', '1985-11-06', '2017-02-04');
insert into Bands (name, founded, disbanded) values ('Bad Religion', '1979-11-11', '2017-02-04');

create table Albums (
    aid         bigserial       not null primary key,
    name        varchar(128)    not null,
    band        integer         not null,
    foreign key (band) references Bands(bid)
    );

insert into Albums (name, band) values ('Sgt. Pepper''s Lonely Hearts Club Band', 1);
insert into Albums (name, band) values ('Led Zeppelin IV', 2);
insert into Albums (name, band) values ('Surrealistic Pillow', 3);
insert into Albums (name, band) values ('Greatest Hits (Aerosmith album)', 4);
insert into Albums (name, band) values ('Surfin'' Safari', 5);
insert into Albums (name, band) values ('The Final Experiment', 6);
insert into Albums (name, band) values ('Enemy of the Sun', 7);
insert into Albums (name, band) values ('Stranger than Fiction', 8);


create table AlbumsSongs_Xref (
    aid         bigint      not null,
    sid         bigint      not null,
    foreign key(aid) references Albums(aid),
    foreign key(sid) references Songs(sid),
    primary key(aid,sid)
    );

insert into AlbumsSongs_Xref (aid, sid) values (1, 1);
insert into AlbumsSongs_Xref (aid, sid) values (1, 2);
insert into AlbumsSongs_Xref (aid, sid) values (1, 3);
insert into AlbumsSongs_Xref (aid, sid) values (1, 4);
insert into AlbumsSongs_Xref (aid, sid) values (1, 5);
insert into AlbumsSongs_Xref (aid, sid) values (1, 6);
insert into AlbumsSongs_Xref (aid, sid) values (1, 7);
insert into AlbumsSongs_Xref (aid, sid) values (1, 8);
insert into AlbumsSongs_Xref (aid, sid) values (1, 9);
insert into AlbumsSongs_Xref (aid, sid) values (1, 10);
insert into AlbumsSongs_Xref (aid, sid) values (1, 11);
insert into AlbumsSongs_Xref (aid, sid) values (1, 12);
insert into AlbumsSongs_Xref (aid, sid) values (1, 13);
insert into AlbumsSongs_Xref (aid, sid) values (2, 14);
insert into AlbumsSongs_Xref (aid, sid) values (2, 15);
insert into AlbumsSongs_Xref (aid, sid) values (2, 16);
insert into AlbumsSongs_Xref (aid, sid) values (2, 17);
insert into AlbumsSongs_Xref (aid, sid) values (2, 18);
insert into AlbumsSongs_Xref (aid, sid) values (2, 19);
insert into AlbumsSongs_Xref (aid, sid) values (2, 20);
insert into AlbumsSongs_Xref (aid, sid) values (2, 21);
insert into AlbumsSongs_Xref (aid, sid) values (3, 22);
insert into AlbumsSongs_Xref (aid, sid) values (3, 23);
insert into AlbumsSongs_Xref (aid, sid) values (3, 24);
insert into AlbumsSongs_Xref (aid, sid) values (3, 25);
insert into AlbumsSongs_Xref (aid, sid) values (3, 26);
insert into AlbumsSongs_Xref (aid, sid) values (3, 27);
insert into AlbumsSongs_Xref (aid, sid) values (3, 28);
insert into AlbumsSongs_Xref (aid, sid) values (3, 29);
insert into AlbumsSongs_Xref (aid, sid) values (3, 30);
insert into AlbumsSongs_Xref (aid, sid) values (3, 31);
insert into AlbumsSongs_Xref (aid, sid) values (3, 32);
insert into AlbumsSongs_Xref (aid, sid) values (4, 33);
insert into AlbumsSongs_Xref (aid, sid) values (4, 34);
insert into AlbumsSongs_Xref (aid, sid) values (4, 35);
insert into AlbumsSongs_Xref (aid, sid) values (4, 36);
insert into AlbumsSongs_Xref (aid, sid) values (4, 37);
insert into AlbumsSongs_Xref (aid, sid) values (4, 38);
insert into AlbumsSongs_Xref (aid, sid) values (4, 39);
insert into AlbumsSongs_Xref (aid, sid) values (4, 40);
insert into AlbumsSongs_Xref (aid, sid) values (4, 41);
insert into AlbumsSongs_Xref (aid, sid) values (5, 42);
insert into AlbumsSongs_Xref (aid, sid) values (5, 43);
insert into AlbumsSongs_Xref (aid, sid) values (5, 44);
insert into AlbumsSongs_Xref (aid, sid) values (5, 45);
insert into AlbumsSongs_Xref (aid, sid) values (5, 46);
insert into AlbumsSongs_Xref (aid, sid) values (5, 47);
insert into AlbumsSongs_Xref (aid, sid) values (5, 48);
insert into AlbumsSongs_Xref (aid, sid) values (5, 49);
insert into AlbumsSongs_Xref (aid, sid) values (5, 50);
insert into AlbumsSongs_Xref (aid, sid) values (5, 51);
insert into AlbumsSongs_Xref (aid, sid) values (6, 52);
insert into AlbumsSongs_Xref (aid, sid) values (6, 53);
insert into AlbumsSongs_Xref (aid, sid) values (6, 54);
insert into AlbumsSongs_Xref (aid, sid) values (6, 55);
insert into AlbumsSongs_Xref (aid, sid) values (6, 56);
insert into AlbumsSongs_Xref (aid, sid) values (6, 57);
insert into AlbumsSongs_Xref (aid, sid) values (6, 58);
insert into AlbumsSongs_Xref (aid, sid) values (6, 59);
insert into AlbumsSongs_Xref (aid, sid) values (6, 60);
insert into AlbumsSongs_Xref (aid, sid) values (6, 61);
insert into AlbumsSongs_Xref (aid, sid) values (6, 62);
insert into AlbumsSongs_Xref (aid, sid) values (6, 63);
insert into AlbumsSongs_Xref (aid, sid) values (6, 64);
insert into AlbumsSongs_Xref (aid, sid) values (6, 65);
insert into AlbumsSongs_Xref (aid, sid) values (6, 66);
insert into AlbumsSongs_Xref (aid, sid) values (7, 67);
insert into AlbumsSongs_Xref (aid, sid) values (7, 68);
insert into AlbumsSongs_Xref (aid, sid) values (7, 69);
insert into AlbumsSongs_Xref (aid, sid) values (7, 70);
insert into AlbumsSongs_Xref (aid, sid) values (7, 71);
insert into AlbumsSongs_Xref (aid, sid) values (7, 72);
insert into AlbumsSongs_Xref (aid, sid) values (7, 73);
insert into AlbumsSongs_Xref (aid, sid) values (7, 74);
insert into AlbumsSongs_Xref (aid, sid) values (7, 75);
insert into AlbumsSongs_Xref (aid, sid) values (7, 76);
insert into AlbumsSongs_Xref (aid, sid) values (8, 77);
insert into AlbumsSongs_Xref (aid, sid) values (8, 78);
insert into AlbumsSongs_Xref (aid, sid) values (8, 79);
insert into AlbumsSongs_Xref (aid, sid) values (8, 80);
insert into AlbumsSongs_Xref (aid, sid) values (8, 81);
insert into AlbumsSongs_Xref (aid, sid) values (8, 82);
insert into AlbumsSongs_Xref (aid, sid) values (8, 83);
insert into AlbumsSongs_Xref (aid, sid) values (8, 84);
insert into AlbumsSongs_Xref (aid, sid) values (8, 85);
insert into AlbumsSongs_Xref (aid, sid) values (8, 86);

create table Musicians (
    mid         bigserial   not null primary key,
    name        varchar(64) not null,
    dob         date        not null
    );

insert into Musicians (name, dob) values ('John Lennon', '1940-10-09');
insert into Musicians (name, dob) values ('Paul McCartney', '1942-06-18');
insert into Musicians (name, dob) values ('George Harrison', '1943-02-25');
insert into Musicians (name, dob) values ('Ringo Starr', '1940-07-07');
insert into Musicians (name, dob) values ('Jimmy Page', '1944-01-09');
insert into Musicians (name, dob) values ('Robert Plant', '1948-08-20');
insert into Musicians (name, dob) values ('John Paul Jones', '1946-01-03');
insert into Musicians (name, dob) values ('John Bonham', '1948-05-31');
insert into Musicians (name, dob) values ('Grace Slick', '1939-10-30');
insert into Musicians (name, dob) values ('Paul Kantner', '1941-03-17');
insert into Musicians (name, dob) values ('Marty Balin', '1942-01-30');
insert into Musicians (name, dob) values ('Jorma Kaukonen', '1940-12-23');
insert into Musicians (name, dob) values ('Jack Casady', '1944-04-13');
insert into Musicians (name, dob) values ('Spencer Dryden', '1938-04-07');
insert into Musicians (name, dob) values ('Steven Tyler', '1948-03-26');
insert into Musicians (name, dob) values ('Joe Perry', '1950-09-10');
insert into Musicians (name, dob) values ('Brad Whitford', '1952-02-23');
insert into Musicians (name, dob) values ('Tom Hamilton ', '1951-12-31');
insert into Musicians (name, dob) values ('Joey Kramer', '1950-06-21');
insert into Musicians (name, dob) values ('Brian Wilson', '1942-06-20');
insert into Musicians (name, dob) values ('Dennis Wilson', '1944-12-04');
insert into Musicians (name, dob) values ('Carl Wilson', '1946-12-21');
insert into Musicians (name, dob) values ('Mike Love', '1941-03-15');
insert into Musicians (name, dob) values ('Al Jardine', '1942-09-03');
insert into Musicians (name, dob) values ('Arjen Anthony Lucassen', '1960-04-03');
insert into Musicians (name, dob) values ('Scott Kelly', '1967-06-13');
insert into Musicians (name, dob) values ('Steve Von Till', '1967-06-13');
insert into Musicians (name, dob) values ('Dave Edwardson', '1967-06-13');
insert into Musicians (name, dob) values ('Noah Landis', '1967-06-13');
insert into Musicians (name, dob) values ('Jason Roeder', '1967-06-13');
insert into Musicians (name, dob) values ('Greg Graffin', '1964-11-06');
insert into Musicians (name, dob) values ('Brett Gurewitz', '1962-05-12');
insert into Musicians (name, dob) values ('Jay Bentley', '1964-06-06');
insert into Musicians (name, dob) values ('Brian Baker', '1965-02-25');
insert into Musicians (name, dob) values ('Mike Dimkich', '1968-02-15');


create table MusiciansSongs_Xref (
    mid         bigint      not null,
    sid         bigint      not null,
    foreign key(mid) references Musicians(mid),
    foreign key(sid) references Songs(sid),
    primary key(mid,sid)
    );

insert into MusiciansSongs_Xref (mid, sid) values (1, 1);
insert into MusiciansSongs_Xref (mid, sid) values (1, 2);
insert into MusiciansSongs_Xref (mid, sid) values (1, 3);
insert into MusiciansSongs_Xref (mid, sid) values (1, 4);
insert into MusiciansSongs_Xref (mid, sid) values (1, 5);
insert into MusiciansSongs_Xref (mid, sid) values (1, 6);
insert into MusiciansSongs_Xref (mid, sid) values (1, 7);
insert into MusiciansSongs_Xref (mid, sid) values (1, 8);
insert into MusiciansSongs_Xref (mid, sid) values (1, 9);
insert into MusiciansSongs_Xref (mid, sid) values (1, 10);
insert into MusiciansSongs_Xref (mid, sid) values (1, 11);
insert into MusiciansSongs_Xref (mid, sid) values (1, 12);
insert into MusiciansSongs_Xref (mid, sid) values (1, 13);
insert into MusiciansSongs_Xref (mid, sid) values (2, 1);
insert into MusiciansSongs_Xref (mid, sid) values (2, 2);
insert into MusiciansSongs_Xref (mid, sid) values (2, 3);
insert into MusiciansSongs_Xref (mid, sid) values (2, 4);
insert into MusiciansSongs_Xref (mid, sid) values (2, 5);
insert into MusiciansSongs_Xref (mid, sid) values (2, 6);
insert into MusiciansSongs_Xref (mid, sid) values (2, 7);
insert into MusiciansSongs_Xref (mid, sid) values (2, 8);
insert into MusiciansSongs_Xref (mid, sid) values (2, 9);
insert into MusiciansSongs_Xref (mid, sid) values (2, 10);
insert into MusiciansSongs_Xref (mid, sid) values (2, 11);
insert into MusiciansSongs_Xref (mid, sid) values (2, 12);
insert into MusiciansSongs_Xref (mid, sid) values (2, 13);
insert into MusiciansSongs_Xref (mid, sid) values (3, 1);
insert into MusiciansSongs_Xref (mid, sid) values (3, 2);
insert into MusiciansSongs_Xref (mid, sid) values (3, 3);
insert into MusiciansSongs_Xref (mid, sid) values (3, 4);
insert into MusiciansSongs_Xref (mid, sid) values (3, 5);
insert into MusiciansSongs_Xref (mid, sid) values (3, 6);
insert into MusiciansSongs_Xref (mid, sid) values (3, 7);
insert into MusiciansSongs_Xref (mid, sid) values (3, 8);
insert into MusiciansSongs_Xref (mid, sid) values (3, 9);
insert into MusiciansSongs_Xref (mid, sid) values (3, 10);
insert into MusiciansSongs_Xref (mid, sid) values (3, 11);
insert into MusiciansSongs_Xref (mid, sid) values (3, 12);
insert into MusiciansSongs_Xref (mid, sid) values (3, 13);
insert into MusiciansSongs_Xref (mid, sid) values (4, 1);
insert into MusiciansSongs_Xref (mid, sid) values (4, 2);
insert into MusiciansSongs_Xref (mid, sid) values (4, 3);
insert into MusiciansSongs_Xref (mid, sid) values (4, 4);
insert into MusiciansSongs_Xref (mid, sid) values (4, 5);
insert into MusiciansSongs_Xref (mid, sid) values (4, 6);
insert into MusiciansSongs_Xref (mid, sid) values (4, 7);
insert into MusiciansSongs_Xref (mid, sid) values (4, 8);
insert into MusiciansSongs_Xref (mid, sid) values (4, 9);
insert into MusiciansSongs_Xref (mid, sid) values (4, 10);
insert into MusiciansSongs_Xref (mid, sid) values (4, 11);
insert into MusiciansSongs_Xref (mid, sid) values (4, 12);
insert into MusiciansSongs_Xref (mid, sid) values (4, 13);
insert into MusiciansSongs_Xref (mid, sid) values (5, 14);
insert into MusiciansSongs_Xref (mid, sid) values (5, 15);
insert into MusiciansSongs_Xref (mid, sid) values (5, 16);
insert into MusiciansSongs_Xref (mid, sid) values (5, 17);
insert into MusiciansSongs_Xref (mid, sid) values (5, 18);
insert into MusiciansSongs_Xref (mid, sid) values (5, 19);
insert into MusiciansSongs_Xref (mid, sid) values (5, 20);
insert into MusiciansSongs_Xref (mid, sid) values (5, 21);
insert into MusiciansSongs_Xref (mid, sid) values (6, 14);
insert into MusiciansSongs_Xref (mid, sid) values (6, 15);
insert into MusiciansSongs_Xref (mid, sid) values (6, 16);
insert into MusiciansSongs_Xref (mid, sid) values (6, 17);
insert into MusiciansSongs_Xref (mid, sid) values (6, 18);
insert into MusiciansSongs_Xref (mid, sid) values (6, 19);
insert into MusiciansSongs_Xref (mid, sid) values (6, 20);
insert into MusiciansSongs_Xref (mid, sid) values (6, 21);
insert into MusiciansSongs_Xref (mid, sid) values (7, 14);
insert into MusiciansSongs_Xref (mid, sid) values (7, 15);
insert into MusiciansSongs_Xref (mid, sid) values (7, 16);
insert into MusiciansSongs_Xref (mid, sid) values (7, 17);
insert into MusiciansSongs_Xref (mid, sid) values (7, 18);
insert into MusiciansSongs_Xref (mid, sid) values (7, 19);
insert into MusiciansSongs_Xref (mid, sid) values (7, 20);
insert into MusiciansSongs_Xref (mid, sid) values (7, 21);
insert into MusiciansSongs_Xref (mid, sid) values (8, 14);
insert into MusiciansSongs_Xref (mid, sid) values (8, 15);
insert into MusiciansSongs_Xref (mid, sid) values (8, 16);
insert into MusiciansSongs_Xref (mid, sid) values (8, 17);
insert into MusiciansSongs_Xref (mid, sid) values (8, 18);
insert into MusiciansSongs_Xref (mid, sid) values (8, 19);
insert into MusiciansSongs_Xref (mid, sid) values (8, 20);
insert into MusiciansSongs_Xref (mid, sid) values (8, 21);
insert into MusiciansSongs_Xref (mid, sid) values (9, 22);
insert into MusiciansSongs_Xref (mid, sid) values (9, 23);
insert into MusiciansSongs_Xref (mid, sid) values (9, 24);
insert into MusiciansSongs_Xref (mid, sid) values (9, 25);
insert into MusiciansSongs_Xref (mid, sid) values (9, 26);
insert into MusiciansSongs_Xref (mid, sid) values (9, 27);
insert into MusiciansSongs_Xref (mid, sid) values (9, 28);
insert into MusiciansSongs_Xref (mid, sid) values (9, 29);
insert into MusiciansSongs_Xref (mid, sid) values (9, 30);
insert into MusiciansSongs_Xref (mid, sid) values (9, 31);
insert into MusiciansSongs_Xref (mid, sid) values (9, 32);
insert into MusiciansSongs_Xref (mid, sid) values (10, 22);
insert into MusiciansSongs_Xref (mid, sid) values (10, 23);
insert into MusiciansSongs_Xref (mid, sid) values (10, 24);
insert into MusiciansSongs_Xref (mid, sid) values (10, 25);
insert into MusiciansSongs_Xref (mid, sid) values (10, 26);
insert into MusiciansSongs_Xref (mid, sid) values (10, 27);
insert into MusiciansSongs_Xref (mid, sid) values (10, 28);
insert into MusiciansSongs_Xref (mid, sid) values (10, 29);
insert into MusiciansSongs_Xref (mid, sid) values (10, 30);
insert into MusiciansSongs_Xref (mid, sid) values (10, 31);
insert into MusiciansSongs_Xref (mid, sid) values (10, 32);
insert into MusiciansSongs_Xref (mid, sid) values (11, 22);
insert into MusiciansSongs_Xref (mid, sid) values (11, 23);
insert into MusiciansSongs_Xref (mid, sid) values (11, 24);
insert into MusiciansSongs_Xref (mid, sid) values (11, 25);
insert into MusiciansSongs_Xref (mid, sid) values (11, 26);
insert into MusiciansSongs_Xref (mid, sid) values (11, 27);
insert into MusiciansSongs_Xref (mid, sid) values (11, 28);
insert into MusiciansSongs_Xref (mid, sid) values (11, 29);
insert into MusiciansSongs_Xref (mid, sid) values (11, 30);
insert into MusiciansSongs_Xref (mid, sid) values (11, 31);
insert into MusiciansSongs_Xref (mid, sid) values (11, 32);
insert into MusiciansSongs_Xref (mid, sid) values (12, 22);
insert into MusiciansSongs_Xref (mid, sid) values (12, 23);
insert into MusiciansSongs_Xref (mid, sid) values (12, 24);
insert into MusiciansSongs_Xref (mid, sid) values (12, 25);
insert into MusiciansSongs_Xref (mid, sid) values (12, 26);
insert into MusiciansSongs_Xref (mid, sid) values (12, 27);
insert into MusiciansSongs_Xref (mid, sid) values (12, 28);
insert into MusiciansSongs_Xref (mid, sid) values (12, 29);
insert into MusiciansSongs_Xref (mid, sid) values (12, 30);
insert into MusiciansSongs_Xref (mid, sid) values (12, 31);
insert into MusiciansSongs_Xref (mid, sid) values (12, 32);
insert into MusiciansSongs_Xref (mid, sid) values (13, 22);
insert into MusiciansSongs_Xref (mid, sid) values (13, 23);
insert into MusiciansSongs_Xref (mid, sid) values (13, 24);
insert into MusiciansSongs_Xref (mid, sid) values (13, 25);
insert into MusiciansSongs_Xref (mid, sid) values (13, 26);
insert into MusiciansSongs_Xref (mid, sid) values (13, 27);
insert into MusiciansSongs_Xref (mid, sid) values (13, 28);
insert into MusiciansSongs_Xref (mid, sid) values (13, 29);
insert into MusiciansSongs_Xref (mid, sid) values (13, 30);
insert into MusiciansSongs_Xref (mid, sid) values (13, 31);
insert into MusiciansSongs_Xref (mid, sid) values (13, 32);
insert into MusiciansSongs_Xref (mid, sid) values (14, 22);
insert into MusiciansSongs_Xref (mid, sid) values (14, 23);
insert into MusiciansSongs_Xref (mid, sid) values (14, 24);
insert into MusiciansSongs_Xref (mid, sid) values (14, 25);
insert into MusiciansSongs_Xref (mid, sid) values (14, 26);
insert into MusiciansSongs_Xref (mid, sid) values (14, 27);
insert into MusiciansSongs_Xref (mid, sid) values (14, 28);
insert into MusiciansSongs_Xref (mid, sid) values (14, 29);
insert into MusiciansSongs_Xref (mid, sid) values (14, 30);
insert into MusiciansSongs_Xref (mid, sid) values (14, 31);
insert into MusiciansSongs_Xref (mid, sid) values (14, 32);
insert into MusiciansSongs_Xref (mid, sid) values (15, 33);
insert into MusiciansSongs_Xref (mid, sid) values (15, 34);
insert into MusiciansSongs_Xref (mid, sid) values (15, 35);
insert into MusiciansSongs_Xref (mid, sid) values (15, 36);
insert into MusiciansSongs_Xref (mid, sid) values (15, 37);
insert into MusiciansSongs_Xref (mid, sid) values (15, 38);
insert into MusiciansSongs_Xref (mid, sid) values (15, 39);
insert into MusiciansSongs_Xref (mid, sid) values (15, 40);
insert into MusiciansSongs_Xref (mid, sid) values (15, 41);
insert into MusiciansSongs_Xref (mid, sid) values (16, 33);
insert into MusiciansSongs_Xref (mid, sid) values (16, 34);
insert into MusiciansSongs_Xref (mid, sid) values (16, 35);
insert into MusiciansSongs_Xref (mid, sid) values (16, 36);
insert into MusiciansSongs_Xref (mid, sid) values (16, 37);
insert into MusiciansSongs_Xref (mid, sid) values (16, 38);
insert into MusiciansSongs_Xref (mid, sid) values (16, 39);
insert into MusiciansSongs_Xref (mid, sid) values (16, 40);
insert into MusiciansSongs_Xref (mid, sid) values (16, 41);
insert into MusiciansSongs_Xref (mid, sid) values (17, 33);
insert into MusiciansSongs_Xref (mid, sid) values (17, 34);
insert into MusiciansSongs_Xref (mid, sid) values (17, 35);
insert into MusiciansSongs_Xref (mid, sid) values (17, 36);
insert into MusiciansSongs_Xref (mid, sid) values (17, 37);
insert into MusiciansSongs_Xref (mid, sid) values (17, 38);
insert into MusiciansSongs_Xref (mid, sid) values (17, 39);
insert into MusiciansSongs_Xref (mid, sid) values (17, 40);
insert into MusiciansSongs_Xref (mid, sid) values (17, 41);
insert into MusiciansSongs_Xref (mid, sid) values (18, 33);
insert into MusiciansSongs_Xref (mid, sid) values (18, 34);
insert into MusiciansSongs_Xref (mid, sid) values (18, 35);
insert into MusiciansSongs_Xref (mid, sid) values (18, 36);
insert into MusiciansSongs_Xref (mid, sid) values (18, 37);
insert into MusiciansSongs_Xref (mid, sid) values (18, 38);
insert into MusiciansSongs_Xref (mid, sid) values (18, 39);
insert into MusiciansSongs_Xref (mid, sid) values (18, 40);
insert into MusiciansSongs_Xref (mid, sid) values (18, 41);
insert into MusiciansSongs_Xref (mid, sid) values (19, 33);
insert into MusiciansSongs_Xref (mid, sid) values (19, 34);
insert into MusiciansSongs_Xref (mid, sid) values (19, 35);
insert into MusiciansSongs_Xref (mid, sid) values (19, 36);
insert into MusiciansSongs_Xref (mid, sid) values (19, 37);
insert into MusiciansSongs_Xref (mid, sid) values (19, 38);
insert into MusiciansSongs_Xref (mid, sid) values (19, 39);
insert into MusiciansSongs_Xref (mid, sid) values (19, 40);
insert into MusiciansSongs_Xref (mid, sid) values (19, 41);
insert into MusiciansSongs_Xref (mid, sid) values (20, 42);
insert into MusiciansSongs_Xref (mid, sid) values (20, 43);
insert into MusiciansSongs_Xref (mid, sid) values (20, 44);
insert into MusiciansSongs_Xref (mid, sid) values (20, 45);
insert into MusiciansSongs_Xref (mid, sid) values (20, 46);
insert into MusiciansSongs_Xref (mid, sid) values (20, 47);
insert into MusiciansSongs_Xref (mid, sid) values (20, 48);
insert into MusiciansSongs_Xref (mid, sid) values (20, 49);
insert into MusiciansSongs_Xref (mid, sid) values (20, 50);
insert into MusiciansSongs_Xref (mid, sid) values (20, 51);
insert into MusiciansSongs_Xref (mid, sid) values (21, 42);
insert into MusiciansSongs_Xref (mid, sid) values (21, 43);
insert into MusiciansSongs_Xref (mid, sid) values (21, 44);
insert into MusiciansSongs_Xref (mid, sid) values (21, 45);
insert into MusiciansSongs_Xref (mid, sid) values (21, 46);
insert into MusiciansSongs_Xref (mid, sid) values (21, 47);
insert into MusiciansSongs_Xref (mid, sid) values (21, 48);
insert into MusiciansSongs_Xref (mid, sid) values (21, 49);
insert into MusiciansSongs_Xref (mid, sid) values (21, 50);
insert into MusiciansSongs_Xref (mid, sid) values (21, 51);
insert into MusiciansSongs_Xref (mid, sid) values (22, 42);
insert into MusiciansSongs_Xref (mid, sid) values (22, 43);
insert into MusiciansSongs_Xref (mid, sid) values (22, 44);
insert into MusiciansSongs_Xref (mid, sid) values (22, 45);
insert into MusiciansSongs_Xref (mid, sid) values (22, 46);
insert into MusiciansSongs_Xref (mid, sid) values (22, 47);
insert into MusiciansSongs_Xref (mid, sid) values (22, 48);
insert into MusiciansSongs_Xref (mid, sid) values (22, 49);
insert into MusiciansSongs_Xref (mid, sid) values (22, 50);
insert into MusiciansSongs_Xref (mid, sid) values (22, 51);
insert into MusiciansSongs_Xref (mid, sid) values (23, 42);
insert into MusiciansSongs_Xref (mid, sid) values (23, 43);
insert into MusiciansSongs_Xref (mid, sid) values (23, 44);
insert into MusiciansSongs_Xref (mid, sid) values (23, 45);
insert into MusiciansSongs_Xref (mid, sid) values (23, 46);
insert into MusiciansSongs_Xref (mid, sid) values (23, 47);
insert into MusiciansSongs_Xref (mid, sid) values (23, 48);
insert into MusiciansSongs_Xref (mid, sid) values (23, 49);
insert into MusiciansSongs_Xref (mid, sid) values (23, 50);
insert into MusiciansSongs_Xref (mid, sid) values (23, 51);
insert into MusiciansSongs_Xref (mid, sid) values (24, 42);
insert into MusiciansSongs_Xref (mid, sid) values (24, 43);
insert into MusiciansSongs_Xref (mid, sid) values (24, 44);
insert into MusiciansSongs_Xref (mid, sid) values (24, 45);
insert into MusiciansSongs_Xref (mid, sid) values (24, 46);
insert into MusiciansSongs_Xref (mid, sid) values (24, 47);
insert into MusiciansSongs_Xref (mid, sid) values (24, 48);
insert into MusiciansSongs_Xref (mid, sid) values (24, 49);
insert into MusiciansSongs_Xref (mid, sid) values (24, 50);
insert into MusiciansSongs_Xref (mid, sid) values (24, 51);
insert into MusiciansSongs_Xref (mid, sid) values (25, 52);
insert into MusiciansSongs_Xref (mid, sid) values (25, 53);
insert into MusiciansSongs_Xref (mid, sid) values (25, 54);
insert into MusiciansSongs_Xref (mid, sid) values (25, 55);
insert into MusiciansSongs_Xref (mid, sid) values (25, 56);
insert into MusiciansSongs_Xref (mid, sid) values (25, 57);
insert into MusiciansSongs_Xref (mid, sid) values (25, 58);
insert into MusiciansSongs_Xref (mid, sid) values (25, 59);
insert into MusiciansSongs_Xref (mid, sid) values (25, 60);
insert into MusiciansSongs_Xref (mid, sid) values (25, 61);
insert into MusiciansSongs_Xref (mid, sid) values (25, 62);
insert into MusiciansSongs_Xref (mid, sid) values (25, 63);
insert into MusiciansSongs_Xref (mid, sid) values (25, 64);
insert into MusiciansSongs_Xref (mid, sid) values (25, 65);
insert into MusiciansSongs_Xref (mid, sid) values (25, 66);
insert into MusiciansSongs_Xref (mid, sid) values (26, 67);
insert into MusiciansSongs_Xref (mid, sid) values (26, 68);
insert into MusiciansSongs_Xref (mid, sid) values (26, 69);
insert into MusiciansSongs_Xref (mid, sid) values (26, 70);
insert into MusiciansSongs_Xref (mid, sid) values (26, 71);
insert into MusiciansSongs_Xref (mid, sid) values (26, 72);
insert into MusiciansSongs_Xref (mid, sid) values (26, 73);
insert into MusiciansSongs_Xref (mid, sid) values (26, 74);
insert into MusiciansSongs_Xref (mid, sid) values (26, 75);
insert into MusiciansSongs_Xref (mid, sid) values (26, 76);
insert into MusiciansSongs_Xref (mid, sid) values (27, 67);
insert into MusiciansSongs_Xref (mid, sid) values (27, 68);
insert into MusiciansSongs_Xref (mid, sid) values (27, 69);
insert into MusiciansSongs_Xref (mid, sid) values (27, 70);
insert into MusiciansSongs_Xref (mid, sid) values (27, 71);
insert into MusiciansSongs_Xref (mid, sid) values (27, 72);
insert into MusiciansSongs_Xref (mid, sid) values (27, 73);
insert into MusiciansSongs_Xref (mid, sid) values (27, 74);
insert into MusiciansSongs_Xref (mid, sid) values (27, 75);
insert into MusiciansSongs_Xref (mid, sid) values (27, 76);
insert into MusiciansSongs_Xref (mid, sid) values (28, 67);
insert into MusiciansSongs_Xref (mid, sid) values (28, 68);
insert into MusiciansSongs_Xref (mid, sid) values (28, 69);
insert into MusiciansSongs_Xref (mid, sid) values (28, 70);
insert into MusiciansSongs_Xref (mid, sid) values (28, 71);
insert into MusiciansSongs_Xref (mid, sid) values (28, 72);
insert into MusiciansSongs_Xref (mid, sid) values (28, 73);
insert into MusiciansSongs_Xref (mid, sid) values (28, 74);
insert into MusiciansSongs_Xref (mid, sid) values (28, 75);
insert into MusiciansSongs_Xref (mid, sid) values (28, 76);
insert into MusiciansSongs_Xref (mid, sid) values (29, 67);
insert into MusiciansSongs_Xref (mid, sid) values (29, 68);
insert into MusiciansSongs_Xref (mid, sid) values (29, 69);
insert into MusiciansSongs_Xref (mid, sid) values (29, 70);
insert into MusiciansSongs_Xref (mid, sid) values (29, 71);
insert into MusiciansSongs_Xref (mid, sid) values (29, 72);
insert into MusiciansSongs_Xref (mid, sid) values (29, 73);
insert into MusiciansSongs_Xref (mid, sid) values (29, 74);
insert into MusiciansSongs_Xref (mid, sid) values (29, 75);
insert into MusiciansSongs_Xref (mid, sid) values (29, 76);
insert into MusiciansSongs_Xref (mid, sid) values (30, 67);
insert into MusiciansSongs_Xref (mid, sid) values (30, 68);
insert into MusiciansSongs_Xref (mid, sid) values (30, 69);
insert into MusiciansSongs_Xref (mid, sid) values (30, 70);
insert into MusiciansSongs_Xref (mid, sid) values (30, 71);
insert into MusiciansSongs_Xref (mid, sid) values (30, 72);
insert into MusiciansSongs_Xref (mid, sid) values (30, 73);
insert into MusiciansSongs_Xref (mid, sid) values (30, 74);
insert into MusiciansSongs_Xref (mid, sid) values (30, 75);
insert into MusiciansSongs_Xref (mid, sid) values (30, 76);
insert into MusiciansSongs_Xref (mid, sid) values (31, 77);
insert into MusiciansSongs_Xref (mid, sid) values (31, 78);
insert into MusiciansSongs_Xref (mid, sid) values (31, 79);
insert into MusiciansSongs_Xref (mid, sid) values (31, 80);
insert into MusiciansSongs_Xref (mid, sid) values (31, 81);
insert into MusiciansSongs_Xref (mid, sid) values (31, 82);
insert into MusiciansSongs_Xref (mid, sid) values (31, 83);
insert into MusiciansSongs_Xref (mid, sid) values (31, 84);
insert into MusiciansSongs_Xref (mid, sid) values (31, 85);
insert into MusiciansSongs_Xref (mid, sid) values (31, 86);
insert into MusiciansSongs_Xref (mid, sid) values (32, 77);
insert into MusiciansSongs_Xref (mid, sid) values (32, 78);
insert into MusiciansSongs_Xref (mid, sid) values (32, 79);
insert into MusiciansSongs_Xref (mid, sid) values (32, 80);
insert into MusiciansSongs_Xref (mid, sid) values (32, 81);
insert into MusiciansSongs_Xref (mid, sid) values (32, 82);
insert into MusiciansSongs_Xref (mid, sid) values (32, 83);
insert into MusiciansSongs_Xref (mid, sid) values (32, 84);
insert into MusiciansSongs_Xref (mid, sid) values (32, 85);
insert into MusiciansSongs_Xref (mid, sid) values (32, 86);
insert into MusiciansSongs_Xref (mid, sid) values (33, 77);
insert into MusiciansSongs_Xref (mid, sid) values (33, 78);
insert into MusiciansSongs_Xref (mid, sid) values (33, 79);
insert into MusiciansSongs_Xref (mid, sid) values (33, 80);
insert into MusiciansSongs_Xref (mid, sid) values (33, 81);
insert into MusiciansSongs_Xref (mid, sid) values (33, 82);
insert into MusiciansSongs_Xref (mid, sid) values (33, 83);
insert into MusiciansSongs_Xref (mid, sid) values (33, 84);
insert into MusiciansSongs_Xref (mid, sid) values (33, 85);
insert into MusiciansSongs_Xref (mid, sid) values (33, 86);
insert into MusiciansSongs_Xref (mid, sid) values (34, 77);
insert into MusiciansSongs_Xref (mid, sid) values (34, 78);
insert into MusiciansSongs_Xref (mid, sid) values (34, 79);
insert into MusiciansSongs_Xref (mid, sid) values (34, 80);
insert into MusiciansSongs_Xref (mid, sid) values (34, 81);
insert into MusiciansSongs_Xref (mid, sid) values (34, 82);
insert into MusiciansSongs_Xref (mid, sid) values (34, 83);
insert into MusiciansSongs_Xref (mid, sid) values (34, 84);
insert into MusiciansSongs_Xref (mid, sid) values (34, 85);
insert into MusiciansSongs_Xref (mid, sid) values (34, 86);
insert into MusiciansSongs_Xref (mid, sid) values (35, 77);
insert into MusiciansSongs_Xref (mid, sid) values (35, 78);
insert into MusiciansSongs_Xref (mid, sid) values (35, 79);
insert into MusiciansSongs_Xref (mid, sid) values (35, 80);
insert into MusiciansSongs_Xref (mid, sid) values (35, 81);
insert into MusiciansSongs_Xref (mid, sid) values (35, 82);
insert into MusiciansSongs_Xref (mid, sid) values (35, 83);
insert into MusiciansSongs_Xref (mid, sid) values (35, 84);
insert into MusiciansSongs_Xref (mid, sid) values (35, 85);
insert into MusiciansSongs_Xref (mid, sid) values (35, 86);

create table BandsMusicians_Xref (
    mid         bigint      not null,
    bid         bigint      not null,
    start_date  date        not null,
    end_date    date        not null,
    foreign key (mid) references Musicians(mid),
    foreign key (bid) references Bands(bid),
    primary key(mid,bid,start_date,end_date)
    );

insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (1, 1, '1960-08-15', '1970-12-31');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (2, 1, '1960-08-15', '1970-12-31');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (3, 1, '1960-08-15', '1970-12-31');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (4, 1, '1960-08-15', '1970-12-31');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (5, 2, '1968-10-25', '1980-09-25');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (6, 2, '1968-10-25', '1980-09-25');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (7, 2, '1968-10-25', '1980-09-25');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (8, 2, '1968-10-25', '1980-09-25');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (9, 3, '1965-08-13', '1972-09-22');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (10, 3, '1965-08-13', '1972-09-22');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (11, 3, '1965-08-13', '1972-09-22');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (12, 3, '1965-08-13', '1972-09-22');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (13, 3, '1965-08-13', '1972-09-22');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (14, 3, '1965-08-13', '1972-09-22');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (15, 4, '1970-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (16, 4, '1970-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (17, 4, '1970-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (18, 4, '1970-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (19, 4, '1970-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (20, 5, '1961-12-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (21, 5, '1961-12-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (22, 5, '1961-12-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (23, 5, '1961-12-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (24, 5, '1961-12-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (25, 6, '1995-01-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (26, 7, '1985-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (27, 7, '1985-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (28, 7, '1985-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (29, 7, '1985-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (30, 7, '1985-11-06', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (31, 8, '1979-11-11', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (32, 8, '1979-11-11', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (33, 8, '1979-11-11', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (34, 8, '1979-11-11', '2017-02-04');
insert into BandsMusicians_Xref (mid, bid, start_date, end_date) values (35, 8, '1979-11-11', '2017-02-04');

create table Genres (
    gid         bigserial   not null primary key,
    name        varchar(64) not null
    );

insert into Genres (name) values ('Classic Rock');
insert into Genres (name) values ('70s Rock');
insert into Genres (name) values ('Progressive Metal');
insert into Genres (name) values ('Avant-Garde Metal');
insert into Genres (name) values ('Punk Rock');

create table SongGenres_Xref (
    sid         bigint      not null,
    gid         bigint      not null,
    foreign key (sid) references Songs(sid),
    foreign key (gid) references Genres(gid),
    primary key (sid,gid)
    );

insert into SongGenres_Xref (sid, gid) values (1, 1);
insert into SongGenres_Xref (sid, gid) values (2, 1);
insert into SongGenres_Xref (sid, gid) values (3, 1);
insert into SongGenres_Xref (sid, gid) values (4, 1);
insert into SongGenres_Xref (sid, gid) values (5, 1);
insert into SongGenres_Xref (sid, gid) values (6, 1);
insert into SongGenres_Xref (sid, gid) values (7, 1);
insert into SongGenres_Xref (sid, gid) values (8, 1);
insert into SongGenres_Xref (sid, gid) values (9, 1);
insert into SongGenres_Xref (sid, gid) values (10, 1);
insert into SongGenres_Xref (sid, gid) values (11, 1);
insert into SongGenres_Xref (sid, gid) values (12, 1);
insert into SongGenres_Xref (sid, gid) values (13, 1);
insert into SongGenres_Xref (sid, gid) values (14, 1);
insert into SongGenres_Xref (sid, gid) values (15, 1);
insert into SongGenres_Xref (sid, gid) values (16, 1);
insert into SongGenres_Xref (sid, gid) values (17, 1);
insert into SongGenres_Xref (sid, gid) values (18, 1);
insert into SongGenres_Xref (sid, gid) values (19, 1);
insert into SongGenres_Xref (sid, gid) values (20, 1);
insert into SongGenres_Xref (sid, gid) values (21, 1);
insert into SongGenres_Xref (sid, gid) values (22, 1);
insert into SongGenres_Xref (sid, gid) values (23, 1);
insert into SongGenres_Xref (sid, gid) values (24, 1);
insert into SongGenres_Xref (sid, gid) values (25, 1);
insert into SongGenres_Xref (sid, gid) values (26, 1);
insert into SongGenres_Xref (sid, gid) values (27, 1);
insert into SongGenres_Xref (sid, gid) values (28, 1);
insert into SongGenres_Xref (sid, gid) values (29, 1);
insert into SongGenres_Xref (sid, gid) values (30, 1);
insert into SongGenres_Xref (sid, gid) values (31, 1);
insert into SongGenres_Xref (sid, gid) values (32, 1);
insert into SongGenres_Xref (sid, gid) values (33, 2);
insert into SongGenres_Xref (sid, gid) values (34, 2);
insert into SongGenres_Xref (sid, gid) values (35, 2);
insert into SongGenres_Xref (sid, gid) values (36, 2);
insert into SongGenres_Xref (sid, gid) values (37, 2);
insert into SongGenres_Xref (sid, gid) values (38, 2);
insert into SongGenres_Xref (sid, gid) values (39, 2);
insert into SongGenres_Xref (sid, gid) values (40, 2);
insert into SongGenres_Xref (sid, gid) values (41, 2);
insert into SongGenres_Xref (sid, gid) values (42, 1);
insert into SongGenres_Xref (sid, gid) values (43, 1);
insert into SongGenres_Xref (sid, gid) values (44, 1);
insert into SongGenres_Xref (sid, gid) values (45, 1);
insert into SongGenres_Xref (sid, gid) values (46, 1);
insert into SongGenres_Xref (sid, gid) values (47, 1);
insert into SongGenres_Xref (sid, gid) values (48, 1);
insert into SongGenres_Xref (sid, gid) values (49, 1);
insert into SongGenres_Xref (sid, gid) values (50, 1);
insert into SongGenres_Xref (sid, gid) values (51, 1);
insert into SongGenres_Xref (sid, gid) values (52, 3);
insert into SongGenres_Xref (sid, gid) values (53, 3);
insert into SongGenres_Xref (sid, gid) values (54, 3);
insert into SongGenres_Xref (sid, gid) values (55, 3);
insert into SongGenres_Xref (sid, gid) values (56, 3);
insert into SongGenres_Xref (sid, gid) values (57, 3);
insert into SongGenres_Xref (sid, gid) values (58, 3);
insert into SongGenres_Xref (sid, gid) values (59, 3);
insert into SongGenres_Xref (sid, gid) values (60, 3);
insert into SongGenres_Xref (sid, gid) values (61, 3);
insert into SongGenres_Xref (sid, gid) values (62, 3);
insert into SongGenres_Xref (sid, gid) values (63, 3);
insert into SongGenres_Xref (sid, gid) values (64, 3);
insert into SongGenres_Xref (sid, gid) values (65, 3);
insert into SongGenres_Xref (sid, gid) values (66, 3);
insert into SongGenres_Xref (sid, gid) values (67, 4);
insert into SongGenres_Xref (sid, gid) values (68, 4);
insert into SongGenres_Xref (sid, gid) values (69, 4);
insert into SongGenres_Xref (sid, gid) values (70, 4);
insert into SongGenres_Xref (sid, gid) values (71, 4);
insert into SongGenres_Xref (sid, gid) values (72, 4);
insert into SongGenres_Xref (sid, gid) values (73, 4);
insert into SongGenres_Xref (sid, gid) values (74, 4);
insert into SongGenres_Xref (sid, gid) values (75, 4);
insert into SongGenres_Xref (sid, gid) values (76, 4);
insert into SongGenres_Xref (sid, gid) values (77, 5);
insert into SongGenres_Xref (sid, gid) values (78, 5);
insert into SongGenres_Xref (sid, gid) values (79, 5);
insert into SongGenres_Xref (sid, gid) values (80, 5);
insert into SongGenres_Xref (sid, gid) values (81, 5);
insert into SongGenres_Xref (sid, gid) values (82, 5);
insert into SongGenres_Xref (sid, gid) values (83, 5);
insert into SongGenres_Xref (sid, gid) values (84, 5);
insert into SongGenres_Xref (sid, gid) values (85, 5);
insert into SongGenres_Xref (sid, gid) values (86, 5);

create table Users (
    uid         bigserial       not null primary key,
    username    varchar(64)     not null,
    email_addr  varchar(64)     not null,
    salt        char(36)        not null,
    password    varchar(128)    not null
    );

insert into Users (username, email_addr, salt, password) values ('cunruh', 'cunruh3760@gmail.com', '123', '45678');
insert into Users (username, email_addr, salt, password) values ('mthomson', 'mthomson856@gmail.com', '678', '12345');

create table Playlists (
    pid         bigserial   not null primary key,
    name        varchar(128)    not null,
    created     date        not null,
    modified    date        not null
    );

insert into Playlists (name, created, modified) values ('Marc''s Rock', '2017-02-01', '2017-02-02');
insert into Playlists (name, created, modified) values ('Charle''s Music', '2017-02-25', '2017-02-25');
insert into Playlists (name, created, modified) values ('Charle''s Rock', '2017-02-25', '2017-02-25');

create table UsersPlaylistsSongs_Xref (
       uid      bigint      not null,
       pid      bigint      not null,
       sid      bigint      not null,
    primary key(uid,pid,sid)
    );

insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 1);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 2);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 3);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 9);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 10);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 17);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 20);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 23);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 32);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 33);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 35);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 42);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 46);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 47);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (2, 1, 51);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 52);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 54);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 57);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 60);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 62);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 63);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 66);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 67);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 71);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 72);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 73);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 74);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 79);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 82);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 83);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 2, 86);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 3);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 8);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 11);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 13);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 16);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 20);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 22);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 29);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 32);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 38);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 40);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 42);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 46);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 47);
insert into UsersPlaylistsSongs_Xref (uid, pid, sid) values (1, 3, 51);
