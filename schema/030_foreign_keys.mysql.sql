-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  refunds
ALTER TABLE refunds ADD CONSTRAINT fk_refunds_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (tenant_id, payment_id) REFERENCES payments(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE refunds ADD CONSTRAINT chk_refunds_amount CHECK (amount >= 0);
