view: prev_next_stage {
  sql_table_name: (select * from DEV.ERIKJONES.PIPELINE_PREV_NEXT_STAGE);;
  drill_fields: [detail*]

  dimension_group: date_ran {
    type: time
    sql: ${TABLE}."DATE_RAN" ;;
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: next_month_stage_name {
    type: string
    sql: ${TABLE}."NEXT_MONTH_STAGE_NAME" ;;
  }

  dimension: same_stage_flag {
    type: number
    sql: CASE WHEN ${opp_stage_name} = ${next_month_stage_name} then 1 else 0 end ;;
  }

  dimension: dq_flag {
    type: number
    sql: CASE WHEN ${next_month_stage_name} = 'Opp DQed' then 1 else 0 end ;;
  }

  dimension: stage_moved_flag {
    type: number
    sql: CASE WHEN ${opp_stage_name} != ${next_month_stage_name} AND ${next_month_stage_name} not in ('Opp DQed') then 1 else 0 end ;;
 }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    label: "# Opportunities"
  }

  measure: num_opps_same_stage {
    type: sum
    sql: ${same_stage_flag} ;;
    label: "# Opportunities Same Stage"
  }

  measure: num_opps_dq {
    type: sum
    sql: ${dq_flag} ;;
    label: "# Opportunities DQed"
  }

  measure: num_opps_moved_stage {
    type: sum
    sql: ${stage_moved_flag} ;;
    label: "# Opportunities Moved Stages"
  }

  set: detail {
    fields: [
      date_ran_time,
      opp_id,
      opp_name,
      account_name,
      opp_revenue_type,
      opp_stage_name,
      next_month_stage_name
    ]
  }
}
