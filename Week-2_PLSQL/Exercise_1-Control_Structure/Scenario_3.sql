SET SERVEROUTPUT ON;

BEGIN
  FOR rec IN (
    SELECT L.LoanID, C.Name, L.DueDate
    FROM Loans L
    JOIN Customers C ON L.CustomerID = C.CustomerID
    WHERE L.DueDate <= SYSDATE + 30
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Reminder: ' || rec.Name || ' has a loan due on ' || TO_CHAR(rec.DueDate, 'DD-MON-YYYY')
    );
  END LOOP;
END;
/