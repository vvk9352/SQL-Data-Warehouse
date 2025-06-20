/*
====================================================================
  Script Name   : init_databaase.sql
  Author        : Vinay K
  Created On    : 2025-06-20
  Description   : 
      Creates a new SQL Server database 'DataWarehouse' and its 
      foundational schemas (bronze, silver, gold) as part of the 
      data warehouse architecture.

  Layering Purpose:
      - bronze: raw ingested data
      - silver: cleaned, transformed data
      - gold  : business-ready aggregate data

  WARNING:
      Running this script will drop the entire 'DataWarehouse' 
      database if it already exists. All data will be permanently 
      deleted. Ensure backups exist before execution.

  Intended Environment: Development only
====================================================================
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
