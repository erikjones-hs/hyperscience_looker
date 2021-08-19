view: opportunity_daily_snapshots {
  derived_table: {
    sql: select id
        , stage_name
        , commit_status_c
        , amount
        , is_closed
        , min(_fivetran_start::date) as valid_from
        , max(_fivetran_end::date)  as valid_to
        from opportunity
        where
          1=1
        group by 1,2,3,4,5 ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    description: "Concatenated columns to form unique id"
    type: string
    sql: concat(${TABLE}.id, ${TABLE}.valid_from, ${TABLE}.valid_to) ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: stage_name {
    type: string
  }

  dimension: commit_status {
    type: string
    sql: ${TABLE}.commit_status_c ;;
  }

  dimension: is_closed {
    type: yesno
  }

  dimension: valid_from {
    type: date
  }

  dimension: valid_to {
    type: date
  }

  measure: count {
    type: count
  }

  measure: total_arr {
    description: "ARR"
    type: sum
    sql: ${TABLE}.amount ;;
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }
}
