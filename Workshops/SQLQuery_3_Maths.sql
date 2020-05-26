SELECT o.OrderID, o.UnitPrice, o.Quantity,o.Discount, 
-- We can generate columns based on equations before stating the alias name --

-- YOUR GROSS TOTAL = PRICE * BY HOW MANY IN THE ORDER --
o.UnitPrice*o.Quantity AS "Gross Total",
-- YOUR NET TOTAL WHICH IS THE GROSS MINUS THE DISCOUNT DONE AS SEPARATE EXPRESSION --
o.UnitPrice*o.Quantity*(1-o.Discount) AS "Net Total"
FROM [Order Details] o
ORDER BY "Net Total" DESC

--NET TOTAL=Gross Total-Discount*Gross Total
--         =Gross Total*(1-Discount)

