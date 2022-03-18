
  view: from_to {
    sql_table_name: (select * from dev.erikjones.sales_stage_from_to);;
    drill_fields: [detail*]

  dimension: opp_id {
    type: string
    sql: ${TABLE}."OPP_ID" ;;
  }

  dimension: opp_name {
    type: string
    sql: ${TABLE}."OPP_NAME" ;;
  }

  dimension: sep_from_arr {
    type: number
    sql: ${TABLE}."SEP_FROM_ARR" ;;
  }

  dimension: sep_from_net_new_arr {
    type: number
    sql: ${TABLE}."SEP_FROM_NET_NEW_ARR" ;;
  }

  dimension: sep_from_stage {
    type: string
    sql: ${TABLE}."SEP_FROM_STAGE" ;;
  }

  dimension: dec_to_arr {
    type: number
    sql: ${TABLE}."DEC_TO_ARR" ;;
  }

  dimension: dec_to_net_new_arr {
    type: number
    sql: ${TABLE}."DEC_TO_NET_NEW_ARR" ;;
  }

  dimension: dec_to_stage {
    type: string
    sql: ${TABLE}."DEC_TO_STAGE" ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: opp_id ;;
    sql: ${opp_id} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      opp_id,
      opp_name,
      sep_from_arr,
      sep_from_net_new_arr,
      sep_from_stage,
      dec_to_arr,
      dec_to_net_new_arr,
      dec_to_stage
    ]
  }
}
