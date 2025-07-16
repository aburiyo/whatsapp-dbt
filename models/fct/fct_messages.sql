WITH MESSAGES AS(

    SELECT DATE_TIME,
    {{ member_renaming('SENDER')}} AS SENDER,
    MESSAGE,
    REGEXP_COUNT(MESSAGE, '\\b\\w+\\b') AS WORD_COUNT
    FROM {{ ref('stg_messages')}}
)

SELECT *
FROM MESSAGES