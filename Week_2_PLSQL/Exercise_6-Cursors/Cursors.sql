-- Drop tables if they exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Transactions CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Accounts CASCADE CONSTRAINTS';
  EXECUTE IMMEDIATE 'DROP TABLE Loans CASCADE CONSTRAINTS';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Transactions (
  TransID NUMBER PRIMARY KEY,
  AccountID NUMBER,
  CustomerName VARCHAR2(100),
  Amount NUMBER,
  TransDate DATE
);

CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerName VARCHAR2(100),
  Balance NUMBER
);

CREATE TABLE Loans (
  LoanID NUMBER PRIMARY KEY,
  CustomerName VARCHAR2(100),
  InterestRate NUMBER
);

INSERT INTO Transactions VALUES (1, 101, 'John Doe', 2000, SYSDATE);
INSERT INTO Transactions VALUES (2, 102, 'Jane Smith', -500, ADD_MONTHS(SYSDATE, -1));
INSERT INTO Transactions VALUES (3, 103, 'Alice Brown', 1500, SYSDATE);

INSERT INTO Accounts VALUES (101, 'John Doe', 10000);
INSERT INTO Accounts VALUES (102, 'Jane Smith', 8000);
INSERT INTO Accounts VALUES (103, 'Alice Brown', 12000);

INSERT INTO Loans VALUES (201, 'John Doe', 5.5);
INSERT INTO Loans VALUES (202, 'Jane Smith', 6.0);

COMMIT;

DECLARE
  CURSOR acc_cursor IS
    SELECT AccountID, Balance FROM Accounts;

  v_acc_id Accounts.AccountID%TYPE;
  v_balance Accounts.Balance%TYPE;
  v_fee CONSTANT NUMBER := 500;
BEGIN
  OPEN acc_cursor;
  LOOP
    FETCH acc_cursor INTO v_acc_id, v_balance;
    EXIT WHEN acc_cursor%NOTFOUND;

    UPDATE Accounts
    SET Balance = Balance - v_fee
    WHERE AccountID = v_acc_id;

    DBMS_OUTPUT.PUT_LINE('Annual fee of ₹' || v_fee || ' applied to Account ID: ' || v_acc_id);
  END LOOP;
  CLOSE acc_cursor;

  COMMIT;
END;
/


DECLARE
  CURSOR loan_cursor IS
    SELECT LoanID, InterestRate FROM Loans;

  v_loan_id Loans.LoanID%TYPE;
  v_interest Loans.InterestRate%TYPE;
BEGIN
  OPEN loan_cursor;
  LOOP
    FETCH loan_cursor INTO v_loan_id, v_interest;
    EXIT WHEN loan_cursor%NOTFOUND;

    IF v_interest < 6 THEN
      UPDATE Loans
      SET InterestRate = v_interest + 0.5
      WHERE LoanID = v_loan_id;

      DBMS_OUTPUT.PUT_LINE('Loan ID: ' || v_loan_id || ' → Interest increased to ' || (v_interest + 0.5));
    ELSE
      UPDATE Loans
      SET InterestRate = v_interest - 0.25
      WHERE LoanID = v_loan_id;

      DBMS_OUTPUT.PUT_LINE('Loan ID: ' || v_loan_id || ' → Interest decreased to ' || (v_interest - 0.25));
    END IF;
  END LOOP;
  CLOSE loan_cursor;

  COMMIT;
END;
/