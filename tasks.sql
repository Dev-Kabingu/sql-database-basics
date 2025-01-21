
-- database creation 
create database KirinyagaUniversity;
use KirinyagaUniversity;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    DepartmentHead VARCHAR(100)
);

-- Create Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert records into Departments table
INSERT INTO Departments (DepartmentName, DepartmentHead)
VALUES
('Computer Science', 'Dr. John Doe'),
('Information Technology', 'Dr. Jane Smith'),
('Software Engineering', 'Dr. Alice Johnson'),
('Business Administration', 'Dr. Robert Brown'),
('Mechanical Engineering', 'Dr. Emily Davis'),
('Electrical Engineering', 'Dr. Michael Miller'),
('Civil Engineering', 'Dr. Sarah Wilson'),
('Biotechnology', 'Dr. David Anderson'),
('Physics', 'Dr. Lisa Martinez'),
('Mathematics', 'Dr. Mark Jackson');

-- Insert records into Students table
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, DepartmentID)
VALUES
('Alice', 'Kariuki', '2001-01-15', 'alice.kariuki@gmail.com', 1),
('Bob', 'Mwangi', '2000-02-20', 'bob.mwangi@gmail.com', 2),
('Carol', 'Wanjiru', '1999-03-25', 'carol.wanjiru@gmail.com', 3),
('David', 'Njenga', '1998-04-30', 'david.njenga@gmail.com', 4),
('Eva', 'Wambui', '2002-05-05', 'eva.wambui@gmail.com', 5),
('Frank', 'Njoroge', '2001-06-10', 'frank.njoroge@gmail.com', 6),
('Grace', 'Mutua', '2000-07-15', 'grace.mutua@gmail.com', 7),
('Henry', 'Kimani', '1999-08-20', 'henry.kimani@gmail.com', 8),
('Ivy', 'Mumbi', '2002-09-25', 'ivy.mumbi@gmail.com', 9),
('Jack', 'Ochieng', '2001-10-30', 'jack.ochieng@gmail.com', 10);

-- Insert records into Courses table
INSERT INTO Courses (CourseName, CourseDescription, DepartmentID)
VALUES
('Introduction to Computer Science', 'Basics of computer science principles and programming.', 1),
('Database Systems', 'Design, implementation, and management of database systems.', 1),
('Web Development', 'Creating and maintaining websites using various technologies.', 2),
('Software Engineering', 'Principles and practices of software development.', 3),
('Business Management', 'Fundamentals of managing business operations.', 4),
('Thermodynamics', 'Study of energy, heat, and work in mechanical systems.', 5),
('Circuit Analysis', 'Understanding and analyzing electrical circuits.', 6),
('Structural Engineering', 'Design and analysis of structures such as buildings and bridges.', 7),
('Genetic Engineering', 'Manipulation of organisms at the genetic level.', 8),
('Quantum Mechanics', 'Study of the physical principles governing quantum phenomena.', 9);

-- Insert records into Enrollment table
INSERT INTO Enrollment (StudentID, CourseID, EnrollmentDate, Grade)
VALUES
(1, 1, '2023-01-10', 'A'),
(2, 2, '2023-02-15', 'B'),
(3, 3, '2023-03-20', 'A'),
(4, 4, '2023-04-25', 'C'),
(5, 5, '2023-05-30', 'B'),
(6, 6, '2023-06-05', 'A'),
(7, 7, '2023-07-10', 'B'),
(8, 8, '2023-08-15', 'A'),
(9, 9, '2023-09-20', 'C'),
(10, 10, '2023-10-25', 'B');

-- List of Students Enrolled in Each Course
select Students.FirstName, Students.LastName, Courses.CourseName
from Students
inner join Courses on Students.DepartmentID = Courses.DepartmentId; 

-- or
SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Enrollment
INNER JOIN Students ON Enrollment.StudentID = Students.StudentID
INNER JOIN Courses ON Enrollment.CourseID = Courses.CourseID;

/* Students with Their Departments */
SELECT Students.FirstName, Students.LastName, Departments.DepartmentName
FROM Students
INNER JOIN Departments ON Students.DepartmentID = Departments.DepartmentID;

/* Students Not Enrolled in Any Course */
SELECT Students.FirstName, Students.LastName
FROM Students
LEFT JOIN Enrollment ON Students.StudentID = Enrollment.StudentID
WHERE Enrollment.StudentID IS NULL;

/* Students Enrolled in a Specific Course ("Database Systems") */
SELECT Students.FirstName, Students.LastName
FROM Enrollment
INNER JOIN Students ON Enrollment.StudentID = Students.StudentID
INNER JOIN Courses ON Enrollment.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Database Systems';