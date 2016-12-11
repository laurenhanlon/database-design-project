"""
Query 5: Budget calculation & forecasting


This query will select a month to month budget estimate from the most recent 3 years. This will be used in a budget calculation and forecasting model, using Holt-Winter’s method to account for year-over-year cost increases, semester variations, and monthly variations.
"""

SELECT Transaction.[Amount], Month(Transaction.[Date_logged]), Year(Transaction.[Date_logged])
FROM Transaction
WHERE Year(Transaction.[Date_logged]) > Year(Transaction.[Date_logged]) - 4;
