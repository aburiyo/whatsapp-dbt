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
           SELECT {{ member_renaming('GROUPMEMBER') }} AS MEMBER,
           ROW_NUMBER() OVER(ORDER BY GROUPMEMBER) AS POSITION
    FROM REGEX
)

SELECT * 
FROM MEMBERORDER




