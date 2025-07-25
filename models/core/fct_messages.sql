WITH MESSAGES AS(

    SELECT DATE_TIME,
    {{ member_renaming('SENDER')}} AS SENDER,
    MESSAGE,
    REGEXP_COUNT(MESSAGE, '\\b\\w+\\b') AS WORD_COUNT
    FROM {{ ref('int_messages')}}
)

SELECT *
FROM MESSAGES M
LEFT JOIN {{ ref('member_cities')}} C
ON M.SENDER = C.MEMBER