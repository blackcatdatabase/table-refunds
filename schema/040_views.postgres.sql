-- Auto-generated from schema-views-postgres.yaml (map@sha1:3C365C10BD489376A27944AE10F143E1BE4D3BCF)
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
