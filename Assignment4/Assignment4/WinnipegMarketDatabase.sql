USE MASTER
DROP DATABASE dbWinnipegMarket
GO
CREATE DATABASE dbWinnipegMarket
GO
USE dbWinnipegMarket
GO

CREATE TABLE tbCategories 
(
	Cat_ID INT IDENTITY(1,1) PRIMARY KEY,
	Cat_Name VARCHAR(MAX)
)

CREATE TABLE tbBrands
(
	Brand_ID INT IDENTITY(1,1) PRIMARY KEY,
	Brand_Name VARCHAR(MAX)
)

CREATE TABLE tbStores
(
	Store_ID INT IDENTITY(1,1) PRIMARY KEY,
	Store_Name VARCHAR(MAX),
	Address VARCHAR(MAX)
)

CREATE TABLE tbProducts
(
	Pro_ID INT IDENTITY(1,1) PRIMARY KEY,
	Pro_Name VARCHAR(MAX),
	Price SMALLMONEY,
	Product_Image VARCHAR(MAX),
	Brand INT FOREIGN KEY REFERENCES tbBrands(Brand_ID),
	Description VARCHAR(MAX),
	Category INT FOREIGN KEY REFERENCES tbCategories(Cat_ID),
	Store INT FOREIGN KEY REFERENCES tbStores(Store_ID)
)

CREATE TABLE tbUsers
(
	User_ID INT IDENTITY(1,1) PRIMARY KEY,
	Password VARCHAR(MAX),
	First_Name VARCHAR(MAX),
	Last_Name VARCHAR(MAX),
	PhoneNumber VARCHAR(MAX),
	CustomerAddress VARCHAR(MAX),
	Email VARCHAR(MAX),
	User_Type INT -- 1 = Admin, 0 = Customer
)

CREATE TABLE tbOrders
(
	Order_ID INT IDENTITY(1,1) PRIMARY KEY,
	Customer INT FOREIGN KEY REFERENCES tbUsers(User_ID),
	Price_Paid SMALLMONEY,
	Order_Date DATE
)

CREATE TABLE tbOrderDetails
(
	Order_ID INT FOREIGN KEY REFERENCES tbOrders(Order_ID),
	Order_Detail_ID INT IDENTITY(1,1) PRIMARY KEY,
	Product INT FOREIGN KEY REFERENCES tbProducts(Pro_ID),
	Quantity INT,
	Subtotal SMALLMONEY
)

-- Inserts

INSERT INTO tbCategories VALUES
('Electronics'),('Clothing'),('Hair Products'),('Makeup & Skincare'),('Children Items'),
('Books'),('Education'),('Pets & Supplies'),('Home & Garden'),('Camping & Outdoors')

INSERT INTO tbBrands VALUES
('Whiskers'),('Chi'),('M.A.C'),('EduCate'),('Fashionable Kids'),
('Sony'),('Pate-O'),('Silver'),('Indigo'),('Outdoors')

INSERT INTO tbStores VALUES
('Walmart','123 SomeWhere Street R3C 1Y2'),
('Petsmart','123 SomeWhereElse Street R3C 1Y2')

INSERT INTO tbProducts VALUES
('Acer Laptop',450.00,'Acer_Laptop.jpg',6,'Portable Computer',1,1),
('Leash',12.00,'IMAGE2',1,'Used to walk animals',8,1)



-- Selects

--SELECT * FROM tbCategories
--SELECT * FROM tbBrands
--SELECT * FROM tbProducts
--SELECT * FROM tbStores
--SELECT * FROM tbUsers

-- Stored Procedures
GO

-- Stored Procedures Specific to tbCategories
CREATE PROC spGetCategoriesByID
(@Cat_ID INT = NULL)
AS
BEGIN
	SELECT * FROM tbCategories WHERE Cat_ID = ISNULL(@Cat_ID, Cat_ID)
END
GO

CREATE PROC spAddCategories
(@Cat_Name VARCHAR(MAX))
AS
BEGIN
	INSERT INTO tbCategories VALUES (@Cat_Name)
END
GO

CREATE PROC spDeleteCategories
(@Cat_ID INT)
AS
BEGIN
	DELETE FROM tbCategories WHERE Cat_ID = @Cat_ID
END
GO

CREATE PROC spUpdateCategories
(@Cat_ID INT, @Cat_Name VARCHAR(MAX))
AS 
BEGIN
	UPDATE tbCategories SET Cat_Name = @Cat_Name
	WHERE Cat_ID = @Cat_ID
END
GO

-- Stored Procedures Specific to tbBrands
CREATE PROC spGetBrandsByID
(@Brand_ID INT = NULL)
AS
BEGIN
	SELECT * FROM tbBrands WHERE Brand_ID = ISNULL(@Brand_ID, Brand_ID)
END
GO

CREATE PROC spAddBrands
(@Brand_Name VARCHAR(MAX))
AS
BEGIN
	INSERT INTO tbBrands VALUES (@Brand_Name)
END
GO

CREATE PROC spDeleteBrands
(@Brand_ID INT)
AS
BEGIN
	DELETE FROM tbBrands WHERE Brand_ID = @Brand_ID
END
GO

CREATE PROC spUpdateBrands
(@Brand_ID INT, @Brand_Name VARCHAR(MAX))
AS 
BEGIN
	UPDATE tbBrands SET Brand_Name = @Brand_Name
	WHERE Brand_ID = @Brand_ID
END
GO

-- Stored Procedures Specific to tbProducts

-- This gives you the option to search products by ID, Name, Price, Store or Category

CREATE PROCEDURE spNewProducts
as
begin 
	Select * from tbProducts Where Pro_ID > 10
end
go

CREATE PROCEDURE spSearchProducts
(
	@Pro_ID INT = NULL,
	@Pro_Name VARCHAR(MAX) = NULL,
	@Pro_Price VARCHAR(MAX) = NULL,
	@Pro_Brand INT = NULL,
	@Category INT = NULL,
	@Store INT = NULL
)
AS
BEGIN
-- Lists Products Based on the ID
	IF(@Pro_ID IS NOT NULL)
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Pro_ID = @Pro_ID
--Lists Products based on the Product Name
	ELSE IF(@Pro_Name IS NOT NULL)
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Pro_Name = @Pro_Name
--Lists Products based on the Price
	ELSE IF(@Pro_Price IS NOT NULL)
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Price = @Pro_Price
-- Lists Products based on the Brand
	ELSE IF(@Pro_Brand IS NOT NULL)
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Brand_ID = @Pro_Brand
-- Lists Products based on the Category
	ELSE IF(@Category IS NOT NULL)
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Category = @Category
-- Lists Products based on the Stores that they are at
	ELSE IF(@Store IS NOT NULL)
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Store_ID = @Store
--If there are no search parameters it just lists all of the products
	ELSE
		SELECT Pro_ID AS 'ID', Pro_Name AS 'Product', Price,
			   './web/images/' + Product_Image AS 'Image', Description,
			   Brand_Name,Category,Store_Name
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		JOIN tbBrands B ON P.Brand = B.Brand_ID
		WHERE Pro_ID = ISNULL (@Pro_ID, Pro_ID)
END
GO

CREATE PROC spAddProducts
(
	@Pro_Name VARCHAR(MAX),
	@Pro_Price SMALLMONEY,
	@Pro_Image VARCHAR(MAX),
	@Brand INT,
	@Category INT,
	@Store INT,
	@Description VARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO tbProducts VALUES
	(@Pro_Name,@Pro_Price,@Pro_Image,@Brand,@Category,@Store,@Description)
END
GO

CREATE PROCEDURE spDeleteProducts
(@Pro_ID INT)
AS
BEGIN
	DELETE FROM tbProducts WHERE Pro_ID = @Pro_ID
END
GO

CREATE PROCEDURE spUpdateProducts
(
	@Pro_ID INT,
	@Pro_Name VARCHAR(MAX) = NULL,
	@Pro_Price SMALLMONEY = NULL,
	@Pro_Image VARCHAR(MAX) = NULL,
	@Brand INT = NULL,
	@Category INT = NULL,
	@Store INT = NULL,
	@Description VARCHAR(MAX) = NULL
)
AS
BEGIN
	UPDATE tbProducts SET
			Pro_Name = ISNULL (@Pro_Name, Pro_Name),
			Price = ISNULL (@Pro_Price, Price),
			Product_Image = ISNULL (@Pro_Image, Product_Image),
			Brand = ISNULL (@Brand, Brand),
			Category = ISNULL (@Category, Category),
			Store = ISNULL (@Store, Store),
			Description = ISNULL (@Description, Description)
	WHERE Pro_ID = @Pro_ID
END
GO

CREATE PROC spSearchStores
(
	@Store_ID INT = NULL,
	@Store_Name VARCHAR(MAX) = NULL,
	@Store_Address VARCHAR(MAX) = NULL,
	@Products INT = NULL
)
AS
BEGIN
	IF(@Store_ID IS NOT NULL)
		SELECT * FROM tbStores
		WHERE Store_ID = @Store_ID
	ELSE IF(@Store_Name IS NOT NULL)
		SELECT * FROM tbStores
		WHERE Store_Name = @Store_Name
	ELSE IF(@Store_Address IS NOT NULL)
		SELECT * FROM tbStores
		WHERE Address = @Store_Address
	ELSE IF(@Products IS NOT NULL)
		SELECT Store_ID as 'ID', Store_Name as 'Store',
		Pro_Name as 'Product'
		FROM tbStores S
		JOIN tbProducts P ON S.Store_ID = P.Store
		WHERE p.Pro_ID = @Products
	ELSE
		SELECT * FROM tbStores
		WHERE Store_ID = ISNULL (@Store_ID, Store_ID)
END
GO

CREATE PROC spAddStores
(
	@Store_Name VARCHAR(MAX),
	@Store_Location VARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO tbStores(Store_Name,Address) VALUES
	(@Store_Name, @Store_Location)
END
GO

CREATE PROC spDeleteStores
( @Store_ID INT)
AS
BEGIN
	DELETE FROM tbStores WHERE Store_ID = @Store_ID
END
GO

CREATE PROC spUpdateStores
(
	@Store_ID INT,
	@Store_Name VARCHAR(MAX) = NULL,
	@Store_Location VARCHAR(MAX) = NULL
)
AS
BEGIN
	UPDATE tbStores SET
		Store_Name = ISNULL (@Store_Name, Store_Name),
		Address = ISNULL (@Store_Location, @Store_Location)
	WHERE Store_ID = @Store_ID
END
GO

CREATE PROC spGetUsers
( @User_ID INT = NULL )
AS
BEGIN
	SELECT * FROM tbUsers
	WHERE User_ID = ISNULL (@User_ID, User_ID)
END
GO

CREATE PROC spAddUsers
(
	@Password VARCHAR(MAX),
	@First_Name VARCHAR(MAX),
	@Last_Name VARCHAR(MAX),
	@Email VARCHAR(MAX),
	@Address VARCHAR(MAX),
	@PhoneNumber VARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO tbUsers (Password,First_Name,Last_Name,
	Email, User_Type,CustomerAddress,PhoneNumber) VALUES
	(@Password, @First_Name, @Last_Name, @Email, 
	1,@Address,@PhoneNumber)
END
GO
CREATE PROC spDeleteUsers
( @User_ID INT)
AS
BEGIN
	DELETE FROM tbUsers WHERE User_ID = @User_ID
END
GO

CREATE PROC spUpdateUsers
(
	@User_ID INT,
	@Username VARCHAR(MAX) = NULL,
	@Password VARCHAR(MAX) = NULL,
	@First_Name VARCHAR(MAX) = NULL,
	@Last_Name VARCHAR(MAX) = NULL,
	@Email VARCHAR(MAX) = NULL,
	@Address VARCHAR(MAX) = NULL,
	@Phone VARCHAR(MAX) = NULL,
	@User_Type INT = NULL
)
AS
BEGIN
	UPDATE tbUsers SET
		Password = ISNULL (@Password, Password),
		First_Name = ISNULL (@First_Name, First_Name),
		CustomerAddress = ISNULL(@Address, CustomerAddress),
		PhoneNumber = ISNULL(@Phone, PhoneNumber),
		Last_Name = ISNULL (@Last_Name, Last_Name),
		Email = ISNULL (@Email, Email),
		User_Type = ISNULL (@User_Type, User_Type)
	WHERE User_ID = @User_ID
END
GO

CREATE PROC spLogin
(
	@Email VARCHAR(MAX) = NULL,
	@Password VARCHAR(MAX)
)
AS
BEGIN
	IF(@Email IS NOT NULL)
		SELECT * FROM tbUsers
		WHERE Email = @Email AND
			  Password = @Password
END
GO

CREATE PROC spViewOrders
(
	@Order_ID INT = NULL,
	@Customer INT = NULL,
	@Order_Date DATE = NULL
)
AS
BEGIN
	IF(@Customer IS NOT NULL)
		SELECT * FROM tbOrders WHERE Customer = @Customer
	ELSE IF(@Order_Date IS NOT NULL)
		SELECT * FROM tbOrders WHERE Order_Date = @Order_Date
	ELSE
		SELECT * FROM tbOrders WHERE Order_ID = ISNULL 
		(@Order_ID, Order_ID)
END
GO

CREATE PROC spAddOrders
( 
	@Customer INT,
	@Prics_Paid SMALLMONEY,
	@Order_Date DATE
)
AS
BEGIN
	INSERT INTO tbOrders VALUES
	(@Customer, @Prics_Paid, @Order_Date)
END
GO

CREATE PROC spDeleteOrders
( @Order_ID INT )
AS
BEGIN
	DELETE FROM tbOrders WHERE Order_ID = @Order_ID
END
GO

CREATE PROC spUpdateOrders
(
	@Order_ID INT,
	@Customer INT = NULL,
	@Price_Paid SMALLMONEY = NULL,
	@Order_Date DATE = NULL
)
AS
BEGIN
	UPDATE tbOrders SET
		Customer = ISNULL(@Customer,Customer),
		Price_Paid = ISNULL(@Price_Paid,Price_Paid),
		Order_Date = ISNULL(@Order_Date,Order_Date)
	WHERE Order_ID = @Order_ID
END
GO

CREATE PROC spGetOrderDetails
( @Order_Details_ID INT = NULL )
AS
BEGIN
	SELECT Order_ID, Order_Detail_ID, Product, Price, Quantity,
	Quantity * Price AS [Subtotal] FROM tbOrderDetails OD
	JOIN tbProducts P ON OD.Product = P.Pro_ID
	WHERE Order_Detail_ID = ISNULL 
	(@Order_Details_ID, Order_Detail_ID)
END
GO

CREATE PROC spAddOrderDetails
(
	@Order_ID INT,
	@Product INT,
	@Quantity INT
)
AS
BEGIN
	INSERT INTO tbOrderDetails(Order_ID, Product, Quantity) VALUES
	(@Order_ID,@Product,@Quantity)
END
GO

CREATE PROC spDeleteOrderDetails
( @Order_Details_ID INT )
AS
BEGIN
	DELETE FROM tbOrderDetails 
	WHERE Order_Detail_ID = @Order_Details_ID
END
GO

CREATE PROC spUpdateOrderDetails
(
	@Order_Details_ID INT,
	@Order_ID INT = NULL,
	@Product INT = NULL,
	@Quantity INT = NULL
)
AS
BEGIN
	UPDATE tbOrderDetails SET
		Order_ID = ISNULL (@Order_ID, Order_ID),
		Product = ISNULL (@Product, Product),
		Quantity = ISNULL (@Quantity, Quantity)
	WHERE Order_Detail_ID = @Order_Details_ID
END
GO

CREATE PROC spProductListByCategory
AS
BEGIN
	SELECT * FROM tbProducts p
	JOIN tbCategories c ON p.Category = c.Cat_ID
END
GO

