INSERT INTO ${td.table}_bk SELECT * FROM ${td.table} WHERE TD_TIME_RANGE(time, null, TD_TIME_ADD(TD_SCHEDULED_TIME(), '-30d'))
