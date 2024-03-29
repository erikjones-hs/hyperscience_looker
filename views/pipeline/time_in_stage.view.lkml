  view: time_in_stage {
    sql_table_name: (select * from DEV.ERIKJONES.PIPELINE_TIME_IN_STAGE);;
    drill_fields: [detail*]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}."STAGE" ;;
  }

  dimension_group: dte {
    type: time
    sql: ${TABLE}."DTE" ;;
  }

  dimension: time_in_stage {
    type: number
    sql: ${TABLE}."TIME_IN_STAGE" ;;
  }

  dimension: touchpoint_order {
    type: number
    sql: ${TABLE}."TOUCHPOINT_ORDER" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: opp_revenue_type {
    type: string
    sql: ${TABLE}."OPP_REVENUE_TYPE" ;;
  }

  dimension: opp_pipeline_category {
    type: string
    sql: ${TABLE}."OPP_PIPELINE_CATEGORY" ;;
  }

  dimension: opp_stage_name {
    type: string
    sql: ${TABLE}."OPP_STAGE_NAME" ;;
  }

  dimension: stage_custom {
    label: "Stage (custom sort)"
    case: {
      when: {
        sql: ${stage} = 'discovery' ;;
        label: "1. Discovery"
      }
      when: {
        sql: ${stage} = 'vf' ;;
        label: "2. Value/Fit"
      }
      when: {
        sql: ${stage} = 'tdd' ;;
        label: "3. TDD"
      }
      when: {
        sql: ${stage} = 'go_no' ;;
        label: "4. EB Go/No-Go"
      }
      when: {
        sql: ${stage} = 'poc' ;;
        label: "5. POC"
      }
      when: {
        sql: ${stage} = 'eb_review' ;;
        label: "6. EB Review"
      }
      when: {
        sql: ${stage} = 'neg_close' ;;
        label: "7. Negotiate & Close"
      }
      when: {
        sql: ${stage} = 'created' ;;
        label: "8. Created"
      }
    }
    }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${opp_id} ;;
    sql: ${opp_id} ;;
    drill_fields: [detail*]
  }

  measure: min_time_in_stage {
    type: min
    sql: ${time_in_stage} ;;
    label: "Min. Time in Stage"
  }

  measure: max_time_in_stage {
    type: max
    sql: ${time_in_stage};;
    label: "Max. Time in Stage"
  }

  measure: median_time_in_stage {
    type: median
    sql: ${time_in_stage};;
    label: "Median Time in Stage"
  }

  measure: percentile_25_time_in_stage {
    type: percentile
    percentile: 25
    sql: ${time_in_stage};;
    label: "25th Percentile Time in Stage"
  }

  measure: percentile_75_time_in_stage {
    type: percentile
    percentile: 75
    sql: ${time_in_stage};;
    label: "75th Percentile Time in Stage"
  }

  measure: mean_time_in_stage {
    type: average
    sql: ${time_in_stage};;
    label: "Mean Time in Stage"
  }

  set: detail {
    fields: [opp_id, stage, dte_time, time_in_stage, touchpoint_order]
  }
}
