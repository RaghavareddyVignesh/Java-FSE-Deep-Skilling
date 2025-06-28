-- Drop existing tables if any
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loans CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Customers CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN
    NULL; -- ignore error if tables don't exist
END;
/

-- Step 1: Create Customers table
CREATE TABLE Customers (
  CustomerID   NUMBER PRIMARY KEY,
  Name         VARCHAR2(100),
  Age          NUMBER,
  Balance      NUMBER,
  IsVIP        CHAR(1) DEFAULT 'N'
);

-- Step 2: Create Loans table
CREATE TABLE Loans (
  LoanID       NUMBER PRIMARY KEY,
  CustomerID   NUMBER,
  InterestRate NUMBER,
  DueDate      DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 3: Insert sample data
INSERT INTO Customers VALUES (1, 'John Doe', 65, 15000, 'N');
INSERT INTO Customers VALUES (2, 'Jane Smith', 45, 8000, 'N');
INSERT INTO Customers VALUES (3, 'Mark Lee', 70, 12000, 'N');
INSERT INTO Customers VALUES (4, 'Emily White', 30, 11000, 'N');

INSERT INTO Loans VALUES (101, 1, 10.5, SYSDATE + 15);
INSERT INTO Loans VALUES (102, 2, 12.0, SYSDATE + 40);
INSERT INTO Loans VALUES (103, 3, 11.5, SYSDATE + 10);
INSERT INTO Loans VALUES (104, 4, 9.0,  SYSDATE + 5);

COMMIT;
