view: d_supplier {
  label: "Supplier"
  view_label: "Supplier"

  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    label: "Account Balance"
    # view_label: "Supplier"
    value_format_name: price
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    label: "Address"
    # view_label: "Supplier"
    tags: [ "GEO", "PII"]
    hidden: yes
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    label: "Name"
    # view_label: "Supplier"
    hidden: yes
    tags: ["PII"]
    type: string
    sql: ${TABLE}."S_NAME" ;;
  }

  dimension: s_nation {
    label: "Nationality"
    # view_label: "Supplier"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {

    label: "Phone Number"
    # view_label: "Supplier"
    hidden: yes
    tags: ["PII", "PHONE"]
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {

    label: "Region"
    # view_label: "Supplier"
    tags: [ "GEO"]
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {

    label: "ID"
    # view_label: "Supplier"
    hidden:  yes
    tags: ["ID", "INTERNAL"]
    primary_key: yes
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }

  measure: count {
    label: "Number of Suppliers"
    # view_label: "Supplier"

    type: count
    drill_fields: [s_name]
  }
}
