USE Pharmacy 
go

CREATE TABLE Drugs (
	Drug_id int IDENTITY(1,1) PRIMARY KEY,
	Vendor_id int NOT NULL FOREIGN KEY REFERENCES Vendors(Vendor_id),
	Classification_id int NOT NULL FOREIGN KEY REFERENCES DrugClassifications(Classification_id),
	IsOnSale bit NOT NULL DEFAULT(1),
	Name nvarchar(40) UNIQUE NOT NULL,
	Price smallmoney NOT NULL CHECK(Price>0),
	Quantity smallint NOT NULL CHECK(Quantity>=0)
)
go

CREATE  INDEX IDrugVendor
	ON Drugs(Vendor_id)
go

CREATE  INDEX IDrugClass
	ON Drugs(Classification_id)
go

CREATE  INDEX IDrugPrice
	ON Drugs(Price)
	INCLUDE(NAME)
go


INSERT INTO Drugs (Vendor_id, Classification_id, Name, Price, Quantity)
Values (10, 7, 'AmoxiRelief647', 9.99, 12),
(45, 8, 'IbuproRelief585', 6.75, 51),
(29, 5, 'ParaceRelief929', 4.50, 43),
(3, 12, 'LisinoPress312', 12.99, 78),
(24, 9, 'OmezSuppress249', 7.25, 100),
(17, 1, 'SimvaChol171', 15.50, 63),
(56, 11, 'MetforDia561', 5.99, 99),
(7, 3, 'AmlodiPress73', 8.25, 21),
(38, 13, 'TramaRelief813', 11.99, 54),
(52, 2, 'Doxybiotic522', 10.50, 69),
(18, 4, 'PredniSone184', 7.50, 11),
(39, 6, 'Gabapentinol396', 9.99, 2),
(14, 10, 'FluoAntidep141', 6.75, 33),
(26, 1, 'MetroBlock261', 12.99, 18),
(35, 12, 'AtorvaChol351', 7.25, 77),
(9, 8, 'AmphetiBoost98', 15.50, 16),
(48, 11, 'MetroniZole481', 5.99,256),
(21, 13, 'PregaRelief213', 11.99, 512),
(28, 7, 'ClinAnti287', 10.50, 1024),
(11, 3, 'AlpraziCalma113', 3.99, 188),
(33, 9, 'DuloxiLife339', 7.50, 399),
(42, 5, 'MethoSupp425', 9.99, 178),
(16, 2, 'AripiPsycho162', 6.75, 234),
(47, 6, 'Ciprobiotic476', 4.50, 185),
(31, 1, 'FuroseDiuretic311', 12.99, 77),
(5, 4, 'VenlafaxBliss54', 7.25, 66),
(23, 10, 'PredniSupp231', 15.50, 55),
(58, 8, 'LosarPress588', 5.99, 44),
(8, 13, 'SertAntidep813', 8.25, 33),
(37, 12, 'BuproWell3712', 11.99, 22),
(50, 7, 'DiazeRelax507', 10.50, 1),
(19, 11, 'CitaloLife1911', 3.99, 0),
(4, 6, 'EscitaLife46', 7.50, 17),
(27, 2, 'LevoThyrox272', 9.99, 66),
(32, 5, 'QuetiPsycho325', 6.75, 157),
(53, 3, 'NaproRelief533', 4.50, 99),
(12, 1, 'MetocloAnti121', 12.99, 16),
(43, 4, 'FlucoFight434', 7.25, 102),
(15, 9, 'TrazoBliss159', 15.50, 103),
(58, 13, 'MirtaDep5913', 5.99, 104),
(25, 10, 'RisperiPsycho2510', 8.25, 105),
(34, 11, 'BuProPlus3411', 11.99, 106),
(1, 14, 'AzithroFight114', 10.50, 107),
(13, 5, 'DoxeAntidep1315', 3.99, 108),
(30, 6, 'AlloPurin3016', 7.50, 109),
(44, 7, 'SildenaBoost4417', 9.99, 110),
(20, 8, 'WarfaGuard2018', 6.75, 111),
(57, 9, 'LoraAnxi5719', 4.50, 112),
(22, 10, 'LansoSuppress2220', 12.99, 113),
(36, 11, 'RabeSuppress3621', 7.25, 114),
(2, 12, 'TamsuBlock222', 15.50, 115),
(41, 13, 'BudeCorti4123', 5.99, 116),
(55, 14, 'VenlaRelief5524', 8.25, 117);


INSERT INTO Drugs (Vendor_id, Classification_id, Name, Price, IsOnSale, Quantity)
Values (6, 5, 'NaproPlus625', 11.99, 0, 55),
(49, 6, 'FolicSupp4926', 10.50, 0, 25),
(40, 7, 'ClopiPlate4027', 3.99, 0, 19),
(54, 8, 'LetHormone5428', 7.50, 0, 18),
(46, 9, 'LevetiraEpi4629', 9.99, 0, 66),
(27, 1, 'PantoSuppress2730', 6.75, 0, 23),
(15, 1, 'RisperiPlus1531', 4.50, 0, 88);