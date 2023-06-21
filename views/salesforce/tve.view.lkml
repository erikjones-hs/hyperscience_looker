view: tve {
    sql_table_name: (select * from dev.erikjones.tves);;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}."STAGE_NAME" ;;
  }

  dimension: tve_c {
    type: yesno
    sql: ${TABLE}."TVE_C" ;;
  }

  dimension: tve_approved_date_c {
    type: date
    sql: ${TABLE}."TVE_APPROVED_DATE_C" ;;
  }

  dimension: tve_eb_meeting_date_c {
    type: date
    sql: ${TABLE}."TVE_EB_MEETING_DATE_C" ;;
  }

  dimension: tve_eb_playback_date_c {
    type: date
    sql: ${TABLE}."TVE_EB_PLAYBACK_DATE_C" ;;
  }

  dimension: pre_closed_lost_stage_c {
    type: string
    sql: ${TABLE}."PRE_CLOSED_LOST_STAGE_C" ;;
  }

  dimension: closed_won_fl {
    type: number
    sql: ${TABLE}."CLOSED_WON_FL" ;;
  }

  dimension: closed_lost_fl {
    type: number
    sql: ${TABLE}."CLOSED_LOST_FL" ;;
  }

  dimension: tve_fl {
    type: number
    sql: ${TABLE}."TVE_FL" ;;
  }

  dimension_group: tve_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."TVE_DATE" ;;
  }

  measure: num_opps {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql:  ${id} ;;
    label: "# Opps"
  }

  measure: opp_arr {
    type: sum
    sql: ${TABLE}."OPP_ARR" ;;
    label: "ARR"
  }

  measure: opp_net_new_arr {
    type: sum
    sql: ${TABLE}."OPP_NET_NEW_ARR" ;;
    label: "Net New ARR"
    value_format: "$#,##0"
  }

  measure: num_closed_won {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql:  ${id} ;;
    filters: [closed_won_fl: "1"]
    label: "# CW Opps"
  }

  measure: num_closed_lost {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql:  ${id} ;;
    filters: [closed_lost_fl: "1"]
    label: "# CL Opps"
}

measure: perc_cw {
  type: number
  sql: num_closed_won / NULLIFZERO(${num_opps} ;;
  label: "% Closed Won"
}

  measure: perc_cl {
    type: number
    sql: num_closed_lost / NULLIFZERO(${num_opps} ;;
    label: "% Closed Lost"
  }


  set: detail {
    fields: [
      id,
      name,
      account_id,
      stage_name,
      tve_c,
      tve_approved_date_c,
      tve_eb_meeting_date_c,
      tve_eb_playback_date_c,
      pre_closed_lost_stage_c,
      closed_won_fl,
      closed_lost_fl,
      tve_fl,
      tve_date_date
    ]
  }
}
