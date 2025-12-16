-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  refunds

ALTER TABLE refunds ADD CONSTRAINT fk_refunds_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (tenant_id, payment_id) REFERENCES payments(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE refunds ADD CONSTRAINT chk_refunds_amount CHECK (amount >= 0);
