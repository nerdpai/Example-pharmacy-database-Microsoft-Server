use Pharmacy
go


SELECT P.Code as Recepta, SUM(PD.Quantity) as [iloœæ towarów kosztuj¹cych wiêcej ni¿ 10]
FROM Prescriptions P INNER JOIN PrescriptionDetails PD
ON P.Prescription_id = PD.Prescription_id
INNER JOIN  Drugs D
ON PD.Drug_id = D.Drug_id
WHERE D.Price>10
GROUP BY P.Code