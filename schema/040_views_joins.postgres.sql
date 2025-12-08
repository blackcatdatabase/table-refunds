-- Auto-generated from joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   refunds_by_day_and_gateway

-- Refunds aggregated by day and gateway
CREATE OR REPLACE VIEW vw_refunds_by_day_and_gateway AS
SELECT
  date_trunc('day', r.created_at) AS day,
  p.gateway,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
JOIN payments p ON p.id = r.payment_id
GROUP BY 1,2
ORDER BY day DESC, gateway;

-- Auto-generated from joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   refunds_daily

-- Daily refunds amount
CREATE OR REPLACE VIEW vw_refunds_daily AS
SELECT
  date_trunc($$day$$, r.created_at) AS day,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
GROUP BY 1
ORDER BY day DESC;


-- Auto-generated from joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   refunds_with_payments

-- Refunds joined to their payment
CREATE OR REPLACE VIEW vw_refunds_with_payments AS
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

