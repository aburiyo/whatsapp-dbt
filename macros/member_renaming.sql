{% macro member_renaming(col_name) %}
    CASE 
        WHEN {{ col_name }} = 'danielson' THEN 'Danny'
        WHEN {{ col_name }} = '+234 803 830 4509' THEN 'Ope'
        WHEN {{ col_name }} = 'Seyi Adu' THEN 'Seyi'
        WHEN {{ col_name }} = 'Azu O' THEN 'Azu'
        WHEN {{ col_name }} = 'Adebolu' THEN 'David'
        WHEN {{ col_name }} = 'BigFoot' THEN 'Victor'
        WHEN {{ col_name }} = 'OJ 4real' THEN 'OJ'
        WHEN {{ col_name }} = 'Shine William' THEN 'Shine'
        ELSE {{ col_name }}
    END
{% endmacro %}
