use Pharmacy
go

EXEC ToArchivePrescription;



EXEC ToKnowWhatToBuy;



EXEC ToBuyProduct
	@EAN = '0020010000010',
	@PrescriptionCode = '-1';
SELECT TOP (1000) [Drug_id]
      ,[Vendor_id]
      ,[Classification_id]
      ,[IsOnSale]
      ,[Name]
      ,[Price]
      ,[Quantity]
  FROM [Pharmacy].[dbo].[Drugs]
  WHERE Drug_id = 1;









  SELECT TOP (1000) [Drug_id]
      ,[Vendor_id]
      ,[Classification_id]
      ,[IsOnSale]
      ,[Name]
      ,[Price]
      ,[Quantity]
  FROM [Pharmacy].[dbo].[Drugs]
  WHERE Drug_id = 60;

  SELECT TOP (1000) [Prescription_id]
      ,[DateOfPrescription]
      ,[Code]
      ,[IsActivated]
      ,[TimePeriod]
  FROM [Pharmacy].[dbo].[Prescriptions]
  WHERE Code = 5819;

  SELECT TOP (1000) [id]
      ,[Prescription_id]
      ,[Drug_id]
      ,[Customer_id]
      ,[Quantity]
      ,[Used]
  FROM [Pharmacy].[dbo].[PrescriptionDetails]
  WHERE Prescription_id = 23;


EXEC ToBuyProduct
	@EAN = '0390015000600',
	@PrescriptionCode = '5819';

SELECT TOP (1000) [Drug_id]
      ,[Vendor_id]
      ,[Classification_id]
      ,[IsOnSale]
      ,[Name]
      ,[Price]
      ,[Quantity]
  FROM [Pharmacy].[dbo].[Drugs]
  WHERE Drug_id = 60;

  SELECT TOP (1000) [Prescription_id]
      ,[DateOfPrescription]
      ,[Code]
      ,[IsActivated]
      ,[TimePeriod]
  FROM [Pharmacy].[dbo].[Prescriptions]
  WHERE Code = 5819;

  SELECT TOP (1000) [id]
      ,[Prescription_id]
      ,[Drug_id]
      ,[Customer_id]
      ,[Quantity]
      ,[Used]
  FROM [Pharmacy].[dbo].[PrescriptionDetails]
  WHERE Prescription_id = 23;