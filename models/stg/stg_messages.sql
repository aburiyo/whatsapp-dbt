WITH messages AS (
    SELECT *
    FROM {{ source('whatsapp', 'rawtext')}}
)

SELECT 
TRIM(REGEXP_SUBSTR(rawtext, '\\] (.*?):', 1, 1, 'e', 1)) AS sender,
TRIM(REGEXP_SUBSTR(rawtext, ': (.*)', 1, 1, 'e')) AS message,
TRIM(REGEXP_SUBSTR(rawtext, '\\[(.*?)\\]', 1, 1, 'e')) AS datetime

FROM messages 