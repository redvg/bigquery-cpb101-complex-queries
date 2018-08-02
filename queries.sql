/*
delays from La Guardia
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
  
/*
returns the total number of flights (each flight has departure delay?) by each airline from La Guardia,
*/
  
SELECT
  airline,
  COUNT(departure_delay) as foo
FROM
   `bigquery-samples.airline_ontime_data.flights`
WHERE
  departure_airport = 'LGA'
  AND date = '2008-05-13'
GROUP BY
  airline
ORDER BY airline

/*
returns the total number of DELAYED flights by each airline from La Guardia
*/

SELECT
  airline,
  COUNT(departure_delay) as delayed
FROM
   `bigquery-samples.airline_ontime_data.flights`
WHERE
  departure_delay > 0 AND
  departure_airport = 'LGA'
  AND date = '2008-05-13'
GROUP BY
  airline
ORDER BY airline

/*
return both the number delayed as well as the total number of flights
*/

SELECT
  airline,
  COUNT(departure_delay) AS total,
  SUM(IF(departure_delay > 0, 1, 0)) AS delayed
FROM
   `bigquery-samples.airline_ontime_data.flights`
WHERE
  departure_airport = 'LGA' AND date = '2008-05-13'
GROUP BY
  airline


