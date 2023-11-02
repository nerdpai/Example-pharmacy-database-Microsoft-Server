use Pharmacy
go


SELECT COUNT(*) as [liczba os�b powy�ej 40 kupi�cych jakie� leki immunomoduluj�ce na recept�]
FROM (SELECT * FROM ArchivedPrescriptionDetails 
			UNION 
			SELECT * FROM PrescriptionDetails) AS PD INNER JOIN Drugs D
			ON PD.Drug_id = D.Drug_id
			INNER JOIN DrugClassifications DC
			ON D.Classification_id = DC.Classification_id
			INNER JOIN Customers C
			ON PD.Customer_id = C.Customer_id
			WHERE   C.Age > 40 AND
							DC.Characteristic LIKE '%immu%'