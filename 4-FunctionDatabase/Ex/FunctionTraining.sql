use quanlisinhvien;

select Address, Count(StudentID) as "so luong hoc vien"
from Student
group by Address;

select s.StudentID,s.StudentName, AVG(Mark)
from Student s
join Mark m
on s.StudentID=m.StudentID
group by s.StudentID,s.StudentName
having avg(Mark)>15;

select s.StudentID,s.StudentName, AVG(Mark)
from Student s
join Mark m
on s.StudentID=m.StudentID
having avg(Mark)>=All(select avg(mark) from mark group by Mark.StudentID);

