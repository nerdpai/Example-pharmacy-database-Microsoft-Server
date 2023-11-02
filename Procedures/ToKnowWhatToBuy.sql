use Pharmacy
go

CREATE OR ALTER PROCEDURE ToKnowWhatToBuy
AS
		SELECT Name, Quantity * (-1) +
						case when IsOnSale = 1
								 then 100
						 else 50
						 end as [lack of]
		FROM Drugs
		WHERE (Quantity < 100 AND IsOnSale = 1) OR
					  (Quantity < 50 AND IsOnSale = 0)