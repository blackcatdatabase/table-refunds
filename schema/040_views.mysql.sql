-- Auto-generated from schema-views-mysql.yaml (map@sha1:B3C579FF17AC186C47D2C4AC86B0738DB2308BF2)
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
