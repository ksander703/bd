use shop;
TRUNCATE table catalogs;
insert into catalogs (name) values 
	('Процессоры'),
	('Видеокарты'),
	('Мониторы');
drop database if exists sample;
create database sample;
use sample;
create table cat (
	id serial primary key,
	name varchar(255) comment 'Название раздела'
) comment = 'Разделы интернет магазина';
insert into cat (name) values ('indel');
/* команда для перезаписи данных в таблице cat */
insert into cat(id,name) select * from shop.catalogs on DUPLICATE key update name = values(name);
select * from cat;