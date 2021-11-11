  view: pipeline_tracking {
    derived_table: {
      sql: Select
              *
              from sales.pipeline_tracking
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: day {
      type: date
      sql: ${TABLE}."DAY" ;;
    }

    dimension: region {
      type: string
      sql: ${TABLE}."REGION" ;;
    }

    dimension: manager {
      type: string
      sql: ${TABLE}."MANAGER" ;;
    }

    dimension: rep {
      type: string
      sql: ${TABLE}."REP" ;;
    }

    dimension: fy_qtr_year {
      type: string
      sql: ${TABLE}."FY_QTR_YEAR" ;;
    }

    dimension: stage_name {
      type: string
      sql: ${TABLE}."STAGE_NAME" ;;
    }

    dimension: commit_status {
      type: string
      sql: ${TABLE}."COMMIT_STATUS" ;;
    }

    measure: arr {
      type: number
      sql: ${TABLE}."ARR" ;;
    }

    measure: opps {
      type: number
      sql: ${TABLE}."OPPS" ;;
    }

    measure: avg_opp_age {
      type: number
      sql: ${TABLE}."AVG_OPP_AGE" ;;
    }

    measure: stagnant {
      type: number
      sql: ${TABLE}."STAGNANT" ;;
    }

    measure: stagnant_arr {
      type: number
      sql: ${TABLE}."STAGNANT_ARR" ;;
    }

    measure: stagnant_arr_avg_age {
      type: number
      sql: ${TABLE}."STAGNANT_ARR_AVG_AGE" ;;
    }

    set: detail {
      fields: [
        day,
        region,
        manager,
        rep,
        fy_qtr_year,
        stage_name,
        commit_status,
        arr,
        opps,
        avg_opp_age,
        stagnant,
        stagnant_arr,
        stagnant_arr_avg_age
      ]
    }
  }
