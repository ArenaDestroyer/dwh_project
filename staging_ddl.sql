drop table if exists staging.users;
CREATE TABLE staging.users (
	id int NOT NULL,
	username varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	password varchar(100) NOT NULL,
	created_at VARCHAR(50) not null
);

select * from pg_catalog.pg_available_extensions

CREATE EXTENSION IF NOT EXISTS postgres_fdw SCHEMA staging;


CREATE SERVER users_pg
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'postges_1', dbname 'old', port '5432');

create user mapping for user server users_pg options(
	user 'user',
	password 'user'
);


DROP USER MAPPING IF EXISTS FOR user SERVER users_pg;
DROP SERVER IF EXISTS users_pg CASCADE;

DROP SCHEMA IF EXISTS users_src CASCADE;


CREATE SCHEMA users_src AUTHORIZATION "user";

IMPORT FOREIGN SCHEMA public
FROM SERVER users_pg
INTO users_src;

select * from users_src.users

  CREATE TABLE staging.inventory (
    id SERIAL,
    item_name VARCHAR(255) NOT NULL,
    item_description TEXT,
    item_type VARCHAR(100),
    available_count INT NOT null
);

drop table if exists staging.rental
CREATE TABLE staging.rental (
    rental_id SERIAL,
    user_id INT NOT NULL,
    inventory_id INT NOT NULL,
    rental_date varchar(255) NOT NULL,
    return_date varchar(255)
);
drop table if exists staging.payment;
CREATE TABLE staging.payment (
    payment_id SERIAL,
    rental_id INT NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date varchar(255) NOT NULL,
    payment_method VARCHAR(50) NOT NULL
);

drop procedure if exists staging.inventory_load();
create procedure staging.inventory_load()
as $$
	begin
		delete from staging.inventory;
		
		insert
		into
		staging.inventory
			(id,
			item_name,
			item_description,
			item_type,
			available_count)
		select 
			id,
			item_name,
			item_description,
			item_type,
			available_count
		from users_src.inventory;
	end;
$$ language plpgsql;
call staging.inventory_load();
drop procedure if exists staging.rental_load();
create procedure staging.rental_load()
as $$
	begin
		delete from staging.rental;
		
		insert
		into
		staging.rental
			(rental_id,
			user_id,
			inventory_id,
			rental_date,
			return_date)
		select 
			rental_id,
			user_id,
			inventory_id,
			rental_date,
			return_date
		from users_src.rental;
	end;
$$ language plpgsql;
call staging.rental_load();
drop procedure if exists staging.payment_load();
create procedure staging.payment_load()
as $$
	begin
		delete from staging.payment;
		
		insert
		into
		staging.payment
			(payment_id,
			rental_id,
			payment_amount,
			payment_date,
			payment_method)

		select 
			payment_id,
			rental_id,
			payment_amount,
			payment_date,
			payment_method
		from users_src.payment;
	end;
$$ language plpgsql;
call staging.payment_load();

select * from staging.users order by id desc
select * from users_src.users order by id desc
select * from staging.inventory
select * from users_src.inventory
select * from staging.rental
select * from users_src.rental
select * from staging.payment
select * from users_src.payment





