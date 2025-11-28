-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  refunds

CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);

CREATE INDEX IF NOT EXISTS idx_refunds_tenant_payment ON refunds (tenant_id, payment_id);
