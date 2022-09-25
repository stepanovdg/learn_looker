view: f_lineitems {

  label: "Order"
  view_label: "Order"

  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    label: "Available Quantity"
    view_label: "Order"

    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    label: "Clerk Information"
    view_label: "Order"

    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey
  {
    label: "Commit Date ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes

    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }

  dimension: l_custkey {

    label: "Customer ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes

    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }

  dimension: l_discount {
    # I assume from looking on values discount field is percent
    label: "Discount rate"
    view_label: "Order"
    value_format_name: percent
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    label: "Extended Price"
    view_label: "Order"
    value_format_name: price

    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    label: "Line Number"
    view_label: "Order"

    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    label: "Order Date ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes

    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }

  dimension: l_orderkey {

    label: "Order ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes

    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    label: "Priority"
    view_label: "Order"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    label: "Status"
    view_label: "Order"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {

    label: "Part ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    label: "Quantity"
    view_label: "Order"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {

    label: "Receipt Date ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    label: "Return Flag"
    view_label: "Order"
    description: "Shows is order was returned"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {

    label: "Shipped Date ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes

    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    label: "Shipping Instructions"
    view_label: "Order"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    label: "Shipping Mode"
    view_label: "Order"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    label: "Shipping Priority"
    view_label: "Order"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {

    label: "Supplier ID"
    view_label: "Order"
    tags: ["ID", "INTERNAL"]
    hidden: yes
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    label: "Supply Cost"
    view_label: "Order"
    value_format_name: price

    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    # I assume from looking on values tax field is percent
    value_format_name: percent

    label: "Tax"
    view_label: "Order"
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    value_format_name: price

    label: "Total Price"
    view_label: "Order"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

  measure: count {
    label: "Total Orders Number"
    view_label: "Order"
    type: count
    drill_fields: []
  }
}
