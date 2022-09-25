view: d_customer {
  label: "Customers"
  view_label: "customers"


  sql_table_name: "DATA_MART"."D_CUSTOMER"
    ;;

  dimension: c_address {
    label: "Address"
    view_label: "Customer"
    tags: ["PII", "GEO"]
    hidden: yes

    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }

  dimension: c_custkey {
    label: "ID"
    view_label: "Customer"
    hidden: yes
    type: number
    primary_key: yes
    tags: ["ID", "INTERNAL"]
    sql: ${TABLE}."C_CUSTKEY" ;;
  }

  dimension: c_mktsegment {
    label: "Marketing Segment"
    view_label: "Customer"

    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }

  dimension: c_name {
    label: "Name"
    view_label: "Customer"
    tags: ["PII"]
    hidden: yes

    type: string
    sql: ${TABLE}."C_NAME" ;;
  }

  dimension: c_nation {
    label: "Nationality"
    view_label: "Customer"
    hidden: no

    type: string
    sql: ${TABLE}."C_NATION" ;;
  }

  dimension: c_phone {
    label: "Phone Number"
    view_label: "Customer"
    tags: ["PII"]
    hidden: yes

    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }

  dimension: c_region {
    label: "Region"
    view_label: "Customer"
    tags: ["GEO"]
    hidden: no

    type: string
    sql: ${TABLE}."C_REGION" ;;
  }

  measure: count {
    label: "Number of Customers"
    view_label: "Customer"

    type: count
    drill_fields: [c_name]
  }
}
