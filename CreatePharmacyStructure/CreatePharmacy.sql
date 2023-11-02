BEGIN TRY
    CREATE DATABASE Pharmacy;
END TRY

BEGIN CATCH
        PRINT N'Can''t create database';
END CATCH