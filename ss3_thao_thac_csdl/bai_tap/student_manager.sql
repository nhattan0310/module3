create database student_manager;
use student_manager;

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
 ('Hoa', 'Hai phong',null, 1, 1),
 ('Manh', 'HCM', '0123123123', 0, 2);

select * from student;

create table `Subject`(
SubID int auto_increment primary key,
Subname varchar(10) not null,
credit int not null,
`status` varchar(10) not null
-- foreign key(`status`) references student(`status`)
);

INSERT INTO `Subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

select * from `Subject`;

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
       
select * from mark;

-- ---------------------------------------------------

-- hien thi ten bat dau "h"
select * from Student
where Studentname like 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class
where StartDate like '%12%';
 
 -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
 select * from `subject`
 where  credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student 
set Student.ClassID = 2
where Student.Studentname = 'Hung';
select * from Student;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select  StudentName, SubName, Mark
from student 
inner join mark on student.StudentID = mark.StudentID
inner join `subject` on mark.subID = `subject`.subID
ORDER BY mark DESC,
StudentName asc 
;



