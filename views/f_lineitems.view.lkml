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
    primary_key: yes
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
    drill_fields: [d_supplier.s_region, d_supplier.s_supp_cohort]
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
    sql: ${l_orderkey} ;;
    type: count_distinct
    drill_fields: []
  }

  measure: total_sales_price {
    label: "Total Sales Price"
    description: "Total Sales Value"
    view_label: "Order"
    type: sum
    # assume extended price is with tax and etc.
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_extendedprice} ;;
    value_format_name: price
  }

  measure: avg_sales_price {
    label: "Average Sales Price"
    view_label: "Order"
    description: "Average Sales Value"
    type: average
    # assume extended price is with tax and etc and ,ultipled by amount.
    # sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_extendedprice} ;;
    value_format_name: price
  }

  measure: cumulative_sales_price {
    label: "Cumulative Sales Price"
    view_label: "Order"
    description: "Cumulative Sales Value"
    type: running_total
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${total_sales_price} ;;
    value_format_name: price
  }

  measure: total_sales_price_shipped_by_air {
    label: "Total Sales Price Shipped By Air"
    view_label: "Order"
    description: "Total Sales Price filtered by using shipping method air"
    type: sum
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_extendedprice} ;;
    filters: [l_shipmode: "AIR, REG AIR"]
    value_format_name: price
  }

  measure: total_sales_price_customer_russia {
    label: "Total Sales Price Customer From Russia"
    view_label: "Order"
    description: "Total Sales Price filtered by customer located in Russia"
    type: sum
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_extendedprice} ;;
    filters: [ d_customer.c_nation: "RUSSIA"]
    value_format_name: price
  }

  measure: total_gross_revenue {
    label: "Total Gross Revenue"
    view_label: "Order"
    description: "Total price of completed sales"
    type: sum
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_extendedprice} ;;
    filters: [ l_orderstatus: "F"]
    value_format_name: price
  }

  measure: total_cost {
    label: "Total Cost"
    view_label: "Order"
    description: "Total cost completed sales"
    type: sum
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_supplycost} ;;
    value_format_name: price
  }

  measure: total_gross_margin {
    label: "Total Gross Margin"
    view_label: "Order"
    description: "Total gross margin as Total Gross Revenue – Total Cost"
    type: number
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${total_gross_revenue} - ${total_cost};;
    value_format_name: price
  }

  measure: total_gross_margin_percentage {
    label: "Total Gross Margin Percentage"
    view_label: "Order"
    description: "Total gross margin percentage as Total Gross Margin /Total Gross Revenue"
    type: number
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${total_gross_margin} / nullif(${total_gross_revenue},0);;
    value_format_name: percent
  }

  measure: gross_margin_percentage_of_total {
    label: "Gross Margin Percentage"
    view_label: "Order"
    description: "Gross margin percentage as Gross Margin /Total Gross Margin"
    type: number
    sql_distinct_key: ${l_orderkey} ;;
    sql: (${l_extendedprice} -${l_supplycost}) / ${total_gross_margin};;
    value_format_name: percent
  }

  measure: total_returned_items{
    label: "Number of Items Returned"
    view_label: "Order"
    description: "Sum of items in of orders with returned status"
    type: sum
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_quantity};;
    filters: [l_returnflag: "R"]
  }

  measure: total_sold_items{
    label: "Number of Items Sold"
    view_label: "Order"
    description: "Sum of items in of orders with sold status"
    type: sum
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${l_quantity};;
  }

  measure: total_return_item_rate {
    label: "Item Return Rate"
    view_label: "Order"
    description: "Total item return rate as Number Of Items Returned / Total Number Of Items Sold"
    type: number
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${total_returned_items} / nullif(${total_sold_items},0);;
    value_format_name: percent
  }

  measure: total_customers_number{
    label: "Number of Customers"
    view_label: "Order"
    description: "Total number of customers made at least one purchase"
    type: count_distinct
    sql: ${l_custkey} ;;
  }

  measure: avg_spend_per_customer {
    label: "Average Spend per Customer"
    view_label: "Order"
    description: "Average amount of money each customer spend"
    type: number
    sql_distinct_key: ${l_orderkey} ;;
    sql: ${total_sales_price} / nullif(${total_customers_number},0);;
    value_format_name: price
  }
}
