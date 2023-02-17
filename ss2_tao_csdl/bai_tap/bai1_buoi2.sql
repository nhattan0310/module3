create database chuyen_doi_ERD;
use chuyen_doi_ERD;

create table vat_tu(
ma_VTU int auto_increment primary key,
ten_VTU varchar(50) not null
);

create table phieu_xuat(
so_px int auto_increment primary key,
ngay_xuat int not null
);

create table chi_tiet_phieu_xuat(
dg_xuat int not null,
sl_xuat int not null,
ma_VTU int  not null,
so_px int  not null,
foreign key(ma_VTU) references vat_tu(ma_VTU),
foreign key(so_px) references phieu_xuat(so_px)
);

create table phieu_nhap(
so_pn int  auto_increment primary key,
ngay_nhap int not null
);

create table chi_tiet_phieu_nhap(
dg_nhap int not null,
sl_nhap int not null,
ma_VTU int  not null,
so_pn int  not null,
foreign key(ma_VTU) references vat_tu(ma_VTU),
foreign key(so_pn) references phieu_nhap(so_pn)
);

create table don_dh(
so_dh int  auto_increment primary key,
ngay_dh int not null,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table chi_tiet_don_dat_hang(
ma_VTU int  not null,
so_dh int not null ,
foreign key(ma_VTU) references vat_tu(ma_VTU),
foreign key(so_dh) references don_dh(so_dh)
);

create table nha_cc(
ma_ncc varchar(10) not null,
ten_ncc varchar(50) not null,
address varchar(50) not null,
sdt int not null
);
