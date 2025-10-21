-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: refunds
CREATE TABLE IF NOT EXISTS refunds (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  payment_id BIGINT UNSIGNED NOT NULL,
  amount DECIMAL(12,2) NOT NULL,
  currency CHAR(3) NOT NULL,
  reason TEXT NULL,
  status VARCHAR(50) NOT NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  details JSON NULL,
  CONSTRAINT chk_refunds_currency CHECK (currency REGEXP ''^[A-Z]{3}$'')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
