use Pharmacy
go

SELECT D.Name as [leki pochodz¹ce z 'Gr%']
FROM Drugs D, Vendors V, Countries C
WHERE D.Vendor_id = V.Vendor_id AND
			   C.Country_id = V.Country_id AND
			   C.Name LIKE 'Gr%';