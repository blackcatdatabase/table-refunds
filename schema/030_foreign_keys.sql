-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: refunds
ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE;
