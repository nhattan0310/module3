create database bai2_buoi2;
use bai2_buoi2;

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