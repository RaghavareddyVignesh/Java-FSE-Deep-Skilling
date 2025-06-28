-- Drop tables if they already exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE SavingsAccounts CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Employees CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Accounts CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- Create tables
CREATE TABLE SavingsAccounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerName VARCHAR2(100),
  Balance NUMBER
);

CREATE TABLE Employees (
  EmpID NUMBER PRIMARY KEY,
  Name VARCHAR2(100),
  Department VARCHAR2(50),
  Salary NUMBER
);

CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerName VARCHAR2(100),
  Balance NUMBER
);

-- Insert sample data
INSERT INTO SavingsAccounts VALUES (1, 'John Doe', 10000);
INSERT INTO SavingsAccounts VALUES (2, 'Jane Smith', 12000);

INSERT INTO Employees VALUES (101, 'Alice', 'Sales', 50000);
INSERT INTO Employees VALUES (102, 'Bob', 'Sales', 55000);
INSERT INTO Employees VALUES (103, 'Charlie', 'IT', 60000);

INSERT INTO Accounts VALUES (1, 'John Doe', 10000);
INSERT INTO Accounts VALUES (2, 'John Doe', 5000);
INSERT INTO Accounts VALUES (3, 'Jane Smith', 7000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
  FOR rec IN (SELECT AccountID, Balance FROM SavingsAccounts) LOOP
    UPDATE SavingsAccounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountID = rec.AccountID;
  END LOOP;

  COMMIT;
END;
/

BEGIN
  ProcessMonthlyInterest;
END;
/


CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  deptName IN VARCHAR2,
  bonusPercent IN NUMBER
) AS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * bonusPercent / 100)
  WHERE Department = deptName;

  COMMIT;
END;
/

BEGIN
  UpdateEmployeeBonus('Sales', 10);
END;
/

CREATE OR REPLACE PROCEDURE TransferFunds(
  fromAccount IN NUMBER,
  toAccount IN NUMBER,
  amount IN NUMBER
) AS
  fromBal NUMBER;
BEGIN
  SELECT Balance INTO fromBal FROM Accounts WHERE AccountID = fromAccount;
  IF fromBal < amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account.');
  END IF;
  UPDATE Accounts
  SET Balance = Balance - amount
  WHERE AccountID = fromAccount;
  UPDATE Accounts
  SET Balance = Balance + amount
  WHERE AccountID = toAccount;

  COMMIT;
END;
/

BEGIN
  TransferFunds(1, 2, 1000);
END;
/