CREATE DATABASE QuanLiSinhVien;
USE QuanLiSinhVien;
CREATE TABLE Class(
	ClassID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT
);

CREATE TABLE Student(
	StudentID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Status BIT,
    ClassID INT NOT NULL,
    FOREIGN KEY(ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Subject(
	SubID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK(Credit >=1),
    Status BIT DEFAULT 1
);

CREATE TABLE Mark(
	MarkID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK(Mark BETWEEN 0 AND 100),
	ExamTimes TINYINT DEFAULT 1,
    UNIQUE(SubID,StudentID),
    FOREIGN KEY(SubID) REFERENCES Subject(SubID),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
);

use QuanLiSinhVien;

select * FROM Student;

select * FROM Student where Status=true;

select * from Subject where Credit<10;

select S.StudentID, S.StudentName, C.ClassName from Student S 
join Class C 
on S.ClassID=C.ClassID;

select S.StudentID, S.StudentName, C.ClassName from Student S 
join Class C 
on S.ClassID=C.ClassID
where C.ClassName='A1';

select S.StudentID, S.StudentName, Sub.SubName, M.Mark from Student S
join Mark M
on S.StudentID=M.StudentID
join Subject Sub
on M.SubID=Sub.SubID;

select S.StudentID, S.StudentName, Sub.SubName, M.Mark from Student S
join Mark M
on S.StudentID=M.StudentID
join Subject Sub
on M.SubID=Sub.SubID
where Sub.SubName='CF';