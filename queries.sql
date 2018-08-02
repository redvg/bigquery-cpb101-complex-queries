/*
delays from LGA
*/

SELECT
  airline,
  date,
  departure_delay
FROM
  `bigquery-samples.airline_ontime_data.flights`
WHERE
  departure_delay > 0
  AND departure_airport = 'LGA'
LIMIT
  100

