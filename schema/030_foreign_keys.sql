-- Auto-generated from schema-map.psd1 (map@6cefe8e)
-- table: refunds
ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE;
