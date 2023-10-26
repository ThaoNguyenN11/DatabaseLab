CREATE DATABASE [CompanySupplyProduct];

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
  FOREIGN KEY ([CompanyID]) REFERENCES [Company]([CompanyID]), on update cascade on delete cascade 
  FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])
);
DROP TABLE Company
DROP TABLE Product
DROP TABLE Supply

===============================================================
--Company

INSERT INTO [Company]([Name],[NumberofEmployee],[Address],[Telephone],[EstablishmentDay])
VALUES('Kia','33255','Seoul, Korea','123067483','1941-12-01'),
('Vinfast','3000','LongBien, Hanoi','0912354321','2017-06-20'),
('Chevrolet','20000','Michigan, US','0985647321','1911-11-03'),
('Audi','53347','Ingolstadt, Germany','8456732102','1909-04-25'),
('Ford','213000','Michigan, US','0543291852','1903-03-16'),
('Ferrari','17000','Maranello, Italy','0974635218','1929-05-18'),
('Mazda','36626','Hiroshima, Japan','0234967541','1920-01-01'),
('Lexus','12000','Aichi, Japan','02345678432','1989-01-20'),
('Honda','131600','Tokyo, Japan','02345678321','1948-09-24'),
('BMW','102007','Munchen, Germany','8456987342','1916-03-07'),
('Land Rover','9000','Coventry, UK','064532181','1948-04-09'),
('Jaguar','3000','London, UK','098453621','2008-02-06'),
('Rolls Royce','4000','London, UK','0985647321','1906-05-14'),
('Porsche','8000','Baden-Wurttemberg, Germany','09875643245','1931-08-26'),
('Mercedes Benz','12000','Baden-Wurttemberg, Germany','09877453621','1926-06-28'),
('Peugeot','11230','Paris, France','067598432','1882-08-03'),
('Toyota','299210','Tokyo, Japan','098453621','1937-08-02')



--Product
INSERT INTO [Product]([Name],[Color],[Price])
VALUES('Standard MT 2019','brown','299'),
('Standard AT 2019','green','339'),
('Luxury 2019','yellow','393'),
('Deluxe 2019','yellow','355'),
('Fadil Standard','brown','395'),
('Fadil Plus','violet','429'),
('Lux A2.0 Standard','pink','990'),
('Lux A2.0 Premium','black','1228'),
('Lux SA2.0 Premium','black','1688'),
('Peugeot 3008 All ','red','1199'),
('Peugeot 5008 2019','white','1349'),
('Peugeot 208','red','850'),
('C200 Exclusive 2019','black','1709'),
('Mercedes C300 AMG','black','1897'),
('Mercedes E200 Sport 2019','white','2317'),
('Mercedes S450 L 2019','blue','4249'),
('Audi A3 1.4L Sportback','white','1520'),
('A4 2.0L','white','1670'),
('A6 1.8 TFSI','blue','2270'),
('Wigo 1.2G 2019','orange','405'),
('Vios 1.5E CVT','red','540'),
('Avanza 1.5G AT','grey','612'),
('Porsche 718 Boxster S','red','4540'),
('Porsche 718 Cayman S','green','4420'),
('Porsche 911 Carrera S Cabriolet','grey','7770'),
('Porsche 911 GT3 RS ','blue','11060'),
('hatchback Premium SE','red','604'),
('sedan Premium','red','564')


--Supply
INSERT INTO [Supply]([CompanyID],[ProductID],[Quantity])
VALUES('1','1','2029'),
('1','2','6116'),
('1','4','3661'),
('1','6','4940'),
('1','7','6000'),
('2','1','2815'),
('2','2','5218'),
('2','7','2482'),
('3','9','755'),
('3','11','5352'),
('3','18','537'),
('3','28','1727'),
('3','22','5504'),
('4','1','1716'),
('4','2','689'),
('5','3','4973'),
('5','4','4897'),
('6','5','6512'),
('7','6','1912'),
('7','7','5461'),
('7','8','2318'),
('7','9','3872'),
('7','10','3763'),
('7','11','1622'),
('8','12','4367'),
('8','13','2894'),
('8','14','4017'),
('8','15','2957'),
('9','16','5926'),
('9','17','2170'),
('9','18','5815'),
('9','19','4722'),
('9','20','5832'),
('10','21','1642'),
('11','22','5019'),
('12','23','6031'),
('13','24','2758'),
('13','25','5927'),
('13','26','771'),
('14','27','1494'),
('14','28','4499'),
('15','1','773'),
('15','3','4402'),
('15','5','3802'),
('15','8','4027'),
('15','12','2136'),
('15','13','2345'),
('15','17','5278')


1
SELECT * FROM Company
SELECT Name, NumberofEmployee, Address FROM Company
SELECT Address FROM Company
SELECT DISTINCT Address FROM Company
SELECT * FROM Company WHERE Address = 'Tokyo, Japan'
SELECT * FROM Company WHERE CompanyID != 12
SELECT * FROM Company WHERE Address = 'London, UK' AND NumberofEmployee>3500
SELECT * FROM Company WHERE Address = 'London, UK' OR Address = 'Michigan, US'
SELECT * FROM Company WHERE NOT Address = 'London, UK'
SELECT * FROM Company WHERE NumberofEmployee > 3500 AND( Address = 'Tokyo, Japan' OR Address = 'London, UK')
SELECT * FROM Company ORDER BY Name 
SELECT * FROM Company ORDER BY Address, NumberofEmployee
SELECT * FROM Company ORDER BY Address ASC, NumberofEmployee DESC
SELECT TOP 3 * FROM Company
SELECT TOP 60 PERCENT * FROM Company
SELECT TOP 3 * FROM Company ORDER BY NumberofEmployee DESC
SELECT * FROM Company WHERE Name LIKE '___'
SELECT * FROM Company WHERE Name LIKE '[HL]%'
SELECT * FROM Company WHERE Name LIKE '[A-F]%'
SELECT * FROM Company WHERE Name LIKE '[^A-F]%'
SELECT * FROM Product WHERE Color IN('red','blue','white')
SELECT * FROM Product WHERE Color NOT IN('red','blue','white')
SELECT * FROM Company WHERE CompanyID IN(SELECT CompanyID FROM Supply)
SELECT * FROM Company WHERE CompanyID NOT IN(SELECT CompanyID FROMSupply)
SELECT * FROM Product WHERE Price BETWEEN 4000 AND 12000;
SELECT * FROM Company WHERE EstablishmentDay BETWEEN '1940/01/01' AND '2000/01/01'
SELECT CompanyID AS ID, Name AS Title FROM Company
SELECT Name AS 'Tên công ty', NumberofEmployee AS 'Số nhân viên'FROM Company
SELECT Name AS [Tên công ty], NumberofEmployee AS [Số nhân viên]FROM Company
SELECT c.* FROM Company AS c WHERE c.Address LIKE '%Japan%'
SELECT c.CompanyID, Name, ProductID FROM Company c, Supply s WHERE c.CompanyID = s.CompanyID

SELECT Company.Name, Product.Name, Quantity FROM Company INNER JOIN Supply
ON Company.CompanyID = Supply.CompanyID INNER JOIN Product ON Supply.ProductID = Product.ProductID 
SELECT Company.CompanyID, Name, ProductID
FROM Company INNER JOIN Supply ON Company.CompanyID = Supply.CompanyID
SELECT A.Name, B.Name
FROM Company A, Company B
WHERE A.CompanyID <> B.CompanyID
AND A.Address = B.Address
SELECT CompanyID FROM Supply
WHERE ProductID = 1
UNION SELECT CompanyID FROM Supply WHERE ProductID = 2
SELECT CompanyID FROM Supply WHERE ProductID = 1
INTERSECT SELECT CompanyID FROM Supply WHERE ProductID = 2
SELECT COUNT(CompanyID), Address
FROM Company
GROUP BY Address
HAVING COUNT(CompanyID)>1

SELECT  Address, COUNT(CompanyID) As Qty FROM Company GROUP BY Address

SELECT COUNT(CompanyID), Address
FROM Company
GROUP BY Address
HAVING COUNT(CompanyID)>1

SELECT DISTINCT Company.Name FROM Company
WHERE NOT EXISTS(SELECT ProductID FROM Supply WHERE Company.CompanyID = Supply.CompanyID)

--cho biet thong tin san pham co gia cao nhat--
SELECT * FROM Product WHERE  Price<=ALL(SELECT Price From Product)

SELECT * FROM Product WHERE  Price<=ANY(SELECT Price From Product)

SELECT CompanyID, ProductID,
CASE
WHEN Quantity <1000 THEN 'Small'
WHEN Quantity <3000 THEN 'Medium'
ELSE 'Large'
END AS Size
FROM Supply 

SELECT 2^3

SELECT MAX(Price) FROM Product

select * from Product where Price = (select MAX(price) from product)

SELECT COUNT(CompanyID) FROM Company

SELECT COUNT(CompanyID), Address FROM Company GROUP BY Address

SELECT AVG(Quantity) FROM Supply WHERE (CompanyID=15)

SELECT SUM(NumberofEmployee) FROM Company WHERE Address LIKE '%Japan%'

SELECT * FROM Company FULL OUTER JOIN Supply
ON Company.CompanyID = Supply.CompanyID  WHERE Name>=ALL(SELECT Name FROM Company)

SELECT  * FROM Product FULL OUTER JOIN Supply ON Supply.ProductID=Product.ProductID WHERE  Price<(SELECT MAX(Price) FROM Product) DESC

--1.	Find the information about the companies which located in London
SELECT * FROM Company WHERE Address LIKE '%London%'

--2.	Print the name, colour and price of the product that its
-- color is 'black' and its price is above 5000
SELECT name, color, price FROM Product WHERE Price>500

--3.	Find the name and telephone number of the companies that
-- provided products whose color is 'red'
SELECT * FROM Company WHERE CompanyID IN 
(SELECT ProductID FROM Product, Supply WHERE 
Product.ProductID=Supply.SupplyID AND Color = 'red'
group by ProductID
HAVING COUNT(Product.ProductID)=(SELECT COUNT(ProductID) FROM Supply WHERE Color='red') )

--4.	Find the company which provided both products of 'blue' and 'black' color.
SELECT * FROM COMPANY WHERE CompanyID IN (
	SELECT CompanyID FROM Supply WHERE ProductID IN(
		SELECT ProductID FROM Product WHERE Color LIKE '%bl%'))

--5.	Print the name of the item which is the most expensive.

SELECT Name FROM Product WHERE  Price<=ALL(SELECT Price From Product)

SELECT Name FROM Product JOIN (SELECT MAX(Price) maxprice FROM Product) tmax
ON tmax.maxprice=Price

SELECT Name FROM Product WHERE Price = (SELECT Max(Price) FROM Product)



--6.	Print the company identity which provided at least two products
SELECT CompanyID FROM Company WHERE Company 

SELECT CompanyID FROM Supply GROUP BY CompanyID HAVING COUNT (ProductID)>=2

--7.	Print the name of the company that provided all 'blue' products
SELECT Name FROM Company WHERE CompanyID IN (SELECT CompanyID FROM Supply GROUP BY CompanyID HAVING COUNT ((CompanyID)>ID WHERE Color IN (SELECT Color FROM Supply) like '%yellow%')

SELECT c.Name FROM Company c JOIN Supply s on c.CompanyID=s.CompanyID JOIN Product p on s.ProductID=p.ProductID 
WHERE Color='yellow' GROUP BY c.Name HAVING COUNT (p.ProductID)=(SELECT COUNT(ProductID) FROM Product WHERE Color ='yellow')

SELECT Name FROM Company WHERE CompanyID IN ()

--find the name of the copmany that only prodvided brown items 
SELECT 

--8.	Find the name of the company which deliverred the most products
select Name from Company JOIN Supply on Company.CopmanyID=Supply.CompanyID 

select name from company where companyid in (select companyid from supply group by companyid having count(productid)>=all(select count(productid)from supply group by companyid))

select name from company where companyid in (select companyid from supply group by companyid having sum(quantity)>=all(select sum(quantity)from supply group by companyid))

--9.	Give information about the identity, the name of the company and the average number of items that the company provided, order by the average number descending.
select c.name, c.companyid, avg(quantity) tb from company c join supply s on c.companyid=s.companyid group by c.companyid, c.name order by tb desc

--10.	Create a new table has the same content with Product table using "select into" statement.
SELECT * INTO Newtable FROM Product
select * from newtable

--11.	The company whose identity is '1' moved its headquarter to a new place 'Hanoi, Vietnam'. Please update this information.
UPDATE Company SET Address = 'Hanoi' WHERE CompanyID = 1
--12.	The company whose identity is '14' went into bankruptcy. Remove all information about this company and its distribution from the database.
delete from supply where companyid=12
delete from company where 
--13.	Write the statement to back-up this database.
BACKUP DATABASE testDB TO DISK = 'D:\backups\testDB.bak';
