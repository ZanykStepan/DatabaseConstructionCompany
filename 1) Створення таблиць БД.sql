-- Таблиця відділів 1
CREATE TABLE Departments (
    DepartmentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    DepartmentName NVARCHAR(255) NOT NULL,
    DepartmentLocation NVARCHAR(255),
	DepartmentPhone NVARCHAR(255),
    DepartmentEmail NVARCHAR(255),
);
-- Таблиця посад 2
CREATE TABLE Positions(
	PositionId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	DepartmentId INT NOT NULL,
	PositionName NVARCHAR(255) NOT NULL
);
-- Таблиця працівників 3
CREATE TABLE Employees(
    EmployeeId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeLastname NVARCHAR(255) NOT NULL,
    EmployeeFirstname NVARCHAR(255) NOT NULL,
    EmployeeDateOfBirth DATE,
    EmployeePhone NVARCHAR(255),
    EmployeeEmail NVARCHAR(255),
    EmployeeHiredate DATE
);
-- Таблиця проектів 4
CREATE TABLE Projects(
    ProjectId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectName NVARCHAR(255) NOT NULL,
    ProjectStartDate DATE,
    ProjectEndDate DATE
);
-- Таблиця прив’язки працівника до департаменту 5
CREATE TABLE DepartmentWorkers(
	DepartmentWorkerId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	DepartmentId INT NOT NULL,
	EmployeeId INT NOT NULL,
	PositionId INT NOT NULL,
	DepartmentWorkerStartDate DATE,
	DepartmentWorkerEndDate DATE
);
-- Таблиця прив’язки працівника до проєкту 6
CREATE TABLE ProjectWorkers(
	ProjectWorkerId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeId INT NOT NULL,
	ProjectId INT NOT NULL,
	ProjectWorkerStartDate DATE,
	ProjectWorkerEndDate DATE
);
-- Таблиця годинної робочої норми 7
CREATE TABLE WorkHoursNormEmployees(
	WorkHourNormEmployeeId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeId INT NOT NULL,
	WorkHourNormCount DECIMAL(10,2) NOT NULL,
	WorkHourNormStartDate DATE NOT NULL,
	WorkHourNormEndDate DATE,
	WorkHourNormIsActive BIT NOT NULL DEFAULT 1
);
-- Облік годинної роботи працівників 8
CREATE TABLE WorkScheduleEmployees(
    WorkScheduleEmployeeId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeId INT NOT NULL,
	WorkHourNormEmployeeId INT NOT NULL,
    WorkScheduleEmployeeDay DATE NOT NULL,
    WorkScheduleEmployeeTimeStart TIME NOT NULL,
    WorkScheduleEmployeeTimeEnd TIME NOT NULL,
	WorkScheduleEmployeeHours AS (CAST(DATEDIFF(MINUTE, WorkScheduleEmployeeTimeStart, WorkScheduleEmployeeTimeEnd) / 60.0 AS DECIMAL(10,2))) PERSISTED,
	WorkScheduleEmployeeOvertimeHours DECIMAL(10,2) DEFAULT 0.0, 
	WorkScheduleEmployeeIsOvertime BIT NOT NULL DEFAULT 0
);
-- Облік з/п працівників 9
CREATE TABLE SalaryEmployees(
	SalaryEmployeesId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeId INT NOT NULL,
	SalaryRateId INT NOT NULL,
	SalaryEmployeeDate DATE NOT NULL,
	SalaryEmployeeAwards DECIMAL(10, 2) NOT NULL DEFAULT 0.0,
	SalaryEmployeePenalties DECIMAL(10, 2) NOT NULL DEFAULT 0.0,
    SalaryEmployeeTotal DECIMAL(10,2)
);
-- Ставка з/п працівників 10
CREATE TABLE SalaryRates(
	SalaryRateId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EmployeeId INT NOT NULL,
	SalaryRateBase DECIMAL(10,2) NOT NULL,
	SalaryRateOverTime DECIMAL(10,2) NOT NULL DEFAULT 0.0,
	SalaryRateStartDate DATE NOT NULL,
    SalaryRateEndDate DATE,
	SalaryRateIsActive BIT NOT NULL DEFAULT 1
);
-- Таблиця розташування проектів 11
CREATE TABLE ProjectLocations(
    ProjectLocationId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    ProjectLocationCity NVARCHAR(255),
    ProjectLocationMicrodistrict NVARCHAR(255),
    ProjectLocationStreet NVARCHAR(255),
    ProjectLocationHouseNumber NVARCHAR(255)
);
-- Таблиця деталей проектів 12
CREATE TABLE ProjectDetails(
    ProjectDetailId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    ProjectDetailClass NVARCHAR(255),
    ProjectDetailHouses INT,
    ProjectDetailSuperficiality INT,
	ProjectDetailConstructionTechnology NVARCHAR(255),
    ProjectDetailWalls NVARCHAR(255),
    ProjectDetailWarming NVARCHAR(255),
    ProjectDetailCeilingHeight FLOAT,
    ProjectDetailNumberOfApartaments INT,
    ProjectDetailTypeOfTerritory NVARCHAR(255),
    ProjectDetailTypeOfParking NVARCHAR(255)
);
-- Таблиця документів проектів 13
CREATE TABLE DocumentsOfProject(
    DocumentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    DocumentForLandPlot NVARCHAR(255),
    DocumentCadastralNumber NVARCHAR(255),
    DocumentRightConstruction NVARCHAR(255),
    DocumentLimitation NVARCHAR(255),
    DocumentParticipants NVARCHAR(255)
);
-- Контакти відділу продажів 14
CREATE TABLE SalesDepartmentContacts(
    SalesDepContactId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL, 
    SalesDepContactLocation NVARCHAR(255),
    SalesDepContactWorkTimeStart TIME,
	SalesDepContactWorkTimeEnd TIME,
    SalesDepContactPhone NVARCHAR(255)
);
-- Таблиця квартир 15
CREATE TABLE Apartaments(
    ApartamentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    ApartamentFloor INT,
    ApartamentRoominess INT,
    ApartamentArea FLOAT NOT NULL,
    ApartamentPricePerSquareMeter DECIMAL(10, 2) NOT NULL,
    ApartamentTotalPrice AS (ApartamentArea * ApartamentPricePerSquareMeter) PERSISTED
);
-- Таблиця інвентаря 16
CREATE TABLE Inventory(
    InventoryId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    InventoryName NVARCHAR(255),
    InventoryDescription NTEXT,
    InventoryLocation NVARCHAR(255)
);
-- Таблиця матеріалів 17
CREATE TABLE Materials(
    MaterialId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
	LogisticId INT NOT NULL,
    MaterialName NVARCHAR(255),
    MaterialQuantity INT NOT NULL,
    MaterialUnitPrice DECIMAL(10, 2) NOT NULL,
    MaterialTotalCost AS (MaterialQuantity * MaterialUnitPrice) PERSISTED
);
-- Таблиця логістики 18
CREATE TABLE Logistics(
    LogisticId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
	MaterialId INT NOT NULL,
    LogisticSupplier NVARCHAR(255),
    LogisticDate DATETIME
);
-- Таблиця клієнтів 19
CREATE TABLE Customers(
    CustomerId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
	ApartamentId INT NOT NULL,
    CustomerLastName NVARCHAR(255),
    CustomerFirstName NVARCHAR(255) NOT NULL,
    CustomerPhone NVARCHAR(255),
    CustomerEmail NVARCHAR(255)
);
-- Таблиця платежі клієнтів 20
CREATE TABLE CustomersPayments(
	CustomerPaymentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ProjectId INT NOT NULL,
	CustomerId INT NOT NULL,
	ApartamentId INT NOT NULL,
	CustomerPaymentMethod NVARCHAR(255) NOT NULL,
	CustomerPaymentSum DECIMAL(10, 2) NOT NULL,
	CustomerPaymentDate DATE,
	CustomerPaymentPercentage DECIMAL(5,2) NOT NULL
);
-- Таблиця партнерів 21
CREATE TABLE Partners(
    PartnerId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    PartnerCompanyName NVARCHAR(255) NOT NULL,
    PartnerCompanyAddress NVARCHAR(255),
    PartnerCompanyContactPersonName NVARCHAR(255),
    PartnerCompanyContactPersonPhone NVARCHAR(255),
    PartnerCompanyContactPersonEmail NVARCHAR(255),
    PartnerCompanyCooperationTerms NTEXT
);
-- Таблиця фінансового обліку по платежах 22
CREATE TABLE ProjectPayments(
    PaymentId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    PaymentDate DATE NOT NULL,
	PaymentName NVARCHAR(255) NOT NULL,
	PaymentType NVARCHAR(255) NOT NULL,
    PaymentDescription NTEXT,
    PaymentAmount DECIMAL(10, 2) NOT NULL
);
-- Звіти 23
CREATE TABLE Reports(
	ReportId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
	ReportType NVARCHAR(50) NOT NULL,
	ReportDate DATE NOT NULL,
	ReportTotalIncome DECIMAL(15, 2) NOT NULL,
    ReportTotalExpenses DECIMAL(15, 2) NOT NULL, 
    ReportNetProfit AS (ReportTotalIncome - ReportTotalExpenses) PERSISTED
);
