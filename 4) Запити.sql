--????? ????? ? ??????? "CustomersPayments"
SELECT *
FROM CustomersPayments
WHERE CustomerPaymentPercentage = 100.00;

-- ????? ????????? ?? ?????????? ????? ? ??????? "Employees", "SalaryEmployees", "SalaryRates"
SELECT
E.EmployeeId,
E.EmployeeFirstname,
E.EmployeeLastname,
SR.SalaryRateBase,
SE.SalaryEmployeeAwards,
SE.SalaryEmployeePenalties,
(SR.SalaryRateBase + SE.SalaryEmployeeAwards - SE.SalaryEmployeePenalties) AS
SalaryEmployeeTotal
FROM Employees E
JOIN SalaryEmployees SE ON E.EmployeeId = SE.EmployeeId
JOIN SalaryRates SR ON SE.SalaryRateId = SR.SalaryRateId;