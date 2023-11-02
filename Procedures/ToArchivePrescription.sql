use Pharmacy
go

CREATE OR ALTER PROCEDURE ToArchivePrescription
AS	BEGIN
	SET IDENTITY_INSERT ArchivedPrescriptions ON;

	INSERT INTO ArchivedPrescriptions ([Prescription_id], [DateOfPrescription], [Code], [IsActivated], [TimePeriod])
	SELECT [Prescription_id], [DateOfPrescription], [Code], [IsActivated], [TimePeriod]
	FROM  Prescriptions P
	WHERE DATEDIFF(day,DateOfPrescription, GETDATE())>=TimePeriod OR
				  NOT EXISTS(
						SELECT *
						FROM PrescriptionDetails PD
						WHERE PD.Prescription_id = P.Prescription_id AND Quantity > Used
				  );
	SET IDENTITY_INSERT ArchivedPrescriptions OFF;


	SET IDENTITY_INSERT ArchivedPrescriptionDetails ON;
	INSERT INTO ArchivedPrescriptionDetails([id], [Prescription_id], [Drug_id], [Customer_id], [Quantity], [Used])
	SELECT [id], [Prescription_id], [Drug_id], [Customer_id], [Quantity], [Used]
	FROM PrescriptionDetails PD
	WHERE Prescription_id IN(
			SELECT Prescription_id
			FROM ArchivedPrescriptions
	);
	SET IDENTITY_INSERT ArchivedPrescriptionDetails OFF;
	

	DELETE FROM PrescriptionDetails
	WHERE Prescription_id IN(
			SELECT Prescription_id
			FROM ArchivedPrescriptions
	);

	DELETE FROM Prescriptions
	WHERE Prescription_id IN(
			SELECT Prescription_id
			FROM ArchivedPrescriptions
	);
	

END