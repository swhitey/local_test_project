connection: "thelook"

# include: "*.view.lkml"
# include: "*.dashboard.lookml"



explore: test {
  hidden: yes
}


view: test  {
  derived_table: {
    sql:
      SELECT 'foo' as some_string, 1 as some_num, '2017-12-31' as some_date
      UNION ALL
      SELECT 'bar' as some_string, 2 as some_num, '2017-12-30' as some_date
      UNION ALL
      SELECT 'bar' as some_string, 3 as some_num, '2017-12-29' as some_date
      UNION ALL
      SELECT 'bar' as some_string, 4 as some_num, '2017-12-28' as some_date
      ;;
  }

  dimension: some_string {
    type: string
  }

  dimension: some_num {
    type: number
  }

  dimension_group: some_date {
    type: time
  }

  measure: count {
    type: count
  }
}
