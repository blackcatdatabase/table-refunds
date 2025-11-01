-- Auto-generated from schema-map-postgres.psd1 (map@c5e4097)
-- engine: postgres
-- table:  refunds
CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);
