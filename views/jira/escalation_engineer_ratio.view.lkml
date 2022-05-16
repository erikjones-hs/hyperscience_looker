
view: escalation_engineer_ratio {
  sql_table_name: (select * from dev.erikjones.jira_escalation_engineer_ratio);;


  dimension_group: dte {
    type: time
    timeframes: [raw, date, week, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: num_escalation_tickets {
    type: number
    sql: ${TABLE}."NUM_ESCALATION_TICKETS" ;;
  }

  dimension: num_engineers {
    type: number
    sql: ${TABLE}."NUM_ENGINEERS" ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Week"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN ${dte_date}
    WHEN {% parameter timeframe_picker %} = 'Week' THEN ${dte_week}
    WHEN{% parameter timeframe_picker %} = 'Month' THEN ${dte_month}
    END ;;
  }

  measure: num_tickets {
    type: sum
    sql: ${num_escalation_tickets} ;;
  }

  measure: avg_engineers {
    type: average
    sql: ${num_engineers} ;;
  }

  measure: escalation_to_engineers {
    type: number
    sql: ${num_tickets} / ${avg_engineers} ;;
  label: "Escalation / Engineer Ratio"
  }


}
