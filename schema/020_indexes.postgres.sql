-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  refunds

CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);

CREATE INDEX IF NOT EXISTS idx_refunds_tenant_payment ON refunds (tenant_id, payment_id);
