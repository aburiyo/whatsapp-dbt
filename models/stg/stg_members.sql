WITH members AS (
    SELECT *
    FROM {{ source('whatsapp', 'rawtext')}}
)

SELECT 
TRIM(REGEXP_SUBSTR(rawtext, '\\] (.*?):', 1, 1, 'e', 1)) AS groupmember
FROM members