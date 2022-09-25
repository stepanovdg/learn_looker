view: d_dates {
  label: "Dates"
  #view_label: "Calendar"

  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    label: "Period"
    # view_label: "Calendar"
    tags: ["ENUM"]

    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: datekey {
    label: "ID"
    # view_label: "Calendar"
    tags: ["ID", "INTERNAL"]
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension: day_of_week {
    label: "Day of the Week (Number)"
    # view_label: "Calendar"
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "Day of the Week"
    # view_label: "Calendar"
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    label: "Month"
    # view_label: "Calendar"

    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
  }

  dimension: month_num {

    label: "Month (Number)"
    # view_label: "Calendar"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "Quarter"
    # view_label: "Calendar"
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {

    label: "Year"
    # view_label: "Calendar"
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {

    label: "Total Dates"
    # view_label: "Calendar"
    type: count
    drill_fields: [month_name]
  }
}
