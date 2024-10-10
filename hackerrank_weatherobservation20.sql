SELECT ROUND(LAT_N,4)
FROM
(
    SELECT LAT_N, ROW_NUMBER() OVER(
                                ORDER BY LAT_N) AS ROW_NUM
    FROM STATION
) AS AUX
WHERE ROW_NUM = (SELECT FLOOR((COUNT(ROW_NUM)+1)/2) FROM station);
