-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  refunds
CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);

CREATE INDEX IF NOT EXISTS idx_refunds_tenant_payment ON refunds (tenant_id, payment_id);
