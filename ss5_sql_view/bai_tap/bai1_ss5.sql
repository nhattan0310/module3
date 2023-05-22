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

insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
value ('123qwe','TiVi',100,1,'Authentic','No Description'),
 ('223qwe','TuLanh',100,2,'Fake','Made in China'),
 ('323qwe','DienThoai',100,3,'Authentic','No Description')
;

select * from products;

create index `unique` on products(productCode);

create index `composite` on products(productName,productPrice);	

CREATE VIEW viewdata AS
SELECT productCode, productName, productPrice, productStatus
FROM  products;