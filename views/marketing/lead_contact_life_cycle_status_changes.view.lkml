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
    timeframes: [raw,date]
    sql: CASE WHEN {% date_start date_filter %} IS NULL THEN '1970-01-01' ELSE CAST({% date_start date_filter %} AS DATE) END;;

  }

  dimension_group: filter_end_date {

    type: time
    timeframes: [raw,date]
    sql: CASE WHEN {% date_end date_filter %} IS NULL THEN CURRENT_DATE ELSE CAST({% date_end date_filter %} AS DATE) END;;

  }

  dimension: interval {

    type: number
    sql: DATE_DIFF(${filter_start_date_raw}, ${filter_end_date_raw}, DAY);;

  }

  dimension: previous_start_date {

    type: string
    sql: DATE_ADD(${filter_start_date_raw}, INTERVAL ${interval} DAY) ;;

  }

  dimension: is_current_period {

    type: yesno
    sql: ${date_raw} >= ${filter_start_date_date} AND ${date_raw} < ${filter_end_date_date} ;;

  }

  dimension: is_previous_period {

    type: yesno
    sql: ${date_raw} >= ${previous_start_date} AND ${date_raw} < ${filter_start_date_date} ;;

  }

  dimension: timeframes {

    description: "Use this field in combination with the date filter field for dynamic date filtering"
    suggestions: ["period","previous period"]

    type: string

    case:  {

      when:  {

        sql: ${is_current_period} = true;;
        label: "Selected Period"

      }

      when: {

        sql: ${is_previous_period} = true;;
        label: "Previous Period"

      }

      else: "Not in time period"

    }

  }

}
