view: d_part {
  label: "Parts"
  view_label: "Inventory"

  sql_table_name: "DATA_MART"."D_PART"
    ;;

  dimension: p_brand {
    label: "Brand"
    view_label: "Inventory"

    type: string
    sql: ${TABLE}."P_BRAND" ;;
  }

  dimension: p_mfgr {
    label: "Manufacter"
    view_label: "Inventory"

    type: string
    sql: ${TABLE}."P_MFGR" ;;
  }

  dimension: p_name {

    label: "Part Name"
    view_label: "Inventory"

    type: string
    sql: ${TABLE}."P_NAME" ;;
  }

  dimension: p_partkey {

    label: "Brand"
    view_label: "Inventory"
    tags: ["ID", "INTERNAL"]
    hidden: yes

    type: number
    sql: ${TABLE}."P_PARTKEY" ;;
  }

  dimension: p_size {

    label: "Size"
    view_label: "Inventory"

    type: number
    sql: ${TABLE}."P_SIZE" ;;
  }

  dimension: p_type {

    label: "Type"
    view_label: "Inventory"

    type: string
    sql: ${TABLE}."P_TYPE" ;;
  }

  measure: count {

    label: "Total Parts Number"
    view_label: "Inventory"

    type: count
    drill_fields: [p_name]
  }
}
