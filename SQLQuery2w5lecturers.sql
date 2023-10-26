CREATE TABLE [Lecturers] (
[LID] CHAR (4) NOT NULL,
[Fullname] VARCHAR(255),
[Address] VARCHAR(255),
[DOB] DATE,
PRIMARY KEY ([LID])
);

CREATE TABLE [Projects](
[PID] CHAR(4) NOT NULL,
[Title] VARCHAR(255),
[Level] CHAR(1),
[Cost] INT,
PRIMARY KEY ([PID])
);

CREATE TABLE [Participants](
[LID] CHAR(4) NOT NULL,
[PID] CHAR(4) NOT NULL,
[Duration] INT,
PRIMARY KEY ([LID],[PID]),
FOREIGN KEY ([LID]) REFERENCES [Lecturers]([LID]),
FOREIGN KEY ([PID]) REFERENCES [Projects]([PID])
);

INSERT INTO [Lecturers]([LID],[Fullname],[Address],[DOB]) VALUES
('GV01','Vu Tuyet Trinh', 'Hoang Mai, Ha Noi', '10/10/1975'),
('GV02','Nguyen Nhat Quang','Hai Ba Trung, Ha Noi','03/11/1976'),
('GV03','Tran Duc Khanh', 'Dong Da, Ha Noi', '04/06/1977'),
('GV04','Nguyen Hong Phuong','Tay Ho, Ha Noi','10/12/1983'),
('GV05','Le Thanh Huong','Hai Ba Trung, Ha Noi','10/10/1976')

INSERT INTO [Projects]([PID],[Title],[Level],[Cost]) VALUES
('DT01','Grid Computing','A', '700'),
('DT02','Knowledge Discovery','B','300'),
('DT03','Text Classification','B','270'),
('DT04','Automatic English-Vietnamese Translation','C','30')

INSERT INTO [Participants]([LID],[PID],[Duration]) VALUES
('GV01','DT01','100'),
('GV01','DT02','80'),
('GV01','DT03','80'),
('GV02','DT01','120'),
('GV02','DT03','140'),
('GV03','DT03','150'),
('GV04','DT04','180')

--cau 1
SELECT * FROM Lecturers WHERE (Address IN ('Hai Ba Trung, Ha Noi')) ORDER BY Fullname ASC  

SELECT Fullname, Address, DOB FROM Lecturers WHERE LID IN(SELECT LID FROM Participants 
WHERE PID IN(SELECT PID FROM Partipants 
WHERE PID IN  (SELECT PID From Projects 
WHERE Title IN (Title IN 'Grid Computing')))

--cau 2
SELECT Fullname, Address, DOB From Lecturers, Participants, Projects 
WHERE Lecturers.LID=Participants.LID AND Participants.PID=Projects.PID AND Title LIKE '%Grid Computing%'

SELECT Fullname, Address, DOB From Lecturers, Participants, Projects 
WHERE Lecturers.LID=Participants.LID AND Participants.PID=Projects.PID AND (Title LIKE '%Grid Computing%' OR Title LIKE '%Automatic English-Vietnamese Translation%')

--cau 6
SELECT * FROM Projects WHERE Cost<=ALL(SELECT  (Cost) From Projects)

--cau 7
select Fullname, DOB, Title FROM Lecturers, Projects, Participants 
WHERE Lecturers.LID=Participants.LID AND Participants.PID= Projects.PID AND Address LIKE '%Tay Ho%'

--cau 5
select Fullname From Lecturers, Projects, Participants 
WHERE Lecturers.LID=Participants.LID AND Participants.PID=Projects.PID AND  Projects.PID = (SELECT COUNT(Projects.PID) FROM Projects )

--CAU 4
SELECT * FROM Lecturers WHERE LID IN (Select LID FROM Participants GROUP BY LID HAVING (COUNT(PID)>1))

--CAU 5
SELECT * FROM Lecturers 
WHERE LID IN (SELECT LID FROM Participants 
				GROUP BY LID 
				HAVING COUNT(PID)>=ALL(SELECT COUNT(PID) 
												FROM Participants 
												GROUP BY LID))

--cau 7 7.	Show the name and DOB of lecturers who live in "Tay Ho" district and their project's title
SELECT Fullname, DOB, Title 
FROM Lecturers JOIN Participants ON Lecturers.LID=Participants.LID 
JOIN Projects ON Participants.PID=Projects

--CAU 8 8.	Find the name of lecturers who was born before 1980 and joined the "Text Classification" project
SELECT Fullname FROM Lecturers, Participants, Projects
WHERE Lecturers.LID=Participants.LID AND Participants.PID=Projects.PID AND 
Title LIKE '%Text Classification%' And DOB < '01/01/1980'

SELECT Fullname FROM Lecturers, Participants, Projects
WHERE Lecturers.LID=Participants.LID AND Participants.PID=Projects.PID AND 
Title LIKE '%Text Classification%' And YEAR(DOB) < '1980'

SELECT Fullname FROM Lecturers, Participants, Projects
WHERE Lecturers.LID=Participants.LID AND Participants.PID=Projects.PID AND 
Title LIKE '%Text Classification%' And DATEPART(Y,DOB) < '1980'

SELECT DATEPART(Y,DOB) FROM Lecturers WHERE LID='GV01'

SELECT DATEPART(Y, GETDATE())

--cau 9 9.	For each lecturers, list LID, full name and the total of duration. 
SELECT Lecturers.LID , Fullname, Sum(Participants.Duration)
 FROM Lecturers INNER JOIN Participants 
 ON Lecturers.LID=Participants.LID GROUP BY Lecturers.LID, Lecturers.Fullname

--cau 10 10.	Lecturer named Ngo Tuan Phong, born on 08/09/1986, lives in "Dong Da, Hanoi", join doing scientific research.
-- Please insert this information into Lecturers table.
INSERT INTO [Lecturers]([LID],[Fullname],[Address],[DOB]) VALUES
('GV06', 'Ngo Tuan Phong', 'Dong Da, Hanoi', '08/09/1986')

--Cau 11 11.	Lecturer named Vu Tuyet Trinh moved to "Tay Ho, Hanoi". Please update this information.
UPDATE Lecturers SET Address='Tay Ho, Hanoi' WHERE Fullname='Vu Tuyet Trinh'
 Select * from Lecturers 
  
  --cau 12 12.	Lecturer with LID "GV02" no longer participate any projects. 
  --The information relating to this lecturer should be crossed out of database. 
  --Please complete this command.
  DELETE FROM Participants WHERE Participants.LID = 'GV02'
  DELETE FROM Lecturers WHERE Lecturers.LID='GV02'
  SELECT * FROM Lecturers FULL OUTER  JOIN Participants ON  Lecturers.LID=Participants.LID
  
  -- THEM 2 option ON UPDATE CASCADE va ON DELETE CASCADE

  --Cau 13 cho biet thong tin gv tham gia vao tat ca cac de tai
 SELECT * FROM Lecturers WHERE  Lecturers.LID IN 
(SELECT LID FROM Participants
GROUP BY LID HAVING
COUNT(PID)=(SELECT COUNT(PID) FROM Participants))
  --cau 14 cho biet thong tin giang vien tham gia vao tat ca ca de tai level c
  SELECT * FROM Lecturers , Projects, Participants
  WHERE Participants.PID=Projects.PID AND Lecturers.LID=Participants.LID 
   AND Projects.Level = 'C'

SELECT * FROM Lecturers WHERE LID IN 
(SELECT LID FROM Participants, Projects
WHERE Participants.PID=Projects.PID AND Level='C'
GROUP BY LID
HAVING COUNT(Participants.PID)=(SELECT COUNT(PID) FROM Projects WHERE Level='C')) 
 
  --cau 15 cho biet thong tin giang vien chua tham gia de tai nao
  SELECT * FROM Lecturers WHERE(Lecturers.LID NOT IN
  (SELECT Participants.LID FROM Participants))

SELECT * FROM Lecturers WHERE NOT EXISTS(SELECT * FROM Participants WHERE 
Lecturers.LID=Participants.LID)

SELECT * FROM Lecturers LEFT JOIN Participants On Lecturers.LID=Participants.LID WHERE PID IS NULL

SELECT * FROM Lecturers WHERE LID IN ( SELECT LID FROM Lecturers EXCEPT SELECT LID FROM Participants)

  --cau 16 cho biet thong tin giang vien nam nay 48 tuoi
  SELECT * FROM Lecturers WHERE (DATEPART(YYYY,GETDATE())-DATEPART(YYYY,DOB))=48


