/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 5.0.45-community-nt : Database - prisonhouse
*********************************************************************
Server version : 5.0.45-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `prisonhouse`;

USE `prisonhouse`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `casedetails` */

DROP TABLE IF EXISTS `casedetails`;

CREATE TABLE `casedetails` (
  `Caseid` int(10) NOT NULL auto_increment,
  `CaseType` varchar(50) default NULL COMMENT 'Civil,Criminal',
  `CaseDetails` text,
  `CourtName` varchar(100) default NULL,
  `CourtAddress` text,
  `JudgeName` varchar(100) default NULL,
  `JudgementDate` date default NULL,
  `CaseStartDate` date default NULL,
  `VictimsDetails` text,
  `exhibits` text,
  `evidenceDetails` text,
  `PrisonerId` int(10) default NULL,
  PRIMARY KEY  (`Caseid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `casedetails` */

insert  into `casedetails`(`Caseid`,`CaseType`,`CaseDetails`,`CourtName`,`CourtAddress`,`JudgeName`,`JudgementDate`,`CaseStartDate`,`VictimsDetails`,`exhibits`,`evidenceDetails`,`PrisonerId`) values (1,'Civil','OK','OK','OK','OK','2008-10-01','2008-10-30','OK','OK','OK',3),(2,'Civil','ok','ok','ok','ok','2008-10-31','2008-10-01','ok','ok','ok',4),(3,'Civil','OK','OK','OKK','NSA','2008-10-30','2008-10-15','test','test','test',5),(4,'Civil','OK','NA','NA','NA','2008-10-01','2007-10-01','NA','NA','NA',6);

/*Table structure for table `dutyregister` */

DROP TABLE IF EXISTS `dutyregister`;

CREATE TABLE `dutyregister` (
  `DutyId` int(11) NOT NULL auto_increment,
  `StaffId` int(10) default NULL,
  `DutyOn` date default NULL,
  `ShiftStartsAt` time default NULL,
  `ShiftEndsAt` time default NULL,
  `DutyAs` varchar(50) default NULL COMMENT 'Centry/Outpost/General/Escort',
  PRIMARY KEY  (`DutyId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `dutyregister` */

insert  into `dutyregister`(`DutyId`,`StaffId`,`DutyOn`,`ShiftStartsAt`,`ShiftEndsAt`,`DutyAs`) values (1,1,'2008-10-01','10:00:00','18:00:00','Centry'),(2,2,'2008-10-01','11:00:00','19:00:00','General'),(3,2,'2008-10-31','05:30:00','07:45:00','General'),(4,1,'2008-10-30','04:30:00','12:45:00','Centry'),(5,1,'2008-10-30','04:15:00','11:45:00','Centry');

/*Table structure for table `inoutregister` */

DROP TABLE IF EXISTS `inoutregister`;

CREATE TABLE `inoutregister` (
  `InoutId` int(11) NOT NULL auto_increment,
  `PrisonerId` int(10) default NULL,
  `StaffId` int(10) default NULL,
  `InTime` datetime default NULL,
  `OutTime` datetime default NULL,
  `Purpose` varchar(255) default NULL,
  PRIMARY KEY  (`InoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `inoutregister` */

insert  into `inoutregister`(`InoutId`,`PrisonerId`,`StaffId`,`InTime`,`OutTime`,`Purpose`) values (1,1,1,'2008-09-08 12:00:00','2008-10-02 17:00:00','Case Hearing'),(3,1,1,'2008-10-30 19:00:00','2008-10-30 09:00:00','Case Hearing'),(4,1,1,'2008-10-31 13:30:00','2008-10-31 07:15:00','case hearing'),(5,2,2,'2008-10-31 15:15:00','2008-10-31 08:15:00','ok');

/*Table structure for table `interviewrequests` */

DROP TABLE IF EXISTS `interviewrequests`;

CREATE TABLE `interviewrequests` (
  `InterviewId` int(11) NOT NULL auto_increment,
  `RequestDate` date default NULL,
  `RequestedBy` varchar(50) default NULL,
  `PrisonerId` int(10) default NULL,
  `Relationship` varchar(30) default NULL,
  `Address` varchar(255) default NULL,
  `TimeslotFrom` varchar(10) default NULL,
  `TimeslotTo` varchar(10) default NULL,
  `StaffId` int(10) default NULL,
  `RequestStatus` varchar(20) default NULL,
  `Purpose` varchar(30) default NULL COMMENT 'GeneralMeeting,Interview',
  PRIMARY KEY  (`InterviewId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `interviewrequests` */

insert  into `interviewrequests`(`InterviewId`,`RequestDate`,`RequestedBy`,`PrisonerId`,`Relationship`,`Address`,`TimeslotFrom`,`TimeslotTo`,`StaffId`,`RequestStatus`,`Purpose`) values (1,'2008-09-30','Steev',1,'Friend','Hyd','11:30','13:30',2,'Approved','Friendly Visit'),(2,'2008-09-29','John',2,'Friend','OKA','09:00','10:00',2,'Requested','OK'),(3,'2008-09-30','Rihanna',1,'Friend','UKAA','02:30','03:00',2,'Approved','OK'),(4,'2008-09-30','Jim',1,'OK','OK','00:00','00:00',1,'Approved','Ok'),(5,'2008-10-31','Om',1,'Friend','Oklahama','00:00','00:00',2,'Requested',''),(6,'2008-10-31','ok',2,'ok','ok','02:30','03:15',1,'Requested','ok');

/*Table structure for table `locationdetails` */

DROP TABLE IF EXISTS `locationdetails`;

CREATE TABLE `locationdetails` (
  `LocationId` int(11) NOT NULL auto_increment,
  `StationCode` varchar(255) default NULL COMMENT 'Town/City Name',
  `Location` varchar(100) default NULL,
  `State` varchar(100) default NULL,
  PRIMARY KEY  (`LocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `locationdetails` */

insert  into `locationdetails`(`LocationId`,`StationCode`,`Location`,`State`) values (1,'Panjagutta','Hyderabad','AP'),(2,'Erragadda','Hyderabad','AP'),(3,'SR Nagar','Hyderabad','AP');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `UserId` varchar(25) default NULL,
  `Password` varchar(10) default NULL,
  `Auth` varchar(10) default 'User'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`UserId`,`Password`,`Auth`) values ('admin','admin','Admin'),('Sri','Sri','User'),('Staff','Staff','Staff');

/*Table structure for table `menu_base` */

DROP TABLE IF EXISTS `menu_base`;

CREATE TABLE `menu_base` (
  `MenuId` int(11) NOT NULL,
  `label` varchar(100) default NULL,
  `Description` varchar(255) default NULL,
  PRIMARY KEY  (`MenuId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu_base` */

insert  into `menu_base`(`MenuId`,`label`,`Description`) values (0,'None','Represents nothing'),(1,'HOME','Tab'),(2,'PRISONERS','Tab'),(3,'IN-OUT','Tab'),(4,'ADMIN','Tab'),(5,'REPORTS','Tab'),(6,'STAFF ','Tab'),(8,'View Prisoners','Prisoners'),(9,'New Entry','Prisoners'),(11,'Delete Entry','Prisoners'),(12,'IN-OUT Register','IN-OUT'),(13,'Make Entry','IN-OUT'),(14,'Delete Entry','IN-OUT'),(15,'Add User','ADMIN'),(16,'View User','ADMIN'),(17,'Delete User','ADMIN'),(18,'View Staff data','STAFF'),(19,'Add Staff Member','STAFF'),(20,'Duty Register','STAFF'),(21,'Delete Staff Member','STAFF'),(25,'View Users','ManageUsers'),(26,'Today\'s Duties','Reports'),(27,'Today\'s Releases','Reports'),(28,'Today\'s Interview slots','Reports'),(29,'Today\'s IN-OUT','Reports'),(31,'INTERVIEWS','Tab'),(32,'View Requests','INTERVIEWS'),(33,'Validate Requests','INTERVIEWS'),(34,'Provide Slot','INTERVIEWS'),(35,'Make Request','INTERVIEWS'),(36,'Delete Requests','INTERVIEWS'),(37,'PAROLE','Tab'),(38,'View Parole','PAROLE'),(39,'Make Parole Request','PAROLE'),(40,'Delete Parole','PAROLE'),(41,'Validate Parole','PAROLE');

/*Table structure for table `menu_frame_executable_mapping` */

DROP TABLE IF EXISTS `menu_frame_executable_mapping`;

CREATE TABLE `menu_frame_executable_mapping` (
  `Sno` int(11) NOT NULL auto_increment COMMENT 'serial number',
  `MenuRelationshipId` int(11) default NULL COMMENT 'FK to Menu_Base table',
  `TargetFrame` varchar(100) default NULL COMMENT 'Target frame where the corresponding executable will be displayed',
  `Executable` varchar(255) default NULL COMMENT 'This contains the jsp pages that needs to be called on Target frame when this menu is clicked',
  PRIMARY KEY  (`Sno`),
  KEY `FK_menu_frame_executable_mapping` (`MenuRelationshipId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `menu_frame_executable_mapping` */

insert  into `menu_frame_executable_mapping`(`Sno`,`MenuRelationshipId`,`TargetFrame`,`Executable`) values (1,1,'MainFrame','Body.jsp'),(2,2,'MainFrame','ViewPrisoners.jsp'),(3,3,'MainFrame','INOUTRegister.jsp'),(4,4,'MainFrame','ManageUsers.jsp'),(5,5,'MainFrame','TodayDutyRegister.jsp'),(6,6,'MainFrame','ViewStaffData.jsp'),(8,8,'MainFrame','ViewPrisoners.jsp'),(9,9,'MainFrame','AddPrisoner.jsp'),(11,11,'MainFrame','DeletePrisoner.jsp'),(12,12,'MainFrame','INOUTRegister.jsp'),(13,13,'MainFrame','NewINOUTEntry.jsp'),(14,14,'MainFrame','DeleteINOUTEntry.jsp'),(15,15,'MainFrame','AddNewUser.jsp'),(16,16,'MainFrame','ViewUsers.jsp'),(17,17,'MainFrame','DeleteUser.jsp'),(18,18,'MainFrame','ViewStaffData.jsp'),(19,19,'MainFrame','AddNewStaffMember.jsp'),(20,20,'MainFrame','DutyRegister.jsp'),(21,21,'MainFrame','DeleteStaffMember.jsp'),(25,25,'MainFrame','ViewUsers.jsp'),(26,26,'MainFrame','TodayDutyRegister.jsp'),(27,27,'MainFrame','TodayReleases.jsp'),(28,28,'MainFrame','TodayInterviewSlots.jsp'),(29,29,'MainFrame','TodayINOUT.jsp'),(38,1,'LeftPane','LeftPane.jsp?MenuId=1&Title='),(39,2,'LeftPane','LeftPane.jsp?MenuId=2&Title=Prisoners'),(40,3,'LeftPane','LeftPane.jsp?MenuId=3&Title=IN-OUT Register'),(41,4,'LeftPane','LeftPane.jsp?MenuId=4&Title=Admin'),(42,5,'LeftPane','LeftPane.jsp?MenuId=5&Title=Reports'),(43,6,'LeftPane','LeftPane.jsp?MenuId=6&Title=Staff'),(45,31,'MainFrame','ViewRequests.jsp'),(46,31,'LeftPane','LeftPane.jsp?MenuId=31&Title=Interview Requests'),(47,32,'MainFrame','ViewRequests.jsp'),(48,33,'MainFrame','ValidateRequests.jsp'),(49,34,'MainFrame','ProvideSlot.jsp'),(50,35,'MainFrame','MakeRequest.jsp'),(51,36,'MainFrame','DeleteRequest.jsp'),(52,37,'MainFrame','ViewParole.jsp'),(53,37,'LeftPane','LeftPane.jsp?MenuId=37&Title=Parole'),(54,38,'MainFrame','ViewParole.jsp'),(55,39,'MainFrame','MakeParoleRequest.jsp'),(56,40,'MainFrame','DeleteParole.jsp'),(57,41,'MainFrame','ValidateParole.jsp');

/*Table structure for table `menu_role_relationship` */

DROP TABLE IF EXISTS `menu_role_relationship`;

CREATE TABLE `menu_role_relationship` (
  `MenuRelationshipId` int(11) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Description` varchar(255) default NULL,
  PRIMARY KEY  (`MenuRelationshipId`,`Role`),
  KEY `FK_menu_role_relationship` (`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu_role_relationship` */

insert  into `menu_role_relationship`(`MenuRelationshipId`,`Role`,`Description`) values (1,'Admin','Admin user menu'),(1,'Staff','Staff Menu'),(1,'User','User Menu'),(2,'Admin','Admin user menu'),(2,'Staff','Staff Menu'),(2,'User','User Menu'),(3,'Admin','Admin user menu'),(3,'Staff','Staff Menu'),(3,'User','User Menu'),(4,'Admin','Admin user menu'),(5,'Admin','Admin user menu'),(5,'Staff','Staff Menu'),(5,'User','User Menu'),(6,'Admin','Admin user menu'),(6,'Staff','Staff Menu'),(7,'Admin','Admin user menu'),(7,'Staff','Staff Menu'),(7,'User','User Menu'),(8,'Admin','Admin user menu'),(8,'Staff','Staff Menu'),(8,'User','User Menu'),(9,'Admin','Admin user menu'),(9,'Staff','Staff Menu'),(11,'Admin','Admin user menu'),(11,'Staff','Staff Menu'),(12,'Admin','Admin user menu'),(12,'Staff','Staff Menu'),(12,'User','User Menu'),(13,'Admin','Admin user menu'),(13,'Staff','Staff Menu'),(14,'Admin','Admin user menu'),(14,'Staff','Staff Menu'),(15,'Admin','Admin user menu'),(16,'Admin','Admin user menu'),(17,'Admin','Admin user menu'),(18,'Admin','Admin user menu'),(18,'Staff','Staff Menu'),(19,'Admin','Admin user menu'),(19,'Staff','Staff Menu'),(20,'Admin','Admin user menu'),(20,'Staff','Staff Menu'),(21,'Admin','Admin user menu'),(21,'Staff','Staff Menu'),(22,'Admin','Admin user menu'),(22,'Staff','Staff Menu'),(22,'User','User Menu'),(23,'Admin','Admin user menu'),(23,'Staff','Staff Menu'),(23,'User','User Menu'),(24,'Admin','Admin user menu'),(24,'Staff','Staff Menu'),(24,'User','User Menu'),(25,'Admin','Admin user menu'),(25,'Staff','Staff Menu'),(25,'User','User Menu'),(26,'Admin','Admin user menu'),(26,'Staff','Staff Menu'),(26,'User','User Menu'),(27,'Admin','Admin user menu'),(27,'Staff','Staff Menu'),(27,'User','User Menu'),(28,'Admin','Admin user menu'),(28,'Staff','Staff Menu'),(28,'User','User Menu'),(29,'Admin','Admin user menu'),(29,'Staff','Staff Menu'),(29,'User','User Menu'),(31,'Admin','Admin user menu'),(31,'Staff','Staff Menu'),(31,'User','User Menu'),(32,'Admin','Admin user menu'),(32,'Staff','Staff Menu'),(32,'User','User Menu'),(33,'Admin','Admin user menu'),(33,'Staff','Staff Menu'),(34,'Admin','Admin user menu'),(34,'Staff','Staff Menu'),(35,'Admin','Admin user menu'),(35,'Staff','Staff Menu'),(35,'User','User Menu'),(36,'Admin','Admin user menu'),(36,'Staff','Staff Menu'),(37,'Admin','Admin user menu'),(37,'Staff','Staff Menu'),(37,'User','User Menu'),(38,'Admin','Admin user menu'),(38,'Staff','Staff Menu'),(38,'User','User Menu'),(39,'Admin','Admin user menu'),(39,'Staff','Staff Menu'),(39,'User','User Menu'),(40,'Admin','Admin user menu'),(40,'Staff','Staff Menu'),(41,'Admin','Admin user menu'),(41,'Staff','Staff Menu');

/*Table structure for table `menuitem_relationship` */

DROP TABLE IF EXISTS `menuitem_relationship`;

CREATE TABLE `menuitem_relationship` (
  `MenuRelationshipId` int(11) NOT NULL auto_increment,
  `ParentMenuId` int(11) default NULL,
  `childMenuId` int(11) default NULL,
  `RelationshipDescription` varchar(255) default NULL,
  `MenuLevel` int(11) default '0',
  PRIMARY KEY  (`MenuRelationshipId`),
  KEY `FK_menuitem_relationship` (`ParentMenuId`),
  KEY `FK_menuitem_relationship1` (`childMenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `menuitem_relationship` */

insert  into `menuitem_relationship`(`MenuRelationshipId`,`ParentMenuId`,`childMenuId`,`RelationshipDescription`,`MenuLevel`) values (1,0,1,'Home',0),(2,0,2,'Prisoners',0),(3,0,3,'IN-OUT',0),(4,0,4,'Admin',0),(5,0,5,'Reports',0),(6,0,6,'Staff',0),(8,2,8,NULL,1),(9,2,9,NULL,1),(11,2,11,NULL,1),(12,3,12,NULL,1),(13,3,13,NULL,1),(14,3,14,NULL,1),(15,4,15,NULL,1),(16,4,16,NULL,1),(17,4,17,NULL,1),(18,6,18,NULL,1),(19,6,19,NULL,1),(20,6,20,NULL,1),(21,6,21,NULL,1),(23,6,23,NULL,1),(24,6,24,NULL,1),(26,5,26,'',1),(27,5,27,'',1),(28,5,28,'',1),(29,5,29,'',1),(31,0,31,'',0),(32,31,32,'',1),(33,31,33,'',1),(34,31,34,'',1),(35,31,35,'',1),(36,31,36,'',1),(37,0,37,'Parole',0),(38,37,38,'',1),(39,37,39,'',1),(40,37,40,'',1),(41,37,41,'',1);

/*Table structure for table `parole` */

DROP TABLE IF EXISTS `parole`;

CREATE TABLE `parole` (
  `paroleid` int(11) NOT NULL auto_increment,
  `PrisonerId` int(10) default NULL,
  `StaffId` int(10) default NULL,
  `RequestDate` date default NULL,
  `Reason` varchar(255) default NULL,
  `Status` varchar(50) default 'Requested' COMMENT 'Requested/Approved/Rejected/Pending',
  `ApprovalDate` varchar(20) default '0000-00-00',
  `From` date default NULL,
  `To` date default NULL,
  `ApprovedBy` varchar(100) default NULL,
  PRIMARY KEY  (`paroleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `parole` */

insert  into `parole`(`paroleid`,`PrisonerId`,`StaffId`,`RequestDate`,`Reason`,`Status`,`ApprovalDate`,`From`,`To`,`ApprovedBy`) values (1,1,1,'2008-10-01','Sick','Approved','2008-10-30','2008-10-15','2008-10-30','admin'),(2,2,2,'2008-10-15','ok','Rejected','2008-10-29','2008-10-01','2008-10-31','admin'),(3,3,2,'2008-10-30','ok','Approved','2008-10-15','2008-11-01','2008-10-31','admin');

/*Table structure for table `prisoners` */

DROP TABLE IF EXISTS `prisoners`;

CREATE TABLE `prisoners` (
  `PrisonerId` int(11) NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `Age` int(3) default NULL,
  `caseid` int(10) default NULL,
  `FromDate` date default NULL,
  `ToDate` date default NULL,
  `Mode` varchar(20) default NULL COMMENT 'Remand,imprison',
  `Address` text,
  PRIMARY KEY  (`PrisonerId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `prisoners` */

insert  into `prisoners`(`PrisonerId`,`Name`,`Age`,`caseid`,`FromDate`,`ToDate`,`Mode`,`Address`) values (2,'Mavrick',27,12980,'2006-01-02','2008-10-02','imprison','Alabama'),(3,'Jim',34,1,'2008-10-31','2008-10-30','Imprison','ok'),(4,'Osama',32,2,'2008-10-31','2009-10-31','Imprison','ok'),(5,'Jimmy',56,3,'2008-09-01','2008-10-01','Imprison','ok'),(6,'NA',34,4,'2008-10-01','2008-10-23','Imprison','NA');

/*Table structure for table `staffdetails` */

DROP TABLE IF EXISTS `staffdetails`;

CREATE TABLE `staffdetails` (
  `StaffId` int(11) NOT NULL auto_increment,
  `Name` varchar(100) default NULL,
  `Age` int(3) default NULL,
  `Designation` varchar(50) default NULL,
  `DateOfJoining` date default NULL,
  `Address` text,
  `Salary` int(10) default NULL,
  `LocationId` int(10) default NULL,
  PRIMARY KEY  (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `staffdetails` */

insert  into `staffdetails`(`StaffId`,`Name`,`Age`,`Designation`,`DateOfJoining`,`Address`,`Salary`,`LocationId`) values (1,'Kalyan',24,'SI','2008-09-21','NA',10000,1),(2,'Sri',28,'Jailor','2008-09-21','NA',12000,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
