USE Pharmacy 
go

CREATE TABLE Prescriptions (
	Prescription_id int IDENTITY(1,1) PRIMARY KEY,
	DateOfPrescription date NOT NULL DEFAULT(GETDATE()) ,
	Code smallint NOT NULL CHECK(Code>= 0 AND Code <10000),
	IsActivated bit NOT NULL DEFAULT(0),
	TimePeriod smallint NOT NULL CHECK(TimePeriod<=360 AND TimePeriod>=7 )
)
go

CREATE OR ALTER 
TRIGGER TPrescriptionsCodeValidator
	ON Prescriptions
	FOR INSERT, UPDATE

AS
SET NOCOUNT ON
 IF EXISTS(SELECT Code
				 FROM Prescriptions
				 WHERE IsActivated = 0 AND DATEDIFF(day,DateOfPrescription, GETDATE())<TimePeriod
				 GROUP BY Code
				 HAVING COUNT(*)>1)
	ROLLBACK
go

INSERT INTO Prescriptions(Code, IsActivated, TimePeriod)
VALUES (3496, 0, 55),
(5761, 0, 237),
(8923, 0, 317),
(4098, 1, 334),
(2154, 0, 257),
(7523, 0, 78),
(6485, 0, 277),
(1653, 0, 241),
(9087, 0, 79),
(6901, 0, 328),
(4738, 0, 217),
(1267, 0, 101),
(3126, 0, 27),
(7319, 0, 300),
(2745, 0, 330),
(6573, 0, 240),
(4672, 1, 96),
(6317, 0, 338),
(7924, 0, 103),
(1975, 0, 314),
(8301, 0, 227),
(3895, 0, 248),
(5819, 0, 184),
(9564, 0, 13),
(5083, 0, 320),
(3207, 0, 83),
(6926, 0, 74),
(2681, 0, 349),
(1590, 0, 144),
(7535, 0, 71),
(6672, 0, 85),
(9036, 0, 19),
(1879, 0, 111),
(6521, 0, 174),
(4327, 0, 225),
(3071, 0, 327),
(8912, 0, 34),
(2146, 0, 198),
(7943, 0, 291),
(5632, 1, 330),
(3288, 0, 235),
(4875, 0, 54),
(8631, 0, 327),
(2480, 0, 254),
(7422, 0, 210),
(5159, 0, 292),
(3874, 0, 92),
(9943, 0, 99),
(7531, 0, 313),
(2792, 0, 38),
(9126, 0, 137),
(6548, 0, 174),
(1821, 0, 158),
(5775, 0, 24),
(4079, 0, 95),
(2264, 0, 181),
(6993, 0, 147),
(5332, 0, 328),
(3089, 0, 34),
(9510, 0, 171),
(1407, 0, 25),
(6575, 0, 204),
(4394, 0, 76),
(8680, 0, 325),
(2312, 1, 317),
(6817, 0, 81),
(5318, 0, 335),
(3746, 0, 154),
(9829, 0, 235),
(7606, 0, 213),
(1062, 0, 235),
(6253, 0, 288),
(8457, 0, 85),
(1826, 0, 109),
(7432, 0, 298),
(4899, 0, 62),
(3377, 0, 18),
(7262, 0, 46),
(2564, 0, 195),
(8438, 0, 89),
(5605, 0, 218),
(3023, 0, 151),
(9114, 0, 20),
(6247, 0, 174),
(1609, 0, 157),
(7504, 0, 239),
(4392, 1, 83),
(8708, 0, 301),
(2436, 0, 176),
(6864, 0, 257),
(5769, 0, 109),
(9906, 0, 269),
(4061, 0, 321),
(7794, 0, 229),
(2957, 0, 127),
(9358, 0, 93),
(1433, 0, 322),
(6636, 0, 116),
(4792, 0, 319),
(1299, 0, 84),
(3167, 0, 271),
(7201, 0, 18),
(2694, 0, 275),
(8287, 0, 196),
(5825, 0, 269),
(9643, 0, 185),
(5242, 0, 231),
(3479, 0, 110),
(7491, 0, 171),
(1625, 0, 36),
(7143, 0, 122),
(4621, 0, 35),
(1037, 0, 191);