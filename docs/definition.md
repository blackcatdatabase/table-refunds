<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – refunds

Payment refunds and their status.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — |  |  |
| payment_id | BIGINT | NO | — | Payment (FK payments.id). |  |
| amount | NUMERIC(12,2) | NO | — | Refund amount (>= 0). |  |
| currency | CHAR(3) | NO | — | ISO 4217 currency code. |  |
| reason | TEXT | YES | — | Reason provided by operator/gateway. |  |
| status | VARCHAR(50) | NO | — | Gateway/state status label. |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| details | JSONB | YES | — | JSON details from provider. |  |