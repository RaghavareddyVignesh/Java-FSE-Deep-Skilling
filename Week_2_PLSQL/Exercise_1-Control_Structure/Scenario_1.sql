SELECT 
  C.Name, C.Age, L.LoanID, L.InterestRate
FROM 
  Customers C
JOIN 
  Loans L ON C.CustomerID = L.CustomerID;