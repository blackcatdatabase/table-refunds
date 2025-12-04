-- Auto-generated from schema-map-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  refunds

CREATE INDEX idx_refunds_payment ON refunds (payment_id);
