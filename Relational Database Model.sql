CREATE TABLE student (
    stuID VARCHAR(255) PRIMARY KEY,
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    major VARCHAR(255),
    credits INT
);

INSERT INTO student (stuID, lastName, firstName, major, credits)
VALUES
    ('S1001', 'Smith', 'Tom', 'History', 90),
    ('S1002', 'Chin', 'Ann', 'Math', 36),
    ('S1005', 'Lee', 'Perry', 'History', 3),
    ('S1010', 'Burns', 'Edward', 'Art', 63),
    ('S1013', 'McCarthy', 'Owen', 'Math', 42), 
    ('S1015', 'Jones', 'Mary', 'Math', 42),
    ('S1020', 'Rivera', 'Jane', 'CSC', 15);

CREATE TABLE faculty (
    facId SERIAL PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    rank VARCHAR(50)
);

INSERT INTO faculty (name, department, rank) 
VALUES
    ('Adams', 'Art', 'Professor'),
    ('Tanaka', 'CSC', 'Instructor'),
    ('Byrne', 'Math', 'Assistant'),
    ('Smith', 'History', 'Associate'),
    ('Smith', 'CSC', 'Professor');

CREATE TABLE classroom (
    classNumber VARCHAR(255) PRIMARY KEY,
    facId SERIAL REFERENCES faculty(facId), 
    schedule VARCHAR(255),
    room VARCHAR(255)
);

INSERT INTO classroom (classNumber, facId, schedule, room)
VALUES
    ('ART103A', 1, 'MWF9', 'H221'), 
    ('CSC201A', 2, 'TuThF10', 'M110'),
    ('CSC203A', 3, 'MThF12', 'M110'), 
    ('HST205A', 4, 'MWF11', 'H221'),
    ('MTH101B', 4, 'MTuTh9', 'H225'),
    ('MTH103C', 4, 'MWF11', 'H225');

CREATE TABLE enrollTable (
    stuld VARCHAR(255) REFERENCES student(stuID),
    classNumber VARCHAR(255) REFERENCES classroom(classNumber),
    grade VARCHAR(5)
);

INSERT INTO enrollTable (stuld, classNumber, grade)
VALUES
    ('S1001', 'ART103A', 'A'),
    ('S1001', 'HST205A', 'C'),
    ('S1002', 'ART103A', 'D'),
    ('S1002', 'CSC201A', 'F'),
    ('S1002', 'MTH103C', 'B'),
    ('S1010', 'ART103A', NULL),
    ('S1010', 'MTH103C', NULL), 
    ('S1020', 'CSC201A', 'B'),
    ('S1020', 'MTH101B', 'A');

SELECT s.firstName, s.lastName
FROM student s
JOIN enrollTable e ON s.stuID = e.stuld
JOIN classroom c ON e.classNumber = c.classNumber
WHERE c.classNumber = 'ART103A';
