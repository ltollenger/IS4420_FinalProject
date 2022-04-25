USE FinalProject_Group8;
GO


SELECT
   E.*,
   T.*
FROM EMPLOYEES AS E
LEFT JOIN TRUCKER AS T ON E.EmployeeID = T.EmployeeID
