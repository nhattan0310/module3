create database QuanLySinhVien;
use QuanLySinhVien;

create table Class(
ClassID int auto_increment primary key,
Classname varchar(10) not null,
StartDate datetime not null,
`status` varchar(10) not null
);

INSERT INTO Class (Classname,StartDate,`status`)
values ('A1', '2008-12-20', 1),
('A2', '2008-12-22', 1),
('B3', current_date, 0);

create table Student(
StudentID int auto_increment primary key,
Studentname varchar(10) not null,
address varchar(50)not null,
phone varchar(10),
`status` varchar(10) not null,
ClassID int not null
);

INSERT INTO Student (Studentname, address, phone, `status`, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
 ('Hoa', 'Hai phong','null', 1, 1),
 ('Manh', 'HCM', '0123123123', 0, 2);

create table `Subject`(
subID int auto_increment primary key,
subname varchar(10) not null,
credit int not null,
`status` varchar(10) not null
);

INSERT INTO `Subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

create table Mark(
MarkID int auto_increment primary key,
subID int not null,
studentID int not null,
mark int not null,
examTimes int not null
);

INSERT INTO Mark (subId, studentId, mark, examTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- -------------------------------------------------------------

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `Subject`
where  credit >=ALL (select credit from `Subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
-- select subname from `Subject` where max(mark) AS Largestmark 

select subname,mark
from `Subject` s 
inner join mark m on s.subID = m.subID;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

