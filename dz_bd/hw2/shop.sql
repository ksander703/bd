
use shop;
drop table if exists catalogs;
create table catalogs (
	id serial primary key,
	name varchar(255) comment 'Название раздела'
) comment = 'Разделы интернет магазина';

insert into catalogs (name) values 
	('Процессоры'),
	('Видекарты'),
	('мониторы'),
	(null),
	('');
update catalogs set name = 'empty'  where name is null;
update catalogs set name = 'empty'  where name = '';
select * from catalogs;

drop table if exists users;
create table users (
	id serial primary key,
	name varchar(255) comment 'Имя покупателя',
	birthday_at date comment 'Дата рождения',
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp
) comment = 'Покупатели';

drop table if exists products;
create table products (
	id serial primary key,
	name varchar(255) comment 'Название',
	description text comment 'Описание',
	prise decimal(11,2) comment 'Цена',
	catalog_id int unsigned,
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp,
	key index_of_catalog_id(catalog_id)
) comment = 'Товарные позиции';

drop table if exists orders;
create table orders (
	id serial primary key,
	user_id int unsigned,
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp,
	key index_of_user_id(user_id)
) comment = 'Заказы';

drop table if exists orders_products;
create table orders_products (
	id SERIAL primary key,
	order_id int unsigned,
	product_id int unsigned,
	total int unsigned default 1 comment 'Количество заказаных товаров',
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp
) comment = 'Состав заказа';

drop table if exists discount;
create table discount (
	id SERIAL primary key,
	user_id int unsigned,
	product_id int unsigned,
	discount float unsigned comment 'Скидка от 0.0 до 1.0',
	started_at datetime,
	finished_at datetime,
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp,
	key index_of_user_id(user_id),
	key index_of_product_id(product_id)
) comment = 'Скидки';

drop table if exists storehouses;
create table storehouses (
	id SERIAL primary key,
	name varchar(255) comment 'название',
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp
) comment = 'Склады';

drop table if exists storehouses_products;
create table storehouses_products (
	id SERIAL primary key,
	storehous_id int unsigned,
	product_id int unsigned,
	value int unsigned comment 'Запас товарной позиции на складе',
	create_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp on update CURRENT_timestamp
) comment = 'Запасы на складе';