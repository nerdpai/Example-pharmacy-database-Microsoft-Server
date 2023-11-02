USE Pharmacy 
go

CREATE TABLE DrugClassifications (
	Classification_id int IDENTITY(1,1) PRIMARY KEY,
	Characteristic nvarchar(70) UNIQUE NOT NULL,
	GroupLetter nchar(1) UNIQUE NOT NULL
)
go


CREATE  INDEX IDrugName
	ON DrugClassifications(Characteristic)
go

INSERT INTO DrugClassifications(Characteristic, GroupLetter)
VALUES (N'Przewód pokarmowy i metabolizm','A'),
(N'Krew i uk³ad krwiotwórczy','B'),
(N'Uk³ad sercowo-naczyniowy','C'),
(N'Dermatologia','D'),
(N'Uk³ad moczowo-p³ciowy i hormony p³ciowe','G'),
(N'Leki hormonalne dzia³aj¹ce ogólnie (bez hormonów p³ciowych)','H'),
(N'Leki stosowane w zaka¿eniach','J'),
(N'Leki przeciwnowotworowe i immunomoduluj¹ce','L'),
(N'Uk³ad miêœniowo-szkieletowy','M'),
(N'Uk³ad nerwowy','N'),
(N'Leki przeciwpaso¿ytnicze, owadobójcze i repelenty','P'),
(N'Uk³ad oddechowy','R'),
(N'Narz¹dy zmys³ów','S'),
(N'Ró¿ne','V');