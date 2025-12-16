-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  refunds

CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id);

CREATE INDEX IF NOT EXISTS idx_refunds_tenant_payment ON refunds (tenant_id, payment_id);
