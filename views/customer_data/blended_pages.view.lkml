  view: blended_pages {
    sql_table_name: (select * from dev.erikjones.blended_pages);;


  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: dte {
    type: time
    timeframes: [date, month, week, quarter, year, fiscal_year, fiscal_quarter, fiscal_month_num, fiscal_quarter_of_year]
    sql: ${TABLE}."DTE" ;;
  }

  measure: num_pages_with_fields_completed {
    type: sum
    sql: ${TABLE}."NUM_PAGES_WITH_FIELDS_COMPLETED" ;;
    label: "# Pages w/ Fields Completed"
  }

  measure: num_matched_semi_structured_pages {
    type: sum
    sql: ${TABLE}."NUM_MATCHED_SEMI_STRUCTURED_PAGES" ;;
    label: "# Matched Semi-Structured Pages"
  }

  measure: num_matched_structured_pages {
    type: sum
    sql: ${TABLE}."NUM_MATCHED_STRUCTURED_PAGES" ;;
    label: "# Matched Structured Pages"
  }

  measure: num_pages_created {
    type: sum
    sql: ${TABLE}."NUM_PAGES_CREATED" ;;
    label: "# Pages Created"
  }

  measure: blended_pages {
    type: sum
    sql: ${TABLE}."BLENDED_PAGES" ;;
    label: "# Blended Pages"
  }

  set: detail {
    fields: [
      customer,
      dte_date,
      num_pages_with_fields_completed,
      num_matched_semi_structured_pages,
      num_matched_structured_pages,
      num_pages_created,
      blended_pages
    ]
  }
}
