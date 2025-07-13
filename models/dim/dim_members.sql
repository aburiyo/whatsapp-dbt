WITH dim_members AS (
    SELECT 
    DISTINCT groupmember
    FROM {{ ref('stg_members')}}
)

SELECT *
FROM dim_members

