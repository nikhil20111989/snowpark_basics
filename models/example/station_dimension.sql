with bike as(
    select 
    start_station_id,
    start_station_name,
    start_lat,
    start_lng
    from {{ source('demo', 'bike') }}
    where ride_id !='ride_id'
 
)

select * from bike