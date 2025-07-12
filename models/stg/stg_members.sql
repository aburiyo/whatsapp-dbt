WITH members AS (
    SELECT 
    TRIM(REGEXP_SUBSTR(rawtext, '\\] (.*?):', 1, 1, 'e', 1)) AS groupmember
    FROM {{ source('whatsapp', 'rawtext')}}
    WHERE rawtext IS NOT NULL
),

regex AS (
    SELECT CASE
           WHEN CHARINDEX(':', groupmember) > 0 THEN SUBSTRING(groupmember, 1, CHARINDEX(':', groupmember) - 1)
           ELSE groupmember 
           END AS groupmember
from members
)

SELECT * 
FROM regex
