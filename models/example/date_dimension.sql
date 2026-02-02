WITH CTE AS (
SELECT 
to_timestamp(STARTED_AT) as STARTED_AT,
date(to_timestamp(STARTED_AT)) as Date_started_at,
hour(to_timestamp(STARTED_AT)) as hour_started_at,
--dayofweek(to_timestamp(STARTED_AT)) as week_day,
--dayname(to_timestamp(STARTED_AT)) as week_day_name,

CASE
WHEN dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESS-DAY' 
END as day_type,

{{day_type('STARTED_AT')}},

{{get_season('STARTED_AT')}},

{{function1('STARTED_AT')}}

FROM {{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)
SELECT * FROM CTE
