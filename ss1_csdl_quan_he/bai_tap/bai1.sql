create database a0822;
use a0822;

create table class(
id varchar(10)primary key,
name varchar(50)
);

-- insert into class values
-- ('SV001', 'Tan');

 create table teacher(
 id varchar(10)primary key,
name varchar(50),
age varchar(2),
country varchar(15)
);
 
 insert into teacher values
('SV002', 'Linh','30','FSoft');

update teacher
set name ='Huy' where id ='SV002';

delete from teacher where id ='SV002';

CREATE TABLE `a0822`.`member` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

 
 select*from teacher;