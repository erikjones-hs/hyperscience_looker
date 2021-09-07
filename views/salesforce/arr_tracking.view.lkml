view: arr_tracking {
  sql_table_name: (select * from dev.sales.ARR_TRACKING) ;;

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: week {
      type: date
      sql: ${TABLE}."WEEK" ;;
    }

    dimension: ae {
      type: string
      sql: ${TABLE}."AE" ;;
    }

    dimension: manager {
      type: string
      sql: ${TABLE}."MANAGER" ;;
    }

    dimension: role {
      type: string
      sql: ${TABLE}."ROLE" ;;
    }

    dimension: region {
      type: string
      sql: ${TABLE}."REGION" ;;
    }

    dimension: lead_source {
      type: string
      sql: ${TABLE}."LEAD_SOURCE" ;;
    }

    dimension: revenue_type {
      type: string
      sql: ${TABLE}."REVENUE_TYPE" ;;
    }

    dimension: opportunity_id {
      type: string
      sql: ${TABLE}."OPPORTUNITY_ID" ;;
    }

    measure: arr {
      type: number
      sql: ${TABLE}."ARR" ;;
      value_format_name:usd
    }

    set: detail {
      fields: [
        week,
        ae,
        manager,
        role,
        region,
        lead_source,
        revenue_type,
        opportunity_id,
        arr
      ]
    }
}
