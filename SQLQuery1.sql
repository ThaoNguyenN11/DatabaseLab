 
CREATE DATABASE 
CREATE TABLE [Company] (
  [CompanyID] int IDENTITY(1,1),
  [Name] varchar(40),
  [NumberofEmployee] int,
  [Address] varchar(50),
  [Telephone] char(15),
  [EstablishmentDay] date,
  PRIMARY KEY ([CompanyID])
);


CREATE TABLE [Product] (
  [ProductID] int IDENTITY(1,1),
  [Name] varchar(40),
  [Color] char(14),
  [Price] decimal(10,2),
 PRIMARY KEY ([ProductID])
);



CREATE TABLE [Supply] (
  [CompanyID] int,
  [ProductID] int,
  [Quantity] int,
  PRIMARY KEY([CompanyID],[ProductID]),
  FOREIGN KEY ([CompanyID]) REFERENCES [Company]([CompanyID]),
  FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])
);

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