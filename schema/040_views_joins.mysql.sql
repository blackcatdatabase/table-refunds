-- Auto-generated from joins-mysql.yaml (map@85230ed)
-- engine: mysql
-- view:   refunds_by_day_and_gateway

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_refunds_by_day_and_gateway AS
SELECT
  DATE(r.created_at) AS day,
  p.gateway,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
JOIN payments p ON p.id = r.payment_id
GROUP BY DATE(r.created_at), p.gateway
ORDER BY day DESC, gateway;

-- Auto-generated from joins-mysql.yaml (map@85230ed)
-- engine: mysql
-- view:   refunds_daily

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_refunds_daily AS
SELECT
  DATE(r.created_at) AS day,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
GROUP BY DATE(r.created_at)
ORDER BY day DESC;


-- Auto-generated from joins-mysql.yaml (map@85230ed)
-- engine: mysql
-- view:   refunds_with_payments

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_refunds_with_payments AS
SELECT
  r.id           AS refund_id,
  r.tenant_id,
  r.payment_id,
  r.amount,
  r.currency,
  r.status       AS refund_status,
  r.created_at   AS refund_created_at,
  p.gateway      AS payment_gateway,
  p.status       AS payment_status,
  p.amount       AS payment_amount,
  p.created_at   AS payment_created_at
FROM refunds r
LEFT JOIN payments p
  ON p.id = r.payment_id AND p.tenant_id = r.tenant_id;

