SELECT 
  CAST(FROM_UNIXTIME(a.time)as varchar) AS change_date, 
  a.event_name, 
  a.resource_name, 
  a.resource_id, 
  a.user_email, 
  a.id,
  change_count
FROM td_audit_log.access AS a
JOIN ${td.database}.counts_of_table_drops_and_creates_last_${anomaly_range_days}_days AS b
ON a.resource_name = b.resource_name AND a.event_name = b.event_name
WHERE 
  (a.event_name LIKE 'table_create' OR a.event_name LIKE 'table_delete') 
  AND a.time > TO_UNIXTIME(date_trunc('day',now()))-(86400*${lookback_range_days})
  AND a.resource_name <> ANY (VALUES ${exclude_tables})