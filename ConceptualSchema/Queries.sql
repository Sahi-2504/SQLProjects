-- creating database
use soddiraj ;

-- Dropping Tables from Database;
DROP TABLE `teaching`;
DROP TABLE `emp_dep`;
DROP TABLE `non_teaching`;
DROP TABLE `phone_number`;
DROP TABLE `room_type`;
DROP TABLE `measurementinfo`;
DROP TABLE `emp_email`;
DROP TABLE `room`;
DROP TABLE `department`;
DROP TABLE `emp`;
DROP TABLE `building`;




-- Tables Creation 
-- building
CREATE TABLE `building` (
  `bId` INT NOT NULL,
  `bName` VARCHAR(45) NOT NULL,
  `b_Room_Count` INT NOT NULL,
  `bFloorCount` INT NOT NULL,
  PRIMARY KEY (`bId`));

-- department
CREATE TABLE `department` (
  `dId` INT NOT NULL AUTO_INCREMENT,
  `dName` VARCHAR(45) NOT NULL,
  `dWebAddress` VARCHAR(45) NOT NULL,
  `dPhoneNumber` INT NOT NULL,
  `dEmailAddress` VARCHAR(45) NOT NULL,
  `dstreet` VARCHAR(45) NOT NULL,
  `dCity` VARCHAR(45) NOT NULL,
  `dZipCode` VARCHAR(45) NOT NULL,
  `dState` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dId`))
ENGINE = InnoDB;

--  Employee
CREATE TABLE `emp` (
  `eId` INT NOT NULL,
  `eDob` VARCHAR(45) NOT NULL,
  `eName` VARCHAR(45) NULL,
  PRIMARY KEY (`eId`));
  
  -- Room 
CREATE TABLE `room` (
  `rId` int NOT NULL,
  `bId` int NOT NULL,
  `rArea` int NOT NULL,
  PRIMARY KEY (`rId`,`bId`),
  KEY `building_num_idx` (`bId`),
  CONSTRAINT `building_num` FOREIGN KEY (`bId`) REFERENCES `building` (`bId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
  
 --  emp_dep
CREATE TABLE `emp_dep` (
  `eId` int NOT NULL,
  `dId` int NOT NULL,
  `id` int NOT NULL,
  `rId` int NOT NULL,
  `bId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eid_idx` (`eId`),
  KEY `dId_idx` (`dId`),
  KEY `worksAt_idx` (`rId`,`bId`),
  CONSTRAINT `dId` FOREIGN KEY (`dId`) REFERENCES `department` (`dId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eId` FOREIGN KEY (`eId`) REFERENCES `emp` (`eId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `worksAt` FOREIGN KEY (`rId`, `bId`) REFERENCES `room` (`rId`, `bId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- emp_email
CREATE TABLE `emp_email` (
  `empId` int DEFAULT NULL,
  `eEmailAdd` varchar(45) DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- measurement_info
CREATE TABLE `measurementinfo` (
  `rId` int DEFAULT NULL,
  `bId` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sound` int DEFAULT NULL,
  `light` int DEFAULT NULL,
  `temp` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `measureAt_idx` (`rId`,`bId`),
  CONSTRAINT `room_id` FOREIGN KEY (`rId`, `bId`) REFERENCES `room` (`rId`, `bId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- non_teaching
CREATE TABLE `non_teaching` (
  `N.T.Id` int NOT NULL,
  `E.Id` int DEFAULT NULL,
  `Skills` varchar(45) NOT NULL,
  PRIMARY KEY (`N.T.Id`),
  KEY `Non_Teaching_idx` (`E.Id`),
  CONSTRAINT `Non_Teaching` FOREIGN KEY (`E.Id`) REFERENCES `emp` (`eId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- phone_number
CREATE TABLE `phone_number` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_Number` varchar(45) NOT NULL,
  `rId` int DEFAULT NULL,
  `bId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_phn_idx` (`rId`,`bId`),
  CONSTRAINT `room_phn` FOREIGN KEY (`rId`, `bId`) REFERENCES `room` (`rId`, `bId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- room_type
CREATE TABLE `room_type` (
  `id` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `rId` int NOT NULL,
  `bId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roomType_idx` (`rId`,`bId`),
  CONSTRAINT `roomType` FOREIGN KEY (`rId`, `bId`) REFERENCES `room` (`rId`, `bId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --teaching
CREATE TABLE `teaching` (
  `T.Id` int NOT NULL,
  `eId` int NOT NULL,
  `Subject` varchar(45) NOT NULL,
  PRIMARY KEY (`T.Id`),
  KEY `Teaching_idx` (`eId`),
  CONSTRAINT `Teaching` FOREIGN KEY (`eId`) REFERENCES `emp` (`eId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data
INSERT INTO `building` (`bId`, `bName`, `b_Room_Count`, `bFloorCount`) VALUES (98,'yx',5,5),(123,'abc',2,1),(234,'def',1,2),(345,'ghi',3,3),(456,'jkl',3,4),(567,'mno',1,2),(678,'pqr',2,3),(789,'stu',2,1),(890,'vwx',4,3);
INSERT INTO `emp` (`eId`, `eDob`, `eName`) VALUES (2001,'1/1/1990','name1'),(2002,'2/2/1991','name2'),(2003,'3/3/1997','name3'),(2004,'23/1/1982','name4'),(2005,'21/1/1981','name5'),(2006,'22/2/1980','name6'),(2007,'27/2/1989','name7'),(2008,'25/04/1997','name8'),(2009,'7/8/1990','name9'),(2010,'9/1/1990','name10');
INSERT INTO `department` (`dId`, `dName`, `dWebAddress`, `dPhoneNumber`, `dEmailAddress`, `dstreet`, `dCity`, `dZipCode`, `dState`) VALUES (1,'da','d1.com',12345,'d1@gmail.com','s1','c1','1001','st1'),(2,'db','d2.com',2345,'d2@gmail.com','s2','c2','1002','st1'),(3,'dc','d3.com',4567,'d3@gmail.com','s3','c3','1001','st1'),(4,'dd','d4.com',5678,'d4@gmail.com','s4','c4','1002','st1'),(5,'de','d5.com',6789,'d5@gmail.com','s5','c1','1003','st1'),(6,'df','d6.com',8901,'d6@gmail.com','s1','c1','1004','st2'),(7,'dg','d7.com',9901,'d7@gmail.com','s1','c2','1001','st2'),(8,'dh','d8.com',9902,'d8@gmail.com','s2','c3','1002','st2'),(9,'di','d9.com',9903,'d9@gmail.com','s3','c2','1003','st2'),(10,'dk','d10.com',9905,'d10@gmail.com','s4','c3','1004','st2');
INSERT INTO `room` (`rId`, `bId`, `rArea`) VALUES (3001,123,1234),(3002,123,1244),(3002,234,1235),(3003,345,1236),(3004,456,1237),(3005,567,1238),(3006,678,1239),(3007,789,1240),(3008,890,1241),(3009,98,1242),(3010,123,1243);
INSERT INTO `emp_email` (`empId`, `eEmailAdd`, `id`) VALUES (2001,'2001_1@gmail.com',11),(2001,'2001_2@gmail.com',12),(2002,'2002_3@gmail.com',13),(2002,'2002_4@gmail.com',14),(2002,'2002_5@gmail.com',15),(2003,'2003_2@gmail.com',16),(2003,'2003_3@gmail.com',17),(2004,'2003_2@gmail.com',18),(2004,'2003_3@gmail.com',19),(2004,'2003_4@gmail.com',20);
INSERT INTO `measurementinfo` (`rId`, `bId`, `date`, `sound`, `light`, `temp`, `id`, `time`) VALUES (3001,123,'2001-01-01',231,331,12,21,'9:30'),(3002,234,'2001-01-02',232,332,13,22,'10:30'),(3003,345,'2001-01-03',233,333,14,23,'11:30'),(3004,456,'2001-01-04',234,334,15,24,'12:30'),(3005,567,'2001-01-05',235,335,16,25,'13:30'),(3006,678,'2001-01-08',236,336,17,26,'14:30'),(3007,789,'2001-01-09',237,337,18,27,'15:30'),(3008,890,'2001-01-10',238,338,19,28,'16:30'),(3009,98,'2001-01-11',239,339,20,29,'17:30'),(3001,123,'2001-01-01',240,345,35,30,'10:30'),(3003,345,'2001-01-01',250,231,NULL,31,'10:30'),(3004,456,'2001-01-01',239,123,NULL,32,'10:30');
INSERT INTO `room_type` (`id`, `type`, `rId`, `bId`) VALUES (1,'lab',3001,123),(2,'office',3002,234),(3,'lab',3003,345),(4,'conference',3004,456),(5,'office',3005,567),(6,'office',3001,123),(7,'lab',3002,234),(8,'conference',3003,345),(9,'lab',3004,456),(10,'lab',3005,567);
INSERT INTO `non_teaching` (`N.T.Id`, `E.Id`, `Skills`) VALUES (111,2001,'plumbing'),(112,2002,'plumbing'),(113,2003,'plumbing'),(114,2004,'plumbing'),(115,2005,'plumbing'),(116,2006,'clerk'),(117,2007,'clerk'),(118,2008,'admin'),(119,2009,'admin'),(120,2010,'admin');
INSERT INTO `phone_number` (`id`, `phone_Number`, `rId`, `bId`) VALUES (41,'123456',3001,123),(42,'234567',3002,234),(43,'345678',3003,345),(44,'456789',3004,456),(45,'456790',3005,567),(46,'456791',3001,123),(47,'456792',3002,234),(48,'456793',3003,345),(49,'456794',3004,456),(50,'456795',3005,567);
INSERT INTO `emp_dep` (`eId`, `dId`, `id`, `rId`, `bId`) VALUES (2001,1,1,3001,123),(2002,2,2,3002,234),(2003,3,3,3003,345),(2004,1,4,3004,456),(2005,2,5,3005,567),(2001,3,6,3001,123),(2002,1,7,3002,234),(2003,2,8,3003,345),(2004,3,9,3004,456),(2005,4,10,3005,567);
INSERT INTO `teaching` (`T.Id`, `eId`, `Subject`) VALUES (1,2001,'Maths'),(2,2002,'Maths'),(3,2003,'Maths'),(4,2004,'Maths'),(5,2005,'Science'),(6,2006,'Science'),(7,2007,'Science'),(8,2008,'Science'),(9,2009,'Science');
-- 1.List the phone number and department name and street address for each department.
select dName,dPhoneNumber,dstreet from department;

-- 2. Count the number of rooms for each building

select b.bId,count(r.rId) from
building b inner join room r
on b.bId = r.bId
Group by b.bId;

-- 3. Find the building name and the room number of each lab that is also used as office
select X.*
from
(
select rId,bID
 from room_type
 where type='lab'
) X
join
( 
select rId,bID
 from room_type
 where type='office'
) Y on X.rId=Y.rId and X.bId=Y.bId;



-- 4. Find the average temperature for each room. 
select rId,bId,avg(temp)
from measurementinfo
group by rId,bId;

-- 5.Find the area of each conference room that hasn’t had any temperature recorded yet.

select r.rArea
from room r inner join room_type  rt on r.rid = rt.rid
      inner join measurementinfo m on m.rId = r.rId and m.bId = r.bId
where lower(rt.type) = 'conference' and temp is null;


-- 6.Find the id of each employee who has exactly two email addresses.
select e.eId,count(em.eEmailAdd) from
emp e inner join emp_email em  on e.eId = em.empId
group by e.eId
having count(eEmailAdd) = 2;



