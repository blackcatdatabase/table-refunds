# refunds

Payment refunds and their status.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| amount | NUMERIC(12,2) | NO |  | Refund amount (>= 0). |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| currency | CHAR(3) | NO |  | ISO 4217 currency code. |
| details | JSONB | YES |  | JSON details from provider. |
| id | BIGINT | NO |  | Surrogate primary key. |
| payment_id | BIGINT | NO |  | Payment (FK payments.id). |
| reason | TEXT | YES |  | Reason provided by operator/gateway. |
| status | VARCHAR(50) | NO |  | Gateway/state status label. |

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
| vw_refunds | mysql | algorithm=MERGE, security=INVOKER | [packages\refunds\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views.mysql.sql) |
| vw_refunds_by_day_and_gateway | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\refunds\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views_joins.mysql.sql) |
| vw_refunds_daily | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\refunds\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views_joins.mysql.sql) |
| vw_refunds_with_payments | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\refunds\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views_joins.mysql.sql) |
| vw_refunds | postgres |  | [packages\refunds\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views.postgres.sql) |
| vw_refunds_by_day_and_gateway | postgres |  | [packages\refunds\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views_joins.postgres.sql) |
| vw_refunds_daily | postgres |  | [packages\refunds\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views_joins.postgres.sql) |
| vw_refunds_with_payments | postgres |  | [packages\refunds\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/refunds/schema/040_views_joins.postgres.sql) |
