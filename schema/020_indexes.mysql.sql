-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  refunds

CREATE INDEX idx_refunds_payment ON refunds (payment_id);
