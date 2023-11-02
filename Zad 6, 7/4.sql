use Pharmacy
go

SET DATEFORMAT dmy;

SELECT C.Name, ISNULL(SUM(PD.Quantity),0) as [iloœæ leków dla ka¿dego pañstwa, które trafi³y na recepty w dniach od 20.05.2023 do 23...]
FROM Countries C LEFT JOIN Vendors V
ON C.Country_id = V.Country_id
LEFT JOIN Drugs D
ON V.Vendor_id = D.Vendor_id
LEFT JOIN (SELECT * FROM ArchivedPrescriptionDetails 
			UNION 
			SELECT * FROM PrescriptionDetails) AS PD
ON D.Drug_id = PD.Drug_id
LEFT JOIN Prescriptions P
ON PD.Prescription_id = P.Prescription_id
WHERE P.DateOfPrescription BETWEEN '20.05.2023' AND '23.05.2023' OR PD.id IS NULL
GROUP BY C.Name