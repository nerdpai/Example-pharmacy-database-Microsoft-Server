use Pharmacy
go


SELECT  DC.Characteristic, Count(V.Vendor_id) AS [Liczba leków od producentów (9 - 53) w kategoriach]
FROM Vendors V RIGHT JOIN Drugs D
ON V.Vendor_id = D.Drug_id
RIGHT JOIN DrugClassifications DC
ON D.Classification_id = DC.Classification_id
WHERE V.Vendor_id BETWEEN 9 AND 53 OR V.Vendor_id IS NULL
GROUP BY DC.Characteristic
HAVING COUNT(*)>3