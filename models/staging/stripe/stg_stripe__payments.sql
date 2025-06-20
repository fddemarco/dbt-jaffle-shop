select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_methd,
    status,
    amount / 100 as amount,
    created as created_at
from {{ source('stripe', 'payments') }}