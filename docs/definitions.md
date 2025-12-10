# refunds

Payment refunds and their status.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |
| payment_id | BIGINT | NO |  | Payment (FK payments.id). |
| amount | mysql: DECIMAL(12,2) / postgres: NUMERIC(12,2) | NO |  | Refund amount (>= 0). |
| currency | CHAR(3) | NO |  | ISO 4217 currency code. |
| reason | TEXT | YES |  | Reason provided by operator/gateway. |
| status | VARCHAR(50) | NO |  | Gateway/state status label. |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| details | mysql: JSON / postgres: JSONB | YES |  | JSON details from provider. |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_refunds_payment | payment_id | CREATE INDEX idx_refunds_payment ON refunds (payment_id) |
| idx_refunds_tenant_payment | tenant_id,payment_id | INDEX idx_refunds_tenant_payment (tenant_id, payment_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_refunds_payment | tenant_id,payment_id | payments(tenant_id,id) | ON DELETE CASCADE |
| fk_refunds_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_refunds_payment | payment_id | CREATE INDEX IF NOT EXISTS idx_refunds_payment ON refunds (payment_id) |
| idx_refunds_tenant_payment | tenant_id,payment_id | CREATE INDEX IF NOT EXISTS idx_refunds_tenant_payment ON refunds (tenant_id, payment_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_refunds_payment | tenant_id,payment_id | payments(tenant_id,id) | ON DELETE CASCADE |
| fk_refunds_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_refunds | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_refunds_by_day_and_gateway | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_refunds_daily | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_refunds_with_payments | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_refunds | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_refunds_by_day_and_gateway | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
| vw_refunds_daily | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
| vw_refunds_with_payments | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
