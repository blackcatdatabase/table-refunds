-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
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

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  refunds_by_day_and_gateway
-- Refunds aggregated by day and gateway
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_refunds_by_day_and_gateway AS
SELECT
  DATE(r.created_at) AS day,
  p.gateway,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
JOIN payments p ON p.id = r.payment_id
GROUP BY DATE(r.created_at), p.gateway
ORDER BY day DESC, gateway;


-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  refunds_daily
-- Daily refunds amount
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_refunds_daily AS
SELECT
  DATE(r.created_at) AS day,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
GROUP BY DATE(r.created_at)
ORDER BY day DESC;

