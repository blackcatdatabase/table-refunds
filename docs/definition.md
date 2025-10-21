<!-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00) -->
# Definition – refunds

Payment refunds and their status.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| payment_id | BIGINT UNSIGNED | NO | — | Payment (FK payments.id). |  |
| amount | DECIMAL(12,2) | NO | — | Refund amount. |  |
| currency | CHAR(3) | NO | — | ISO 4217 currency code. |  |
| reason | TEXT | YES | — | Reason provided by operator/gateway. |  |
| status | VARCHAR(50) | NO | — | Gateway/state status label. |  |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| details | JSON | YES | — | JSON details from provider. |  |
