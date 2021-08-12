view: fct_pages_expansion {
  sql_table_name: (select * from dev.cx.customer_data_fct_pages_expansion);;
  drill_fields: [detail*]

  parameter: time_period {
    type: unquoted

    allowed_value: {
      value: "QTD"
    }

    allowed_value: {
      value: "YTD"
    }

  }

  dimension: to_day {
    label: "{% parameter time_period %}"
    type: yesno
    hidden: yes
    sql:
    {% if time_period._parameter_value == 'QTD' %}

    ${dte_date} > TO_DATE(DATE_TRUNC('quarter', CURRENT_DATE()))

    AND

    ${dte_date} < (TO_DATE(DATEADD('month', 3, CAST(DATE_TRUNC('quarter', CAST(DATE_TRUNC('quarter', CURRENT_DATE()) AS DATE)) AS DATE))))

    {% elsif time_period._parameter_value == 'YTD' %}

    ${dte_date} > TO_DATE(DATE_TRUNC('year', CURRENT_DATE()))

    AND

    ${dte_date} < TO_DATE(DATEADD('year', 1, DATE_TRUNC('year', CURRENT_DATE())))

    {% else %}

    1=1

    {% endif %};;

    }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: first_full_month {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."FIRST_FULL_MONTH" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [date, month, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num]
    sql: ${TABLE}."DTE" ;;
  }

  dimension: total_pages_created {
    type: number
    sql: ${TABLE}."TOTAL_PAGES_CREATED" ;;
  }

  dimension_group: num_months_since {
    type: duration
    sql_start: ${first_full_month_date} ;;
    sql_end: ${dte_date} ;;

  }

  measure: sum_pages {
    type: sum
    sql:  ${total_pages_created} ;;
  }

  set: detail {
    fields: []
  }
}
