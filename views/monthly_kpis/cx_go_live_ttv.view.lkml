view: cx_go_live_ttv {
  sql_table_name: (select * from dev.erikjones.monthly_kpis_cx_live_ttv);;
  drill_fields: [detail*]


  dimension: gsid {
    type: string
    sql: ${TABLE}."GSID" ;;
  }

  dimension: current_opportunity_id {
    type: string
    sql: ${TABLE}."CURRENT_OPPORTUNITY_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: company_id_name {
    type: string
    sql: ${TABLE}."COMPANY_ID_NAME" ;;
  }

  dimension: current_contracted_volume {
    type: number
    sql: ${TABLE}."CURRENT_CONTRACTED_VOLUME" ;;
  }

  dimension: current_contract_start_date {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_START_DATE" ;;
  }

  dimension: current_contract_end_date {
    type: date
    sql: ${TABLE}."CURRENT_CONTRACT_END_DATE" ;;
  }

  dimension: time_to_value {
    type: number
    sql: ${TABLE}."TIME_TO_VALUE" ;;
  }

  dimension_group: go_live_goal {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."GO_LIVE_GOAL" ;;
  }

  dimension_group: go_live_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."GO_LIVE_DATE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(to_date(current_date())) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_customers {
    type: count_distinct
    sql:${company_id_name} ;;
    drill_fields: [detail*]
  }

  measure: cumulative_live_customers {
    type:  running_total
    sql:  ${num_customers} ;;
    drill_fields: [detail*]
  }

  measure: avg_time_to_value {
    type: average
    sql:${time_to_value} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      gsid,
      current_opportunity_id,
      name,
      company_id_name,
      current_contracted_volume,
      current_contract_start_date,
      current_contract_end_date,
      time_to_value,
      go_live_goal_date,
      go_live_date_date
    ]
  }
}
