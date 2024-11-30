
Create Database [DEPI Final Project]

CREATE TABLE [dbo].[Calender](
	[date] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Quarter] [int] NULL,
	[Weak] [int] NULL
)


CREATE TABLE [dbo].[Transactions](
	[transaction_date] [date] NULL,
	[stock_date] [date] NULL,
	[product_id] [varchar](50) NULL,
	[customer_id] [varchar](50) NULL,
	[store_id] [varchar](50) NULL,
	[quantity] [varchar](50) NULL
)


CREATE TABLE [dbo].[Territories](
	[SalesTerritoryKey] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Continent] [varchar](50) NULL
)


CREATE TABLE [dbo].[Store](
	[store_id] [varchar](50) NULL,
	[region_id] [varchar](50) NULL,
	[store_type] [varchar](50) NULL,
	[store_name] [varchar](50) NULL,
	[store_street_address] [varchar](50) NULL,
	[store_city] [varchar](50) NULL,
	[store_state] [varchar](50) NULL,
	[store_country] [varchar](50) NULL,
	[store_phone] [varchar](50) NULL,
	[first_opened_date] [varchar](50) NULL,
	[last_remodel_date] [varchar](50) NULL,
	[total_sqft] [varchar](50) NULL,
	[grocery_sqft] [varchar](50) NULL
)



CREATE TABLE [dbo].[Return](
	[ReturnDate] [varchar](50) NULL,
	[TerritoryKey] [varchar](50) NULL,
	[ProductKey] [varchar](50) NULL,
	[ReturnQuantity] [varchar](50) NULL
)


CREATE TABLE [dbo].[Product](
	[product_id] [varchar](50) NULL,
	[product_brand] [varchar](50) NULL,
	[product_name] [varchar](50) NULL,
	[product_sku] [varchar](50) NULL,
	[product_retail_price] [varchar](50) NULL,
	[product_cost] [varchar](50) NULL,
	[product_weight] [varchar](50) NULL,
	[recyclable] [varchar](50) NULL,
	[low_fat] [varchar](50) NULL
) 

 CREATE TABLE [Customer] (
    [customer_id] varchar(50),
    [customer_acct_num] varchar(50),
    [first_name] varchar(50),
    [last_name] varchar(50),
    [customer_address] varchar(50),
    [customer_city] varchar(50),
    [customer_state_province] varchar(50),
    [customer_postal_code] varchar(50),
    [customer_country] varchar(50),
  
    [marital_status] varchar(50),
    [yearly_income] varchar(50),
    [gender] varchar(50),
    [total_children] varchar(50),
    [num_children_at_home] varchar(50),
    [education] varchar(50),
  
    [member_card] varchar(50),
    [occupation] varchar(50),
    [homeowner] varchar(50),
    [birthdate] datetime,
    [acct_open_date] datetime
)

 -- 1. Alter [Calender] table to set [date] as a primary key

 WITH CTE AS (
    SELECT [date], [Year], [Month], [Quarter], [weak],
           ROW_NUMBER() OVER (PARTITION BY [date] ORDER BY [date]) AS RowNum
    FROM [DEPI].[dbo].[Calender]
)
DELETE FROM CTE
WHERE RowNum > 1;
ALTER TABLE [DEPI].[dbo].[Calender]
ALTER COLUMN [date] DATE NOT NULL;

ALTER TABLE [DEPI].[dbo].[Calender]
ADD CONSTRAINT PK_Calender_Date PRIMARY KEY ([date]);

-- 2. Alter [Customer] table to set [customer_id] as a primary key
ALTER TABLE [DEPI].[dbo].[Customer]
ALTER COLUMN [customer_id] INT NOT NULL;

ALTER TABLE [DEPI].[dbo].[Customer]
ADD CONSTRAINT PK_Customer_Id PRIMARY KEY ([customer_id]);

-- 3. Alter [Product] table to set [product_id] as a primary key
ALTER TABLE [DEPI].[dbo].[Product]
ALTER COLUMN [product_id] INT NOT NULL;

ALTER TABLE [DEPI].[dbo].[Product]
ADD CONSTRAINT PK_Product_Id PRIMARY KEY ([product_id]);

-- 4. Alter [Store] table to set [store_id] as a primary key
ALTER TABLE [DEPI].[dbo].[Store]
ALTER COLUMN [store_id] INT NOT NULL;

ALTER TABLE [DEPI].[dbo].[Store]
ADD CONSTRAINT PK_Store_Id PRIMARY KEY ([store_id]);

-- 5. Alter [Territories] table to set [SalesTerritoryKey] as a primary key
ALTER TABLE [DEPI].[dbo].[Territories]
ALTER COLUMN [SalesTerritoryKey] INT NOT NULL;

ALTER TABLE [DEPI].[dbo].[Territories]
ADD CONSTRAINT PK_Territories_SalesTerritoryKey PRIMARY KEY ([SalesTerritoryKey]);


  ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN [product_id] INT  


  ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN [customer_id] INT  


  ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN [store_id] INT  


 ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN  [quantity]INT
    
	
  ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN [product_id] INT  


  ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN [customer_id] INT  


  ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN [store_id] INT  


 ALTER TABLE  [DEPI].[dbo].[Transactions]
ALTER COLUMN  [quantity]INT
      

	   ALTER TABLE  [DEPI].[dbo].[Return]
ALTER COLUMN [TerritoryKey] INT  

  
  ALTER TABLE  [DEPI].[dbo].[Return]
ALTER COLUMN [ProductKey] INT  

ALTER TABLE  [DEPI].[dbo].[Return]
ALTER COLUMN [ReturnQuantity] INT  


ALTER TABLE  [DEPI].[dbo].[Return]
ALTER COLUMN [ReturnDate] Date  



-- Step 1: Drop the existing foreign key constraint
ALTER TABLE [dbo].[Transactions]
DROP CONSTRAINT FK_Transactions_Customer;

-- Step 2: Recreate the foreign key with ON DELETE CASCADE
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT FK_Transactions_Customer
FOREIGN KEY (customer_id)
REFERENCES [dbo].[Customer](customer_id)
ON DELETE CASCADE;


------------------------------
-- Missing Rows 
 INSERT INTO [dbo].[Calender] ([date], [Year], [Month], [Quarter], [weak])
SELECT DISTINCT [ReturnDate], YEAR([ReturnDate]), MONTH([ReturnDate]), DATEPART(QUARTER, [ReturnDate]), DATEPART(WEEK, [ReturnDate])
FROM [dbo].[Return]
WHERE [ReturnDate] NOT IN (SELECT [date] FROM [dbo].[Calender]);

--------------------------------------------------
alter table product 
alter column product_retail_price float

alter table product 
alter column product_cost float