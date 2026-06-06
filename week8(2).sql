-- Table 1: Employees
-- SELECT Procedure without parameters 
CREATE PROCEDURE sp_GetAllEmployees
AS 
BEGIN 
    SET NOCOUNT ON;

    SELECT EmployeeID, EmployeeName, DepartmentID
    FROM Employees;
END;
GO 

-- DELETE Procedure with Parameter
CREATE PROCEDURE sp_DeleteEmployeeByID
    @EmpID INT 
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Employees
    WHERE EmployeeID = @EmpID;
END;
GO

-- Table 2: Departments
-- SELECT Procedure with Parameter
CREATE PROCEDURE sp_GetDepartments
    @DeptID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DepartmentID, DepartmentName
    FROM Departmens
    WHERE @DeptID IS NULL OR DepartmentID = @DeptID;
END;
GO

-- DELETE Procedure with Parameter
CREATE PROCEDURE sp_DeleteDapartmentByID
    @DeptID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Departments
    WHERE DepartmentID = @DeptID;
END;
GO