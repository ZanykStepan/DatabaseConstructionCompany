ALTER TABLE Positions
ADD CONSTRAINT FK_Positions_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId);

ALTER TABLE DepartmentWorkers
ADD CONSTRAINT FK_DepartmentWorkers_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId),
    CONSTRAINT FK_DepartmentWorkers_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	CONSTRAINT FK_DepartmentWorkers_Position FOREIGN KEY (PositionId) REFERENCES Positions(PositionId);

ALTER TABLE ProjectWorkers
ADD CONSTRAINT FK_ProjectWorkers_Employee FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	CONSTRAINT FK_ProjectWorkers_Project FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId)

ALTER TABLE WorkScheduleEmployees
ADD CONSTRAINT FK_WorkScheduleEmployees_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	CONSTRAINT FK_WorkScheduleEmployees_WorkHourNormEmployeeId FOREIGN KEY (WorkHourNormEmployeeId) REFERENCES WorkHoursNormEmployees(WorkHourNormEmployeeId);

ALTER TABLE SalaryEmployees
ADD CONSTRAINT FK_SalaryEmployees_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId),
	CONSTRAINT FK_SalaryEmployees_SalaryRateId FOREIGN KEY (SalaryRateId) REFERENCES SalaryRates(SalaryRateId);

ALTER TABLE SalaryRates
ADD CONSTRAINT FK_SalaryRates_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId);

ALTER TABLE ProjectLocations
ADD CONSTRAINT FK_ProjectLocations_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE ProjectDetails
ADD CONSTRAINT FK_ProjectDetails_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE DocumentsOfProject
ADD CONSTRAINT FK_DocumentsOfProject_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE SalesDepartmentContacts
ADD CONSTRAINT FK_SalesDepartmentContacts_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE Apartaments
ADD CONSTRAINT FK_Apartaments_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE Inventory
ADD CONSTRAINT FK_Inventory_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE Materials
ADD CONSTRAINT FK_Materials_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    CONSTRAINT FK_Materials_Logistics FOREIGN KEY (LogisticId) REFERENCES Logistics(LogisticId);

ALTER TABLE Logistics
ADD CONSTRAINT FK_Logistics_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    CONSTRAINT FK_Logistics_Materials FOREIGN KEY (MaterialId) REFERENCES Materials(MaterialId);

ALTER TABLE Customers
ADD CONSTRAINT FK_Customers_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    CONSTRAINT FK_Customers_Apartaments FOREIGN KEY (ApartamentId) REFERENCES Apartaments(ApartamentId);

ALTER TABLE CustomersPayments
ADD CONSTRAINT FK_CustomersPayments_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    CONSTRAINT FK_CustomersPayments_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    CONSTRAINT FK_CustomersPayments_Apartaments FOREIGN KEY (ApartamentId) REFERENCES Apartaments(ApartamentId);

ALTER TABLE Partners
ADD CONSTRAINT FK_Partners_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE ProjectPayments
ADD CONSTRAINT FK_ProjectPayments_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);

ALTER TABLE Reports
ADD CONSTRAINT FK_Reports_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId);
