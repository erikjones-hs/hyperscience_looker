  view: balance_sheet {
    sql_table_name: (select * from dev.erikjones.pipeline_balance_sheet);;
    drill_fields: [detail*]

  dimension: dte_month {
    type: date
    sql: ${TABLE}."DTE_MONTH" ;;
  }

  dimension: beginning_opps {
    type: number
    sql: ${TABLE}."BEGINNING_OPPS" ;;
  }

  dimension: new_opps {
    type: number
    sql: ${TABLE}."NEW_OPPS" ;;
  }

  dimension: closed_opps {
    type: number
    sql: ${TABLE}."CLOSED_OPPS" ;;
  }

  dimension: dq_opps {
    type: number
    sql: ${TABLE}."DQ_OPPS" ;;
  }

  dimension: tot_dq_opps {
    type: number
    sql: ${TABLE}."TOT_DQ_OPPS" ;;
  }

  dimension: pipeline_opps {
    type: number
    sql: ${TABLE}."PIPELINE_OPPS" ;;
  }

  dimension: ending_opps_int {
    type: number
    sql: ${TABLE}."ENDING_OPPS_INT" ;;
  }

  dimension: deleted_opps {
    type: number
    sql: ${TABLE}."DELETED_OPPS" ;;
  }

  dimension: ending_opps {
    type: number
    sql: ${TABLE}."ENDING_OPPS" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: opps_beginning {
    type:  sum
    sql: ${beginning_opps} ;;
    label: "Beginning Opportunities"
  }

  measure: opps_new {
    type:  sum
    sql: ${new_opps} ;;
    label: "New Opportunities"
  }

  measure: opps_dq {
    type:  sum
    sql: ${tot_dq_opps}_opps} ;;
    label: "DQed Opportunities"
  }

  measure: opps_closed {
    type:  sum
    sql: ${closed_opps};;
    label: "Closed Won Opportunities"
  }

  measure: opps_ending {
    type:  sum
    sql: ${ending_opps_int};;
    label: "Ending Opportunities"
  }

  set: detail {
    fields: [
      dte_month,
      beginning_opps,
      new_opps,
      closed_opps,
      dq_opps,
      tot_dq_opps,
      pipeline_opps,
      ending_opps_int,
      deleted_opps,
      ending_opps
    ]
  }
}
