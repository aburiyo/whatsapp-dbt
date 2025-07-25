WITH dates AS (
    SELECT *
    FROM {{ source('whatsapp', 'rawtext')}}
)

SELECT 
TRIM(REGEXP_SUBSTR(rawtext, '\\[(.*?)\\]', 1, 1, 'e')) AS datetime

FROM dates 
