WITH MATCHES AS (
    SELECT sender
    FROM {{ ref('fct_messages')}}
    WHERE sender IN (SELECT DISTINCT member FROM {{ ref("dim_members")}})
)

SELECT DISTINCT * FROM MATCHES