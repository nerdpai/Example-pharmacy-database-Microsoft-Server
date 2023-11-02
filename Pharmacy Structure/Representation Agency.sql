USE Pharmacy 
go

CREATE TABLE Agencies (
	Agency_id int IDENTITY(1,1) PRIMARY KEY,
	Country_id int NOT NULL FOREIGN KEY REFERENCES Countries(Country_id),
	Name nvarchar(60) UNIQUE NOT NULL,
	City nvarchar(85) NOT NULL,
	Street nvarchar(85)  NOT NULL,
	HouseNumber nvarchar(10) NOT NULL,
	PostalCode nvarchar(20) NOT NULL,
	PhoneNumber nvarchar(20) UNIQUE NOT NULL,
	Fax nvarchar(20) NULL,
	Email nvarchar(345) UNIQUE NOT NULL
)
go


CREATE OR ALTER 
TRIGGER TAgencyFaxValidator
	ON Agencies
	FOR INSERT, UPDATE

AS
SET NOCOUNT ON
 IF EXISTS(SELECT Fax
				 FROM Agencies
				 WHERE Fax IS NOT NULL
				 GROUP BY Fax
				 HAVING COUNT(*)>1)
	ROLLBACK
go


CREATE INDEX IAgencyCountry
	ON Agencies(Country_id)
go


INSERT INTO Agencies(Country_id, Name, City, Street, HouseNumber, PostalCode, PhoneNumber, Fax, Email)
Values (44, 'MediPharm Poland', 'Warsaw', 'Aleje Jerozolimskie', '120', '00-001', '+48 22 1234567', NULL, 'info@medipharm.pl'),
(44, 'PharmaPlus Warsaw', 'Warsaw', 'Nowy Œwiat', '50', '00-001', '+48 22 2345678', '+48 22 8895432', 'info@pharmaplus.pl'),
(44, 'HealthCare Krakow', 'Krakow', 'Rynek G³ówny', '10', '31-001', '+48 12 3456789', NULL, 'info@healthcare.kr'),
(44, 'MediLink Gdansk', 'Gdansk', 'D³ugi Targ', '25', '80-830', '+48 58 9876543', NULL, 'info@medilink.pl'),
(44, 'PharmaWorld Wroclaw', 'Wroclaw', 'Rynek', '5', '50-102', '+48 71 3456789', '+48 71 9876943', 'info@pharmaworld.pl'),
(44, 'MediPharm Lodz', 'Lodz', 'Piotrkowska', '150', '90-001', '+48 42 2345678', '+48 42 8765402', 'info@medipharm.lodz'),
(44, 'PharmaNet Poznan', 'Poznan', 'Stary Rynek', '20', '61-772', '+48 61 3456789', NULL, 'info@pharmanet.pl'),
(44, 'HealthPlus Szczecin', 'Szczecin', 'Wa³y Chrobrego', '30', '70-500', '+48 91 9876543', NULL, 'info@healthplus.pl'),
(44, 'MediLink Katowice', 'Katowice', 'Mariacka', '80', '40-014', '+48 32 2345678', '+48 32 8760432', 'info@medilink.katowice'),
(44, 'PharmaWorld Lublin', 'Lublin', 'Krakowskie Przedmieœcie', '15', '20-001', '+48 81 3456789', '+48 89 9876543', 'info@pharmaworld.lublin'),
(44, 'MediPharm Gdynia', 'Gdynia', 'Koœciuszki', '5', '81-321', '+48 50 2345678', '+48 58 8765430', 'info@medipharm.gdynia'),
(44, 'PharmaNet Bydgoszcz', 'Bydgoszcz', 'D³uga', '10', '85-001', '+48 52 3456789', NULL, 'info@pharmanet.bydgoszcz'),
(44, 'HealthCare Rzeszow', 'Rzeszow', '3 Maja', '25', '35-001', '+48 17 9876543', NULL, 'info@healthcare.rzeszow'),
(44, 'MediLink Czestochowa', 'Czestochowa', 'Jasnogórska', '40', '42-200', '+48 34 2340678', '+48 34 0765432', 'info@medilink.czestochowa'),
(44, 'PharmaWorld Szczecin', 'Szczecin', 'Piastów', '10', '71-001', '+48 91 3456780', '+48 91 9870543', 'info@pharmaworld.szczecin'),
(44, 'MediPharm Sopot', 'Sopot', 'Bohaterów Monte Cassino', '20', '81-721', '+48 58 2945678', NULL, 'info@medipharm.sopot'),
(44, 'PharmaPlus Gliwice', 'Gliwice', 'Koœciuszki', '15', '44-100', '+48 32 3456789', '+48 32 9876343', 'info@pharmaplus.gliwice'),
(44, 'HealthPlus Katowice', 'Katowice', 'Andrzeja', '5', '40-001', '+48 32 9876543', NULL, 'info@healthplus.katowice'),
(44, 'MediLink Torun', 'Torun', 'Krakowskie Przedmieœcie', '35', '87-100', '+48 56 2345678', '+48 56 8795432', 'info@medilink.torun'),
(44, 'PharmaNet Bialystok', 'Bialystok', 'Lipowa', '30', '15-424', '+48 85 3456789', '+48 85 9876513', 'info@pharmanet.bialystok'),
(44, 'HealthCare Olsztyn', 'Olsztyn', 'Pieniê¿nego', '8', '10-001', '+48 89 2345678', NULL, 'info@healthcare.olsztyn'),
(44, 'MediPharm Kielce', 'Kielce', 'Sienkiewicza', '12', '25-001', '+48 41 3456789', NULL, 'info@medipharm.kielce'),
(44, 'PharmaWorld Zielona Gora', 'Zielona Gora', 'Wroc³awska', '2', '65-001', '+48 68 2345678', '+48 68 8761432', 'info@pharmaworld.zielonagora'),
(44, 'MediLink Opole', 'Opole', 'Piastowska', '18', '45-001', '+48 77 3456789', NULL, 'info@medilink.opole'),
(44, 'PharmaPlus Gdynia', 'Gdynia', '3 Maja', '15', '81-001', '+48 58 3456789', '+48 58 9871543', 'info@pharmaplus.gdynia'),
(44, 'HealthPlus Bydgoszcz', 'Bydgoszcz', 'Nakielska', '6', '85-001', '+48 52 2345678', NULL, 'info@healthplus.bydgoszcz'),
(44, 'MediPharm Rzeszow', 'Rzeszow', 'Kwiatkowskiego', '4', '35-001', '+48 17 3456789', '+48 17 9856543', 'info@medipharm.rzeszow'),
(44, 'PharmaNet Czestochowa', 'Czestochowa', 'Koœciuszki', '20', '42-200', '+48 34 2345678', NULL, 'info@pharmanet.czestochowa'),
(44, 'HealthCare Szczecin', 'Szczecin', 'W³adys³awa IV', '30', '71-001', '+48 91 3456789', NULL, 'info@healthcare.szczecin'),
(44, 'MediLink Sopot', 'Sopot', 'Armii Krajowej', '8', '81-721', '+48 58 2345678', '+48 58 8758432', 'info@medilink.sopot'),
(30, 'MediHealth Italy', 'Rome', 'Via Nazionale', '10', '00184', '+39 06 1234567', '+39 06 7651321', 'info@medihealth.it'),
(30, 'PharmaCare Milan', 'Milan', 'Corso Buenos Aires', '45', '20124', '+39 02 2345678', NULL, 'info@pharmacare.it'),
(14, 'HealthLink Germany', 'Berlin', 'Friedrichstraße', '100', '10117', '+49 30 3456789', NULL, 'info@healthlink.de'),
(22, 'MediPharm France', 'Paris', 'Avenue des Champs-Élysées', '20', '75008', '+33 1 23456789', '+33 1 98965432', 'info@medipharm.fr'),
(16, 'PharmaNet United States', 'New York', 'Broadway', '123', '10001', '+1 212 3456789', '+1 212 8765402', 'info@pharmanet.us'),
(48, 'HealthCare Argentina', 'Buenos Aires', 'Avenida 9 de Julio', '500', 'C1082AAB', '+54 11 23456789', NULL, 'info@healthcare.ar'),
(8, 'MediLink Canada', 'Toronto', 'Yonge Street', '789', 'M5B 2C3', '+1 416 3456789', '+1 416 8765832', 'info@medilink.ca'),
(31, 'MediHealth Czech Republic', 'Prague', 'Na Pøíkopì', '15', '110 00', '+420 234 567 890', '+420 234 267 891', 'info@medihealth.cz'),
(5, 'PharmaCare Denmark', 'Copenhagen', 'Vesterbrogade', '45', '1620', '+45 12 345 698', NULL, 'info@pharmacare.dk'),
(19, 'HealthLink Austria', 'Vienna', 'Kärntner Straße', '25', '1010', '+43 1 234 567 890', '+43 1 254 567 091', 'info@healthlink.at'),
(6, 'MediPharm Sweden', 'Stockholm', 'Drottninggatan', '10', '111 51', '+46 8 123 456 78', '+46 8 123 056 79', 'info@medipharm.se'),
(7, 'PharmaNet Netherlands', 'Amsterdam', 'Kalverstraat', '20', '1012 NX', '+31 20 123 4567', '+31 20 065 4321', 'info@pharmanet.nl'),
(12, 'HealthCare Luxembourg', 'Luxembourg City', 'Rue Philippe II', '12', '2340', '+352 12345678', NULL, 'info@healthcare.lu'),
(18, 'MediLink Iceland', 'Reykjavik', 'Laugavegur', '50', '101', '+354 123 4567', '+354 765 4301', 'info@medilink.is'),
(3, 'PharmaHub Australia', 'Sydney', 'George Street', '123', '2000', '+61 2 1234 5678', NULL, 'info@pharmahub.com.au'),
(16, 'MediLife United States', 'New York', 'Broadway', '456', '10001', '+1 212 345 6789', '+1 202 345 6790', 'info@medilife.com'),
(13, 'HealthPlus Belgium', 'Brussels', 'Rue Neuve', '789', '1000', '+32 2 123 45 67', NULL, 'info@healthplus.be'),
(14, 'MediCare Germany', 'Berlin', 'Unter den Linden', '321', '10117', '+49 30 12345678', '+49 30 10345679', 'info@medicare.de'),
(30, 'PharmaLink Italy', 'Rome', 'Via del Corso', '987', '00187', '+39 06 1234 5678', NULL, 'info@pharmalink.it'),
(22, 'HealthConnect France', 'Paris', 'Champs-Élysées', '654', '75008', '+33 1 23 45 67 89', '+33 1 23 40 67 90', 'info@healthconnect.fr'),
(44, 'MediPharma Poland', 'Warsaw', 'Nowy Œwiat', '135', '00-123', '+48 22 123 45 67', NULL, 'info@medipharma.pl'),
(8, 'PharmaNet Canada', 'Toronto', 'Yonge Street', '789', 'M5B 2H1', '+1 416 123 4567', '+1 416 765 4021', 'info@pharmanet.ca'),
(5, 'MediHealth Denmark', 'Copenhagen', 'H.C. Andersens Boulevard', '567', '1553', '+45 12 345 678', '+45 12 345 079', 'info@medihealth.dk'),
(9, 'PharmaZone New Zealand', 'Auckland', 'Queen Street', '789', '1010', '+64 9 123 4567', NULL, 'info@pharmazone.co.nz'),
(31, 'MediLink Czech Republic', 'Prague', 'Wenceslas Square', '123', '110 00', '+420 123 456 789', '+420 123 456 890', 'info@medilink.cz'),
(6, 'MediCare Sweden', 'Stockholm', 'Drottninggatan', '456', '111 21', '+46 8 123 4567', '+46 8 123 4578', 'info@medicare.se'),
(17, 'Japan Pharma', 'Tokyo', 'Ginza', '789', '104-0061', '+81 3 1234 5678', NULL, 'info@japanpharma.jp'),
(45, 'PharmaLink Uruguay', 'Montevideo', '18 de Julio Avenue', '987', '11000', '+598 2 123 4567', '+598 2 120 4568', 'info@pharmalink.uy'),
(49, 'HealthConnect Croatia', 'Zagreb', 'Ilica', '654', '10000', '+385 1 1234 567', NULL, 'info@healthconnect.hr');