use Pharmacy
go


CREATE TABLE ArchivedPrescriptions (
	Prescription_id int IDENTITY(1,1) PRIMARY KEY,
	DateOfPrescription date NOT NULL DEFAULT(GETDATE()) ,
	Code smallint NOT NULL CHECK(Code>= 0 AND Code <10000),
	IsActivated bit NOT NULL DEFAULT(0),
	TimePeriod smallint NOT NULL,
)
go