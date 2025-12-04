-- Auto-generated from schema-map-mysql.yaml (map@74ce4f4)
-- engine: mysql
-- table:  refunds

CREATE INDEX idx_refunds_payment ON refunds (payment_id);
