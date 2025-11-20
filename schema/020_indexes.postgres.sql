-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  refunds
CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);

CREATE INDEX IF NOT EXISTS idx_refunds_tenant_payment ON refunds (tenant_id, payment_id);
