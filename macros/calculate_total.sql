{% macro calculate_total(amount) %}
    CASE 
        WHEN {{ amount }} = 0 THEN NULL 
        ELSE {{ amount }}
    END
{% endmacro %}
