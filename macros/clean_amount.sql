{% macro clean_amount(amount) %}
    CASE 
        WHEN {{ amount }} IS NULL OR {{ amount }} <= 0 THEN NULL 
        ELSE {{ amount }}
    END
{% endmacro %}
