-- Auto-generated from schema-map-postgres.psd1 (map@38d5403)
-- engine: postgres
-- table:  refunds
CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);
