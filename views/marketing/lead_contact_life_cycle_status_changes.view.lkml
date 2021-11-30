view: lead_contact_life_cycle_status_changes {
  sql_table_name: "MARKETING"."LEAD_CONTACT_LIFE_CYCLE_STATUS_CHANGES"
    ;;

  dimension: contact_id {
    type: string
    sql: ${TABLE}."CONTACT_ID" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}."LEAD_ID" ;;
  }

  dimension: person_id {
    type: string
    sql: ${TABLE}."PERSON_ID" ;;
  }

  dimension: status_change {
    type: string
    sql: ${TABLE}."STATUS_CHANGE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  filter: date_filter {

    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"

    type: date

  }

  dimension_group: filter_start_date {

    type: time

    timeframes: [raw]

    sql: CASE WHEN {% date_start date_filter %} IS NULL THEN '1970-01-01' ELSE NULLIF({% date_start date_filter %}, 0)::timestamp END;;

# MySQL: CASE WHEN {% date_start date_filter %} IS NULL THEN '1970-01-01' ELSE  TIMESTAMP(NULLIF({% date_start date_filter %}, 0)) END;;

  }

  dimension_group: filter_end_date {

    type: time

    timeframes: [raw]

    sql: CASE WHEN {% date_end date_filter %} IS NULL THEN CURRENT_DATE ELSE NULLIF({% date_end date_filter %}, 0)::timestamp END;;

# MySQL: CASE WHEN {% date_end date_filter %} IS NULL THEN NOW() ELSE TIMESTAMP(NULLIF({% date_end date_filter %}, 0)) END;;

  }

}
