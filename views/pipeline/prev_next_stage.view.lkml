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

  dimension: stage_custom_sort {
    label: "Stage (custom sort)"
    case: {
      when: {
        sql: ${opp_stage_name} = 'AE Discovery' ;;
        label: "1. Discovery"
      }
      when: {
        sql: ${opp_stage_name} = 'Value/Fit' ;;
        label: "2. Value/Fit"
      }
      when: {
        sql: ${opp_stage_name} = 'TDD' ;;
        label: "3. TDD"
      }
      when: {
        sql: ${opp_stage_name} = 'EB Go/No-Go' ;;
        label: "4. EB Go/No-Go"
      }
      when: {
        sql: ${opp_stage_name} = 'TVE' ;;
        label: "5. POC"
      }
      when: {
        sql: ${opp_stage_name} = 'EB Revisit' ;;
        label: "6. EB Review"
      }
      when: {
        sql: ${opp_stage_name} = 'Negotiate and Close' ;;
        label: "7. Negotiate & Close"
      }
    }
  }

  dimension_group: current_date {
    type: time
    timeframes: [raw, date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql:  to_timestamp(date_trunc(month,to_date(current_date()))) ;;
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

  measure: percent_same_stage {
    type:  number
    sql: 100 * ${num_opps_same_stage} / ${num_opps} ;;
    value_format: "#0\%"
    label: "% Opportunities Same Stage"
  }

  measure: percent_dq {
    type:  number
    sql: 100 * ${num_opps_dq} / ${num_opps} ;;
    value_format: "#0\%"
    label: "% Opportunities DQed"
  }

  measure: percent_moved_stages {
    type:  number
    sql: 100 * ${num_opps_moved_stage} / ${num_opps} ;;
    value_format: "#0\%"
    label: "% Opportunities Moved Stages"
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
