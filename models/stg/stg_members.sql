WITH MEMBERS AS (
    SELECT 
    TRIM(REGEXP_SUBSTR(rawtext, '\\] (.*?):', 1, 1, 'e', 1)) AS groupmember
    FROM {{ source('whatsapp', 'rawtext')}}
    WHERE rawtext IS NOT NULL
),

REGEX AS (
    SELECT DISTINCT CASE
           WHEN CHARINDEX(':', GROUPMEMBER) > 0 THEN SUBSTRING(GROUPMEMBER, 1, CHARINDEX(':', GROUPMEMBER) - 1)
           ELSE GROUPMEMBER 
           END AS GROUPMEMBER
from MEMBERS
),

MEMBERORDER AS (
    SELECT CASE 
           WHEN GROUPMEMBER = 'danielson' THEN 'Danny'
           WHEN GROUPMEMBER = '+234 803 830 4509' THEN 'Ope'
           WHEN GROUPMEMBER = 'Seyi Adu' THEN 'Seyi'
           WHEN GROUPMEMBER = 'Azu O' THEN 'Azu'
           WHEN GROUPMEMBER = 'Adebolu' THEN 'David'
           WHEN GROUPMEMBER = 'BigFoot' THEN 'Victor'
           WHEN GROUPMEMBER = 'OJ 4real' THEN 'OJ'
           WHEN GROUPMEMBER = 'Shine William' THEN 'Shine'
           ELSE GROUPMEMBER
           END AS GROUPMEMBER,
           ROW_NUMBER() OVER(ORDER BY GROUPMEMBER) AS POSITION
    FROM REGEX
)

SELECT * 
FROM MEMBERORDER




