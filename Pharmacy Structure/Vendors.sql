USE Pharmacy 
go

CREATE TABLE Vendors (
	Vendor_id int IDENTITY(1,1) PRIMARY KEY,
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
TRIGGER TVendorsFaxValidator
	ON Vendors
	FOR INSERT, UPDATE

AS
SET NOCOUNT ON
 IF EXISTS(SELECT Fax
				 FROM Vendors
				 WHERE Fax IS NOT NULL
				 GROUP BY Fax
				 HAVING COUNT(*)>1)
	ROLLBACK
go

CREATE INDEX IVendorsCountry
	ON Vendors(Country_id)
go

INSERT INTO Vendors(Country_id, Name, City, Street, HouseNumber, PostalCode, PhoneNumber, Fax, Email)
Values (58, 'MediPharm', 'Colombo', 'Galle Road', '100', '00200', '+94 11 1234567', '+94 11 7654322', 'info@medipharm.lk'),
(17, 'PharmaNet Tokyo', 'Tokyo', 'Shinjuku', '50', '160-0022', '+81 3 2345678', NULL, 'info@pharmanet.jp'),
(22, 'HealthCare Paris', 'Paris', 'Avenue des Champs-Élysées', '80', '75008', '+33 1 3456789', '+33 1 9876544', 'info@healthcare.fr'),
(16, 'MediLink New York', 'New York', 'Fifth Avenue', '200', '10001', '+1 212 2345678', '+1 212 8765435', 'info@medilink.us'),
(48, 'PharmaWorld Buenos Aires', 'Buenos Aires', 'Avenida Corrientes', '100', '1043', '+54 11 3456786', '+54 11 9876543', 'info@pharmaworld.ar'),
(9, 'HealthPharm Wellington', 'Wellington', 'Lambton Quay', '50', '6011', '+64 4 2345678', NULL, 'info@healthpharm.nz'),
(64, 'MediPro Cairo', 'Cairo', 'Tahrir Square', '100', '11111', '+20 2 3456788', '+20 2 9876243', 'info@medipro.eg'),
(62, 'PharmaLink Amman', 'Amman', 'Rainbow Street', '150', '11181', '+962 6 3456787', '+962 6 9876243', 'info@pharmalink.jo'),
(35, 'HealthLine Riyadh', 'Riyadh', 'Olaya Street', '50', '12241', '+966 11 3456789', NULL, 'info@healthline.sa'),
(2, 'MediNet Zurich', 'Zurich', 'Bahnhofstrasse', '80', '8001', '+41 44 2345678', NULL, 'info@medinet.ch'),
(66, 'PharmaCare Tunis', 'Tunis', 'Avenue Habib Bourguiba', '50', '1001', '+216 71 345678', '+216 71 987454', 'info@pharmacare.tn'),
(21, 'HealthSupplies Seoul', 'Seoul', 'Myeongdong', '100', '04537', '+82 2 3456789', '+82 2 9876543', 'info@healthsup.kr'),
(56, 'MediLink Kiev', 'Kiev', 'Khreshchatyk Street', '50', '01001', '+380 44 2345677', NULL, 'info@medilink.ua'),
(52, 'PharmaNet Bucharest', 'Bucharest', 'Victoriei Avenue', '200', '010094', '+40 21 3456788', '+40 21 9877543', 'info@pharmanet.ro'),
(39, 'HealthPharm Santiago', 'Santiago', 'Avenida Providencia', '100', '7500018', '+56 2 3456789', '+56 2 9876943', 'info@healthpharm.cl'),
(14, 'PharmaWorld Berlin', 'Berlin', 'Friedrichstrasse', '150', '10117', '+49 30 2345678', '+49 30 9876543', 'info@pharmaworld.de'),
(7, 'MediPharm Amsterdam', 'Amsterdam', 'Herengracht', '50', '1017 BN', '+31 20 2345678', NULL, 'info@medipharm.nl'),
(15, 'HealthCare London', 'London', 'Oxford Street', '100', 'W1D 1LP', '+44 20 3456789', NULL, 'info@healthcare.co.uk'),
(5, 'MediLink Copenhagen', 'Copenhagen', 'Str?get', '80', '1202', '+45 33 234567', '+45 33 987624', 'info@medilink.dk'),
(29, 'PharmaNet Athens', 'Athens', 'Ermou Street', '200', '105 63', '+30 21 3456789', '+30 21 9876548', 'info@pharmanet.gr'),
(30, 'HealthPharm Rome', 'Rome', 'Via del Corso', '100', '00186', '+39 06 2345678', '+39 06 9876541', 'info@healthpharm.it'),
(11, 'MediNet Helsinki', 'Helsinki', 'Mannerheimintie', '150', '00100', '+358 9 2345678', NULL, 'info@medinet.fi'),
(1, 'PharmaLink Oslo', 'Oslo', 'Karl Johans gate', '50', '0154', '+47 21 234567', '+47 21 987658', 'info@pharmalink.no'),
(12, 'HealthLine Stockholm', 'Stockholm', 'Drottninggatan', '80', '111 21', '+46 8 3456789', '+46 8 9876540', 'info@healthline.se'),
(8, 'MediPro Toronto', 'Toronto', 'Yonge Street', '100', 'M5B 2H1', '+1 416 2345678', '+1 416 9876547', 'info@medipro.ca'),
(4, 'PharmaCare Dublin', 'Dublin', 'Grafton Street', '50', 'D02 FH34', '+353 1 3456789', NULL, 'info@pharmacare.ie'),
(45, 'HealthSupplies Panama City', 'Panama City', 'Avenida Balboa', '150', '0819-09184', '+507 3456789', '+507 9876547', 'info@healthsup.pa'),
(47, 'MediLink Almaty', 'Almaty', 'Abay Avenue', '80', '050010', '+7 727 2345678', NULL, 'info@medilink.kz'),
(19, 'PharmaNet Vienna', 'Vienna', 'Kärntner Straße', '100', '1010', '+43 1 3456789', '+43 1 9876545', 'info@pharmanet.at'),
(70, 'HealthPharm Lilongwe', 'Lilongwe', 'Independence Avenue', '50', '00000', '+265 1 234569', NULL, 'info@healthpharm.mw'),
(21, 'MediCare Kuala Lumpur', 'Kuala Lumpur', 'Jalan Bukit Bintang', '80', '55100', '+60 3 2345678', '+60 3 9876542', 'info@medicare.my'),
(22, 'PharmaPro Doha', 'Doha', 'Al Sadd Street', '100', '00000', '+974 44345678', '+974 443987657', 'info@pharmapro.qa'),
(33, 'HealthLine Kuwait City', 'Kuwait City', 'Al Hamra Tower', '50', '13001', '+965 22345678', NULL, 'info@healthline.kw'),
(18, 'MediPharm Reykjavik', 'Reykjavik', 'Laugavegur', '80', '101', '+354 5102345', '+354 5109875', 'info@medipharm.is'),
(38, 'PharmaCare Riga', 'Riga', 'Riga Central Market', '200', '1010', '+371 6 3456789', '+371 6 9876541', 'info@pharmacare.lv'),
(48, 'HealthNet Buenos Aires', 'Buenos Aires', 'Avenida 9 de Julio', '100', 'C1073ABA', '+54 11 23456789', '+54 11 98765430', 'info@healthnet.ar'),
(49, 'MediLink Zagreb', 'Zagreb', 'Ilica Street', '80', '10000', '+385 1 2345678', '+385 1 9876548', 'info@medilink.hr'),
(50, 'PharmaNet Moscow', 'Moscow', 'Tverskaya Street', '50', '125009', '+7 495 2345678', '+7 495 9876547', 'info@pharmanet.ru'),
(51, 'HealthPharm Budapest', 'Budapest', 'Andrássy Avenue', '150', '1062', '+36 1 2345678', NULL, 'info@healthpharm.hu'),
(52, 'MediPro Bucharest', 'Bucharest', 'Calea Victoriei', '100', '010062', '+40 21 3456789', NULL, 'info@medipro.ro'),
(53, 'PharmaSupplies Caracas', 'Caracas', 'Avenida Libertador', '200', '1010', '+58 212 3456789', '+58 212 9876540', 'info@pharmasup.ve'),
(54, 'HealthLine Quito', 'Quito', 'Avenida Amazonas', '80', '170143', '+593 2 2345678', NULL, 'info@healthline.ec'),
(55, 'MediNet Pyongyang', 'Pyongyang', 'Ryomyong Street', '100', '100014', '+850 2 2345678', '+850 2 9876546', 'info@medinet.kp'),
(56, 'PharmaLink Kyiv', 'Kyiv', 'Khreshchatyk Street', '50', '01001', '+380 44 2345678', NULL, 'info@pharmalink.ua'),
(57, 'HealthPharm Muscat', 'Muscat', 'Al Khuwair Street', '80', '133', '+968 24 345678', NULL, 'info@healthpharm.om'),
(58, 'MediCare Colombo', 'Colombo', 'Galle Road', '150', '00300', '+94 11 2345678', NULL, 'info@medicare.lk'),
(59, 'PharmaPro San Jose', 'San Jose', 'Avenida Central', '100', '10101', '+506 2 3456789', '+506 2 9876547', 'info@pharmapro.cr'),
(60, 'HealthLine Belmopan', 'Belmopan', 'National Assembly Boulevard', '50', '00000', '+501 2 3456789', '+501 2 9876545', 'info@healthline.bz'),
(61, 'MediPharm Addis Ababa', 'Addis Ababa', 'Churchill Avenue', '80', '1000', '+251 11 2345678', NULL, 'info@medipharm.et'),
(62, 'PharmaCare Amman', 'Amman', 'Abdali Boulevard', '100', '11185', '+962 6 3456789', '+962 6 9876547', 'info@pharmacare.jo'),
(63, 'HealthNet Beirut', 'Beirut', 'Hamra Street', '200', '00000', '+961 1 234567', NULL, 'info@healthnet.lb'),
(64, 'MediNet Cairo', 'Cairo', 'Nile Corniche', '80', '12345', '+20 2 3456789', '+20 2 9876543', 'info@medinet.eg'),
(65, 'PharmaPro Algiers', 'Algiers', 'Rue Didouche Mourad', '100', '16000', '+213 21 234567', '+213 21 987658', 'info@pharmapro.dz'),
(66, 'HealthLine Tunis', 'Tunis', 'Avenue Habib Bourguiba', '150', '1001', '+216 71 234567', '+216 71 987659', 'info@healthline.tn'),
(67, 'MediPharm Rabat', 'Rabat', 'Avenue Mohammed V', '80', '10000', '+212 5 23456789', '+212 5 98765436', 'info@medipharm.ma'),
(68, 'PharmaLink Gaborone', 'Gaborone', 'Independence Avenue', '50', '00100', '+267 3 3456789', '+267 3 9876547', 'info@pharmalink.bw'),
(69, 'HealthPharm Windhoek', 'Windhoek', 'Independence Avenue', '100', '9000', '+264 61 234567', '+264 61 987652', 'info@healthpharm.na'),
(70, 'MediNet Lilongwe', 'Lilongwe', 'Lumbadzi Road', '150', '00000', '+265 1 234567', '+265 1 987650', 'info@medinet.mw');