USE Pharmacy 
go

CREATE TABLE PrescriptionDetails (
	id int IDENTITY(1,1) PRIMARY KEY,
	Prescription_id int NOT NULL FOREIGN KEY REFERENCES Prescriptions(Prescription_id),
	Drug_id int NOT NULL FOREIGN KEY REFERENCES Drugs(Drug_id),
	Customer_id int FOREIGN KEY REFERENCES Customers(Customer_id) DEFAULT(NULL),
	Quantity smallint NOT NULL CHECK(Quantity>0),
	Used smallint NOT NULL DEFAULT(0),
	Constraint Used_Check CHECK(Used>=0 AND Used <= Quantity) 
)
go

CREATE INDEX IPrescription
	ON PrescriptionDetails(Prescription_id)

CREATE INDEX IDrug
	ON PrescriptionDetails(Drug_id)

CREATE INDEX ICustomer
	ON PrescriptionDetails(Customer_id)
go


CREATE OR ALTER 
TRIGGER TPrescriptionDetailsValidator
	ON PrescriptionDetails
	FOR INSERT, UPDATE

AS
SET NOCOUNT ON
 IF EXISTS(SELECT *
				 FROM PrescriptionDetails
				 GROUP BY Prescription_id, Drug_id
				 HAVING COUNT(*)>1)
	ROLLBACK
go

INSERT INTO PrescriptionDetails(Prescription_id, Drug_id, Customer_id, Quantity)
VALUES (24, 60, NULL, 15),
(92, 57, 68, 20),
(57, 56, NULL, 5),
(109, 60, 67, 14),
(73, 58, 12, 12),
(12, 56, 68, 2),
(67, 59, NULL, 9),
(45, 59, NULL, 8),
(38, 55, 81, 6),
(96, 55, 29, 1),
(91, 57, 45, 14),
(48, 55, NULL, 6),
(83, 58, 11, 5),
(31, 55, 63, 6),
(75, 59, NULL, 7),
(70, 58, NULL, 17),
(18, 59, 38, 12),
(32, 54, NULL, 1),
(101, 58, 75, 2),
(11, 55, 52, 7),
(13, 58, 89, 11),
(63, 54, NULL, 13),
(93, 59, NULL, 11),
(68, 54, NULL, 5),
(22, 59, 16, 3),
(84, 60, NULL, 6),
(51, 55, 26, 13),
(78, 54, 25, 20),
(86, 54, 58, 9),
(97, 58, NULL, 3),
(71, 55, NULL, 10),
(49, 54, NULL, 12),
(52, 60, 46, 4),
(58, 54, 7, 14),
(110, 60, NULL, 18),
(61, 59, 96, 9),
(62, 55, 55, 19),
(43, 60, NULL, 5),
(16, 60, NULL, 1),
(19, 55, 84, 10),
(89, 56, NULL, 15),
(81, 60, 43, 20),
(41, 60, NULL, 8),
(46, 56, NULL, 20),
(35, 59, NULL, 1),
(40, 57, 100, 1),
(23, 60, NULL, 2),
(50, 56, 45, 6),
(59, 56, NULL, 16),
(80, 57, 35, 14),
(85, 57, 1, 5),
(25, 60, 74, 6),
(26, 60, NULL, 7),
(74, 55, NULL, 2),
(15, 56, NULL, 11),
(55, 59, 87, 1),
(33, 55, NULL, 13),
(79, 56, 79, 4),
(99, 59, NULL, 9),
(36, 60, NULL, 11),
(53, 59, NULL, 1),
(21, 57, 28, 13),
(7, 57, NULL, 1),
(9, 58, 94, 10),
(72, 56, 23, 13),
(37, 54, 91, 1),
(69, 60, NULL, 20),
(64, 56, 16, 3),
(20, 57, 53, 19);