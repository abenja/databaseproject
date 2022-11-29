-- as
SELECT fname AS 'First Name:', lname AS 'Surname:', email AS 'E-Mail:' from Student;
-- or
SELECT studentID, schoolID from Student where schoolID = '1' OR schoolID = '2';
-- and
SELECT studentID, assessorID FROM Examination WHERE passFail = 'Fail' AND examLocation = 'Tampere';
-- aggregate
SELECT SUM(partOSP) FROM Degree_Part WHERE partOSP < 30;
SELECT COUNT(studentID) AS 'Students participating in examination' FROM Examination WHERE examID = '1';
SELECT partID as 'Degree Part', examLocation AS 'Location', COUNT(studentID) AS 'Students in degree part' FROM Examination WHERE partID = '201042' OR partID = '201040' GROUP BY partID;
SELECT assessorID AS 'Assessor', COUNT(studentID) AS 'Participants per assessor' FROM Examination GROUP BY assessorID;
-- group by
SELECT partID AS 'Part', COUNT(studentID) AS 'Participants' FROM Examination GROUP BY partID;
-- left or right join
SELECT CONCAT(STUDENT.fname,' ', STUDENT.lname) AS 'Student name:', SCHOOL.schoolName AS 'School:' FROM Student LEFT JOIN School ON STUDENT.schoolID = School.schoolID;
-- inner join
SELECT STUDENT.fname, STUDENT.lname, SCHOOL.schoolName FROM Student INNER JOIN School ON STUDENT.schoolID = School.schoolID;