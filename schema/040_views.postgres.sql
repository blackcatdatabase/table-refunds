-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  refunds
-- Contract view for [refunds]
CREATE OR REPLACE VIEW vw_refunds AS
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

-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  refunds_by_day_and_gateway
-- Refunds aggregated by day and gateway
CREATE OR REPLACE VIEW vw_refunds_by_day_and_gateway AS
SELECT
  date_trunc(''day'', r.created_at) AS day,
  p.gateway,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
JOIN payments p ON p.id = r.payment_id
GROUP BY 1,2
ORDER BY day DESC, gateway;


-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  refunds_daily
-- Daily refunds amount
CREATE OR REPLACE VIEW vw_refunds_daily AS
SELECT
  date_trunc(''day'', r.created_at) AS day,
  SUM(r.amount) AS refunds_total,
  COUNT(*)      AS refunds_count
FROM refunds r
GROUP BY 1
ORDER BY day DESC;

