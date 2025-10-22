-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: refunds
ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE;
