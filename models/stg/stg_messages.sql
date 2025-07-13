WITH MESSAGES AS (
    SELECT *
    FROM {{ source('whatsapp', 'rawtext')}}
),

REGEX AS (

    SELECT 
        TRIM(REGEXP_SUBSTR(rawtext, '\\] (.*?):', 1, 1, 'e', 1)) AS sender,
        TRIM(REGEXP_SUBSTR(rawtext, ': (.*)', 1, 1, 'e')) AS message,
        TRIM(REGEXP_SUBSTR(rawtext, '\\[(.*?)\\]', 1, 1, 'e')) AS datetime

    FROM MESSAGES
),

PARSE AS (

    SELECT CASE 
           WHEN CHARINDEX(':', SENDER) > 0 THEN TRIM(SUBSTRING(SENDER, 1, CHARINDEX(':', SENDER) - 1))
           ELSE SENDER 
           END AS SENDER,
           MESSAGE,
           DATETIME
    FROM REGEX

)

SELECT *
FROM PARSE
