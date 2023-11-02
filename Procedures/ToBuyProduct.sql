use Pharmacy
go

CREATE OR ALTER PROCEDURE ToBuyProduct
@EAN nvarchar(13), --Universal Product Code
@PrescriptionCode nvarchar(4)
AS		BEGIN

		IF LEN(@EAN) <> 13 OR 
			TRY_CAST(@EAN as bigint) IS NULL OR 
			CAST(@EAN as bigint) <  0
		BEGIN
			;THROW 1,'Wrong EAN format',1;
		END

		IF TRY_CAST(@PrescriptionCode as smallint) IS NULL OR 
			CAST(@PrescriptionCode as smallint) < -1 OR
			(LEN(@PrescriptionCode) <> 4 AND
			CAST(@PrescriptionCode as smallint) >= 0)
		BEGIN
			;THROW 50000,'Wrong prescription code format',1;
		END


		DECLARE @Country int; -- 3 digits
		DECLARE @Vendor int; -- 4 digits
		DECLARE @Product int; -- 5 digits
		SET @Country = CAST(SUBSTRING(@EAN,1,3) as int);
		SET @Vendor = CAST(SUBSTRING(@EAN,4,4) as int);
		SET @Product = CAST(SUBSTRING(@EAN,8,5) as int);

		DECLARE @Code smallint -- 4 digits
		SET @Code = CAST(@PrescriptionCode as smallint); -- 4 digits


		DECLARE @Drug_id int
		SET @Drug_id = (SELECT DISTINCT Drug_id
									  FROM Drugs D INNER JOIN Vendors V
									  ON D.Vendor_id = V.Vendor_id
									  WHERE D.Vendor_id = @Vendor AND
													 V.Country_id = @Country AND
													 D.Drug_id = @Product
									  );

		DECLARE @PrescriptionsDetaild_id int;
		IF(@Code <> -1)
		BEGIN
				SET @PrescriptionsDetaild_id = (SELECT id
																			FROM Prescriptions P INNER JOIN PrescriptionDetails PD
																			ON  P.Prescription_id = PD.Prescription_id
																			WHERE P.Code = @Code AND PD.Drug_id = @Drug_id AND
																							PD.Quantity > PD.Used);
		END

		IF				@Drug_id IS NULL OR
						(   SELECT IsOnSale 
							FROM Drugs
							WHERE Drug_id = @Drug_id) = 0 AND @Code = -1 OR
						(	SELECT Quantity 
							FROM Drugs
							WHERE Drug_id = @Drug_id) = 0 OR
						@Code <> -1 AND @PrescriptionsDetaild_id IS NULL
		BEGIN
		; THROW 50000,'Problem with product',1;
		END

		UPDATE Drugs
		SET Quantity = Quantity - 1
		WHERE Drug_id = @Drug_id;

		IF @Code <> -1
		BEGIN
				UPDATE PrescriptionDetails
				SET Used = Used + 1
				WHERE id = @PrescriptionsDetaild_id;

				UPDATE Prescriptions
				SET IsActivated = 1
				WHERE Code = @Code;
		END
									

END