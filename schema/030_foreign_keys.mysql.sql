-- Auto-generated from schema-map-mysql.psd1 (map@c5e4097)
-- engine: mysql
-- table:  refunds
ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (payment_id) REFERENCES payments(id) ON DELETE CASCADE;

ALTER TABLE refunds ADD CONSTRAINT chk_refunds_amount CHECK (amount >= 0);
