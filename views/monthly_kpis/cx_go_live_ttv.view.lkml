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

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}."PARTNER" ;;
  }

  dimension: fed_sled {
    type: string
    sql: CASE WHEN ${industry} = 'Government & Public Services' AND ${company_id_name} in ('Department of Veterans Affairs','Social Security Administration','Treasury') THEN 'Fed'
          WHEN ${industry} = 'Government & Public Services' AND ${company_id_name} not in ('Department of Veterans Affairs','Social Security Administration','Treasury') THEN 'Sled'
          ELSE 'Private sector' END;;
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

  dimension_group: first_go_live_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."FIRST_GO_LIVE_DATE" ;;
  }

  dimension_group: current_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql:  to_timestamp(to_date(current_date())) ;;
  }

  dimension_group: ttv_days {
    type: duration
    intervals: [day, week, month]
    sql_start: ${TABLE}."KPI_START_DATE" ;;
    sql_end: ${TABLE}."GO_LIVE_DATE";;
    drill_fields: [detail*]
  }

  dimension: ttv_tier {
    type: tier
    tiers: [0, 30, 60, 90, 120, 150, 180]
    style: relational
    sql: ${days_ttv_days} ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }

  dimension: project_status {
    type: string
    sql: ${TABLE}."PROJECT_STATUS" ;;
  }

  dimension_group: kpi_start_date {
    type: time
    timeframes: [date, month, quarter, year]
    sql: ${TABLE}."KPI_START_DATE" ;;
  }

  dimension: initial_implementation {
    type: string
    sql: ${TABLE}."INITIAL_IMPLEMENTATION" ;;
  }

  dimension: fy_year {
    type: date
    sql: ${TABLE}."FY_YEAR" ;;
  }

  dimension: fy_qtr_year {
    type: string
    sql: ${TABLE}."FY_QTR_YEAR" ;;
  }

  dimension: fy_qtr_end_dte {
    type: date
    sql: ${TABLE}."FY_QTR_END_DTE" ;;
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
    value_format: "0.##"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      name,
      company_id_name,
      current_contracted_volume,
      industry,
      partner,
      region,
      time_to_value,
      days_ttv_days,
      ttv_tier,
      fy_qtr_end_dte,
      go_live_date_date,
      first_go_live_date_date
    ]
  }
}
