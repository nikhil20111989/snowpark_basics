{% macro function1(x) %}

CASE when to_timestamp({{x}}) < current_date then 'PAST'
else 'FUTURE' END 

{% endmacro %}

{% macro get_season(x) %}

case when month(to_timestamp({{x}})) in (12,1,2)
then 'WINTER'
when month(to_timestamp({{x}})) in (3,4,5)
then 'SPRING'
when month(to_timestamp({{x}})) in (6,7,8)
then 'SUMMER'
else 'AUTOMN'
end 

{% endmacro %}



{% macro day_type(x) %}
case
when dayname(to_timestamp({{x}})) in ('Sat','Sun')
then 'WEEKEND'
else 'BUSINESS-DAY' 
end 
{% endmacro %}