view: pipeline_summary {
  derived_table: {
    sql: Select
      fiscal_quarter,
      region,
      sum(arr) as arr
      from sales.pipeline_tracking
      Where fiscal_quarter >= '2021-09-01'
        and day = current_date()
      group by 1,2
      order by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  set: detail {
    fields: [fiscal_quarter, region, arr]
  }
}
