-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-11-27T15:35:35Z)
-- engine: mysql
-- table:  refunds

-- Contract view for [refunds]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_refunds AS
SELECT
  id,
  tenant_id,
  payment_id,
  amount,
  currency,
  reason,
  status,
  created_at,
  details
FROM refunds;
