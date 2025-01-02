-- View ??????? ? ??????? «Projects», «ProjectDetails» ?? «ProjectLocations»
CREATE VIEW ProjectLocationsView AS
SELECT
p.projectId,
p.projectName,
d.ProjectDetailClass,
l.ProjectLocationCity,
l.ProjectLocationMicrodistrict,
l.ProjectLocationStreet,
l.ProjectLocationHouseNumber,
p.projectStartDate,
p.projectEndDate
FROM projects p
INNER JOIN ProjectLocations l
ON p.projectId = l.ProjectId
INNER JOIN ProjectDetails d
ON p.projectId = d.ProjectId;

-- View ??????? ? ? ??????? «Customers» ?? «CustomersPayments» 
CREATE VIEW CustomersPaymentsView AS
SELECT
c.CustomerId,
c.CustomerFirstName,
c.CustomerLastName,
p.CustomerPaymentId,
p.CustomerPaymentDate,
p.CustomerPaymentMethod,
p.CustomerPaymentSum,
p.CustomerPaymentPercentage
FROM Customers c
INNER JOIN CustomersPayments p
ON c.CustomerId = p.CustomerId;

