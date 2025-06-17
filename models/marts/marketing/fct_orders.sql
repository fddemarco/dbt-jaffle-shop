select
    order_id, customer_id, order_date, coalesce(sum(case when t2.status = 'success' then amount end), 0) as amount
from {{ ref("stg_jaffle_shop__orders") }} t1
inner join {{ ref("stg_stripe__payments") }} t2 using (order_id)
group by 1, 2, 3
