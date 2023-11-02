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
VALUES (N'Przew�d pokarmowy i metabolizm','A'),
(N'Krew i uk�ad krwiotw�rczy','B'),
(N'Uk�ad sercowo-naczyniowy','C'),
(N'Dermatologia','D'),
(N'Uk�ad moczowo-p�ciowy i hormony p�ciowe','G'),
(N'Leki hormonalne dzia�aj�ce og�lnie (bez hormon�w p�ciowych)','H'),
(N'Leki stosowane w zaka�eniach','J'),
(N'Leki przeciwnowotworowe i immunomoduluj�ce','L'),
(N'Uk�ad mi�niowo-szkieletowy','M'),
(N'Uk�ad nerwowy','N'),
(N'Leki przeciwpaso�ytnicze, owadob�jcze i repelenty','P'),
(N'Uk�ad oddechowy','R'),
(N'Narz�dy zmys��w','S'),
(N'R�ne','V');