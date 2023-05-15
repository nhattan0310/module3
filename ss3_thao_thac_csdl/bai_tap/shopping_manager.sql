create database manager_shopping;
use  manager_shopping;

create table customer(
cID int  auto_increment primary key,
cName varchar(50) not null,
cAge int not null
);

create table `order`(
oID int  auto_increment primary key,
cID int  not null,
oDate date not null ,
oTotalPrice int(50) ,
foreign key(cID) references customer(cID)
);

create table product(
pID int  auto_increment primary key,
pName varchar(50) not null,
pPrice int not null
);

create table orderdetail(
oID int not null  ,
pID int  not null  ,
odQTY int(50),
foreign key(oID) references `order`(oID),
foreign key(pID) references product(pID)
);

-- add_data----------------------------
INSERT INTO customer
VALUES (1, 'Minh Quan',  10);
INSERT INTO customer
VALUES (2, 'Ngoc Oanh',  20);
INSERT INTO customer
VALUES (3, 'Hong Ha', 50);


INSERT INTO `order`(cID,oDate,oTotalPrice)
VALUES (1,'2006/3/21',null),(2, '2006/3/23',null),(1,'2006/3/16',null);

INSERT INTO product(pName,pPrice)
VALUES( 'May Giat',  3),('Tu Lanh',  5),('Dieu Hoa', 7), ('Quat', 1), ('Bep Dien', 2);

insert into orderdetail(oID,pID,odQTY)
values(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select * from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
Select  cName,pName
from customer c 
inner join `order` o on c.cID = o.cID
inner join orderdetail o_d on o_d.oID = o.oID
inner join product p on p.pID = o_d.pID 
;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName from customer 
where cName not in(Select  cName
from customer c 
inner join `order` o on c.cID = o.cID);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select o.oID,o.oDate, sum(o_d.odQTY * p.pPrice ) totalPrice
from `order` o
inner join orderdetail o_d on o_d.oID = o.oID
inner join product p on p.pID = o_d.pID
group by o.oId;

-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

