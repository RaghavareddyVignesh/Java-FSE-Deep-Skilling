DECLARE
  CURSOR txn_cursor IS
    SELECT CustomerName, TransID, Amount, TransDate
    FROM Transactions
    WHERE TO_CHAR(TransDate, 'MMYYYY') = TO_CHAR(SYSDATE, 'MMYYYY');

  v_customer Transactions.CustomerName%TYPE;
  v_trans_id Transactions.TransID%TYPE;
  v_amount Transactions.Amount%TYPE;
  v_trans_date Transactions.TransDate%TYPE;
BEGIN
  OPEN txn_cursor;
  LOOP
    FETCH txn_cursor INTO v_customer, v_trans_id, v_amount, v_trans_date;
    EXIT WHEN txn_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Customer: ' || v_customer);
    DBMS_OUTPUT.PUT_LINE('  Transaction ID: ' || v_trans_id);
    DBMS_OUTPUT.PUT_LINE('  Amount: ₹' || v_amount);
    DBMS_OUTPUT.PUT_LINE('  Date: ' || TO_CHAR(v_trans_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
  END LOOP;
  CLOSE txn_cursor;
END;
/