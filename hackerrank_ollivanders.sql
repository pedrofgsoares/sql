/*
WANDS(ID,CODE,COINS_NEEDED,POWER)
WANDS_PROPERTY(CODE,AGE,IS_EVIL)
ID,AGE,COINS_NEEDED,POWER
*/

SELECT W.ID, P.AGE, W.COINS_NEEDED, W.POWER 
FROM WANDS AS W
JOIN WANDS_PROPERTY AS wP
ON (W.CODE = wP.CODE) 
WHERE wP.IS_EVIL = 0 AND W.COINS_NEEDED = (SELECT MIN(COINS_NEEDED) 
                                          FROM WANDS AS X
                                          JOIN WANDS_PROPERTY AS Y 
                                          ON (X.CODE = Y.CODE) 
                                          WHERE X.POWER = W.POWER AND Y.AGE = WP.AGE) 
ORDER BY W.POWER DESC, WP.AGE DESC;
