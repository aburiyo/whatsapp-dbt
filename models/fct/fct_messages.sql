WITH MESSAGES AS(

    SELECT DATE_TIME,
    {{ member_renaming('SENDER')}} AS SENDER,
    MESSAGE
    FROM {{ ref('stg_messages')}}
)

SELECT *
FROM MESSAGES