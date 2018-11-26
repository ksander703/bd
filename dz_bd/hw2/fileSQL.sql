drop database if exists fileBase;
create database fileBase;
use fileBase;
drop table if exists users;
create table users (
	id serial primary key,
	name varchar(128) not null
) comment = 'пользователь';

drop table if exists files;
create table files (
	id serial primary key,
	user_id int unsigned not null comment 'id пользователя',
	pathFile varchar(256) not null comment 'путь до файла',
	file_id int unsigned comment 'id описания'
) comment = 'файлы';

drop table if exists file_info;
create table file_info (
	id serial primary key,
	name varchar(128) not null,
	description text,
	keywords varchar(256)
) comment = 'инофрмация о файле';

insert into users (name) values 
	('Anatoly'),
	('Ivan');
insert into files (user_id,pathFile,file_id) values
	(1,'../dateFile/audio/despasito.mp3',0),
	(1,'../dateFile/audio/privetkakdela.mp3',1),
	(1,'../dateFile/video/breakinBad(1sesson).mp4',2),
	(2,'../dateFile/audio/hello.mp3',null);
insert into file_info (name, description, keywords) values
	('Песня диспасита',null,'hit'),
	('Привет как дела','T-killah - Привет как дела', null),
	('Во все тяжкие (1 сезон)','Первый сезон всемирно известного сериала во все тяжкие','Serial,world_hit');
	
select * from users;