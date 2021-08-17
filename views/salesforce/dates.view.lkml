view: dates {
  derived_table: {
    sql: with recursive dates as
                (
                  select (current_date - interval '10 year')::date as "date"
                  union all
                  select "date" + 1
                  from dates
                  where "date" <= (current_date + interval '10 year')::date
                )
              select * from dates ;;
  }
  parameter: select_time_bucket {
    type: string
    default_value: "day"
    allowed_value: { label: "Day" value: "day" }
    allowed_value: { label: "Week" value: "week" }
    allowed_value: { label: "Month" value: "month" }
    allowed_value: { label: "Quarter" value: "quarter" }
    allowed_value: { label: "Year" value: "year" }
  }
  dimension: dynamic_bucket_date {
    type: string
    label_from_parameter: select_time_bucket
    sql:
      {% case  select_time_bucket._parameter_value %}
        {% when "'day'" %}
          ${bucket_date}
        {% when "'week'" %}
          ${bucket_week}
        {% when "'month'" %}
          ${bucket_month}
        {% when "'quarter'" %}
          ${bucket_quarter}
         {% when "'year'" %}
          ${bucket_year}
        {% else %}
         null
      {% endcase %} ;;
  }
  dimension_group: bucket {
    type: time
    label: "Bucket Date Filter"
    hidden: no
    timeframes: [date,raw,month,week,year,quarter]
    sql: ${TABLE}.date ;;
  }
}
