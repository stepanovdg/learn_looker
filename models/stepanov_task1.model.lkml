connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: stepanov_task1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

named_value_format: percent {
  value_format: "0.00%"
  strict_value_format: no
}

named_value_format: price {
  strict_value_format: no
  value_format: "$#,##0.00"
}

persist_with: stepanov_task1_default_datagroup

explore: d_customer {
  label: "Customers"
  view_label: "Customer"
  description: "Customers information"
}

explore: d_dates {
  label: "Dates"
  view_label: "Calendar"
  description: "Dates of orders"
}

explore: d_part {
  label: "Parts Inventory"
  view_label: "Inventory"
  description: "Parts of the order"
}

explore: d_supplier {
  label: "Suppliers Information"
  view_label: "Supplier"
  description: "Known Suppliers"
}

explore: f_lineitems {
  label: "Orders Information"
  view_label: "Order"
  description: "Completed Orders"
  join: d_customer {
    view_label: "Customer"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey} = ${d_customer.c_custkey} ;;
    relationship: many_to_one
  }

  join: commit_dates {
    from: d_dates
    view_label: "Commit Date"
    type: left_outer
    sql_on: ${f_lineitems.l_commitdatekey} = ${commit_dates.datekey} ;;
    relationship: many_to_one
  }

  join: order_dates {
    from: d_dates
    view_label: "Order Date"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey} = ${order_dates.datekey} ;;
    relationship: many_to_one
  }

  join: receipt_dates {
    from: d_dates
    view_label: "Receipt Date"
    type: left_outer
    sql_on: ${f_lineitems.l_receiptdatekey} = ${receipt_dates.datekey} ;;
    relationship: many_to_one
  }

  join: ship_dates {
    from: d_dates
    view_label: "Shipping Date"
    type: left_outer
    sql_on: ${f_lineitems.l_shipdatekey} = ${ship_dates.datekey} ;;
    relationship: many_to_one
  }

  join: d_part {
    view_label: "Inventory"
    type: left_outer
    sql_on: ${f_lineitems.l_partkey} = ${d_part.p_partkey} ;;
    relationship: many_to_one
  }

  join: d_supplier {
    view_label: "Supplier"
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey} ;;
    relationship: many_to_one
  }
}
