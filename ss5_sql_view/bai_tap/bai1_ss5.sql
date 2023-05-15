create database demo;
use demo;

create table products(
id int auto_increment primary key,
productCode varchar(50) not null,
productName varchar(50) not null,
productPrice int not null,
productAmount int not null,
productDescription varchar(50) not null,
productStatus varchar(50) not null
);