view: pipeline_aggregation {
  sql_table_name: (select * from dev.sales.opportunity) ;;


    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: dates {
      type: date
      sql: ${TABLE}."DATES" ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}."NAME" ;;
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

    dimension: organization {
      type: string
      sql: ${TABLE}."ORGANIZATION" ;;
    }

    dimension: commit_status {
      type: string
      sql: ${TABLE}."COMMIT_STATUS" ;;
    }

    dimension: stage_name {
      type: string
      sql: ${TABLE}."STAGE_NAME" ;;
    }

    dimension: opportunities {
      type: number
      sql: ${TABLE}."OPPORTUNITIES" ;;
    }

    dimension: arr {
      type: number
      sql: ${TABLE}."ARR" ;;
    }

    set: detail {
      fields: [
        dates,
        name,
        manager,
        role,
        region,
        organization,
        commit_status,
        stage_name,
        opportunities,
        arr
      ]
    }
  }
